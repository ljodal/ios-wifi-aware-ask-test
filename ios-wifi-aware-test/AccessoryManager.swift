//
//  AccessoryManager.swift
//  ios-wifi-aware-test
//
//  Created by Sigurd Ljødal on 07/07/2025.
//

import AccessorySetupKit

actor AccessoryManager: Observable {

    private var _session: ASAccessorySession?
    private var session: ASAccessorySession {
        guard let session = _session else {
            fatalError("AccessoryManager accessed before initialization")
        }
        return session
    }

    func initialize() {
        guard _session == nil else {
            print("AccessoryManager already initialized")
            return
        }
        _session = ASAccessorySession()
    }

    func activate() async {
        initialize()

        // Create and activate session
        session.activate(on: DispatchQueue.main) { event in
            // Closure will execute when device is added with event: .accessoryAdded
            // ASAccessoryWiFiAwarePairedDeviceID can be used to lookup a WAPairedDevice
        }
    }

    func showPicker() {
        // Present Picker UI
        session.showPicker(for: [pickerDisplayItem]) { error in
            // Handle error
            print("Error occured when showing accessory picker: \(String(describing: error))")
        }
    }

    private var pickerDisplayItem: ASPickerDisplayItem {
        // Configure ASDiscoveryDescriptor (Subscriber)
        let descriptor = ASDiscoveryDescriptor()
        descriptor.wifiAwareServiceName = "_sat-simulation._udp"
        return ASPickerDisplayItem(name: "My Dice",
                                       productImage: UIImage(named: "blue_dice")!,
                                       descriptor: descriptor)
    }
}
