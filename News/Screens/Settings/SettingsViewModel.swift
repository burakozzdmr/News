//
//  SettingsViewModel.swift
//  News
//
//  Created by Burak Özdemir on 20.08.2025.
//

import Foundation
import UserNotifications

// MARK: - SettingsViewModelProtocol

protocol SettingsViewModelProtocol: AnyObject {
    func themeDidChange(mod: Int)
    func updateNotification(isOn: Bool)
    func fetchNotificationStatus(_ completion: @escaping (Bool) -> Void)
    func selectedItem(_ item: SettingsModel)
}

class SettingsViewModel {
    private let defaults = UserDefaults.standard
    private let themeKey = "themeKey"
    private(set) var settingsList: [[SettingsModel]] = [
        [SettingsModel(settingsIcon: "circle.lefthalf.filled", settingsName: "App Theme", settingsType: .theme)],
        [SettingsModel(settingsIcon: "bell.fill", settingsName: "Notification", settingsType: .notification)],
        [SettingsModel(settingsIcon: "star.fill", settingsName: "Rate Us", settingsType: .rateUs)],
        [
            SettingsModel(settingsIcon: "text.document.fill", settingsName: "Privacy Policy", settingsType: .privacyPolicy),
            SettingsModel(settingsIcon: "checkmark.shield.fill", settingsName: "Terms of Use", settingsType: .termsOfUse)
        ]
    ]
    
    weak var viewModelDelegate: SettingsViewModelProtocol?
    weak var controllerDelegate: SettingsViewControllerProtocol?
    
    init() {
        viewModelDelegate = self
    }
}

extension SettingsViewModel: SettingsViewModelProtocol {
    func themeDidChange(mod: Int) {
        UserDefaults.standard.set(mod, forKey: themeKey)
        controllerDelegate?.didChangeTheme(mod)
        
    }
    
    func updateNotification(isOn: Bool) {
        guard isOn else {
            controllerDelegate?.didUpdateNotification(false)
            return
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, _ in
            DispatchQueue.main.async {
                self?.controllerDelegate?.didUpdateNotification(granted)
            }
        }
    }
    
    func fetchNotificationStatus(_ completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { status in
            DispatchQueue.main.async {
                completion(status.authorizationStatus == .authorized)
            }
        }
    }
    
    func selectedItem(_ item: SettingsModel) {
        switch item.settingsType {
        case .rateUs, .privacyPolicy, .termsOfUse:
            self.controllerDelegate?.openURL("https://google.com")
        default:
            break
        }
    }
}
