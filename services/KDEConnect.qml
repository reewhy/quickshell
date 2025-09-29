// PhoneBatteryService.qml
pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    
    property int batteryPercentage: -1
    property bool isConnected: false

    property string materialSymbol:
        KDEConnect.batteryPercentage > 86 ? "battery_android_full" :
        KDEConnect.batteryPercentage > 72 ? "battery_android_6" :
        KDEConnect.batteryPercentage > 58 ? "battery_android_5" :
        KDEConnect.batteryPercentage > 44 ? "battery_android_4" :
        KDEConnect.batteryPercentage > 30 ? "battery_android_3" :
        KDEConnect.batteryPercentage > 16 ? "battery_android_2" :
        "battery_android_1"

    property var batteryProcess: Process {
        command: [
            "bash", "-c",
            "busctl --user get-property org.kde.kdeconnect /modules/kdeconnect/devices/$(kdeconnect-cli -a --id-only)/battery org.kde.kdeconnect.device.battery charge | awk '{print $2}'"
        ]
        
        stdout: SplitParser {
            onRead: data => {
                if (data === null || data === undefined) {
                    console.log("No data received")
                    return
                }
                
                const output = data.trim()
                console.log("Battery output:", output)
                const percentage = parseInt(output)
                
                if (!isNaN(percentage) && percentage >= 0 && percentage <= 100) {
                    root.batteryPercentage = percentage
                    root.isConnected = true
                    console.log("Phone battery:", percentage + "%")
                } else {
                    root.isConnected = false
                    console.log("Invalid percentage:", output)
                }
            }
        }
        
        stderr: SplitParser {
            onRead: data => {
                if (data) console.log("Error:", data)
            }
        }
        
        onExited: (code, status) => {
            console.log("Process exited with code:", code)
            if (code !== 0) {
                root.isConnected = false
            }
        }
        
        onStarted: () => {
            console.log("Process started")
        }
    }
    
    property var timer: Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: root.updateBattery()
    }
    
    function updateBattery() {
        console.log("Updating battery...")
        batteryProcess.running = true
    }
    
    Component.onCompleted: {
        updateBattery()
    }
}
