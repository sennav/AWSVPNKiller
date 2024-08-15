![Banner](./assets/banner.webp)

# AWSVPNKiller: The Silent Killer of AWS VPN clients

Welcome to **AWSVPNKiller**, the solution to avoid the annoying browser tabs open that AWS VPN Client creates during your MacBook's sleep and wake cycles.

🌟 **Features** 🌟

- Kills the "AWS VPN Client" when your MacBook goes to sleep.
- Optionally restarts the "AWS VPN Client" when your MacBook wakes up.


🛠️ **Installation Instructions** 🛠️

1. **Clone the Repository**

```sh
git clone https://github.com/sennav/AWSVPNKiller.git
cd AWSVPNKiller
```

2. **Compile the Code**

```sh
swiftc -o AWSVPNKiller AWSVPNKiller.swift
```

3. **Run the Code to test**

```sh
./AWSVPNKiller
```

Ctrl+c to kill it.

💡 **To Restart or Not to Restart?** 💡

This repo is set to not restart the AWS VPN Client by default. To change this behavior, uncomment the `restartAWSVPNClient()` call in `AWSVPNKiller.swift`:

```swift
@objc func handleWakeNotification(notification: NSNotification) {
    print("System woke up")
    // restartAWSVPNKiller()  // Uncomment this line to restart the VPN
}
```

🚀 **Add to Launch Agents** 🚀

To run AWSVPNKiller in the background and have it start automatically:

1. **Copy the Launch Agent plist File**

```sh
cp org.sanity.AWSVPNKiller.plist ~/Library/LaunchAgents/
# Or create a symlink
```

2. **Load the Launch Agent**

```sh
launchctl load ~/Library/LaunchAgents/org.sanity.AWSVPNKiller.plist
```

3. **Verify that the Launch Agent is Running**

```sh
launchctl list | grep AWSVPNKiller
```


Thank you for using AWSVPNKiller! Enjoy your VPN-free naps and worry-free tab-less wake-ups. 💤
