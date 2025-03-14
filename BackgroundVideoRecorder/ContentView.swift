import SwiftUI

struct ContentView: View {
    @State private var isRecording = false

    var body: some View {
        Color.black
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                toggleRecording()
            }
            .onAppear {
                UIApplication.shared.isIdleTimerDisabled = true
            }
    }

    private func toggleRecording() {
        if isRecording {
            CameraManager.shared.stopRecording()
        } else {
            CameraManager.shared.startRecording()
        }
        isRecording.toggle()
    }
}
