import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid

    func applicationDidEnterBackground(_ application: UIApplication) {
        startBackgroundTask()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        endBackgroundTask()
    }

    private func startBackgroundTask() {
        backgroundTask = UIApplication.shared.beginBackgroundTask {
            self.endBackgroundTask()
        }
    }

    private func endBackgroundTask() {
        if backgroundTask != .invalid {
            UIApplication.shared.endBackgroundTask(backgroundTask)
            backgroundTask = .invalid
        }
    }
}
