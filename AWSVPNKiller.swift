import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(handleSleepNotification), name: NSWorkspace.willSleepNotification, object: nil)
        NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(handleWakeNotification), name: NSWorkspace.didWakeNotification, object: nil)
    }

    @objc func handleSleepNotification(notification: NSNotification) {
        killAWSVPNClient()    
    }

    @objc func handleWakeNotification(notification: NSNotification) {
        //restartAWSVPNClient()
    }

    func killAWSVPNClient() {
        let task = Process()
        task.launchPath = "/usr/bin/pkill"
        task.arguments = ["AWS VPN Client"]
        task.launch()
        task.waitUntilExit()
        print("Killed AWS VPN Client 💀")
    }

    func restartAWSVPNClient() {
        let task = Process()
        task.launchPath = "/usr/bin/open"
        task.arguments = ["-a", "/Applications/AWS VPN Client/AWS VPN Client.app/Contents/MacOS/AWS VPN Client"]
        task.launch()
        task.waitUntilExit()
        print("Restarted AWS VPN Client 🐣")
    }
}

print("Oh hi Mark!")
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()
