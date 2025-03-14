import AVFoundation
import UIKit

class CameraManager: NSObject {
    static let shared = CameraManager()

    private var captureSession: AVCaptureSession?
    private var videoOutput: AVCaptureMovieFileOutput?
    private var outputURL: URL?

    override init() {
        super.init()
        setupSession()
    }

    private func setupSession() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .high

        guard let captureSession = captureSession else { return }

        // Set up the video input (rear camera only)
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Error: Could not get video device")
            return
        }

        do {
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }
        } catch {
            print("Error setting up video input: \(error)")
            return
        }

        // Set up video output
        videoOutput = AVCaptureMovieFileOutput()
        if let videoOutput = videoOutput, captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }

        captureSession.startRunning()
    }

    // MARK: - Start Recording
    func startRecording() {
        guard let captureSession = captureSession, captureSession.isRunning, let videoOutput = videoOutput else {
            print("Session is not running or videoOutput is missing")
            return
        }

        let fileManager = FileManager.default
        let tempDir = fileManager.temporaryDirectory
        let fileURL = tempDir.appendingPathComponent("video.mp4")

        // Remove existing file if needed
        if fileManager.fileExists(atPath: fileURL.path) {
            try? fileManager.removeItem(at: fileURL)
        }

        videoOutput.startRecording(to: fileURL, recordingDelegate: self)
        outputURL = fileURL

        print("Recording started...")
    }

    // MARK: - Stop Recording
    func stopRecording() {
        guard let videoOutput = videoOutput, videoOutput.isRecording else {
            print("No active recording found")
            return
        }

        videoOutput.stopRecording()
        print("Recording stopped...")
    }
}

// MARK: - AVCaptureFileOutputRecordingDelegate
extension CameraManager: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            print("Recording error: \(error.localizedDescription)")
        } else {
            print("Recording saved to: \(outputFileURL.absoluteString)")
        }
    }
}
