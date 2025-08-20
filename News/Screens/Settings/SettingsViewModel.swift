//
//  SettingsViewModel.swift
//  News
//
//  Created by Burak Özdemir on 20.08.2025.
//

import Foundation

// MARK: - SettingsViewModelProtocol

protocol SettingsViewModelProtocol: AnyObject {
    
}

class SettingsViewModel {
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
    
}
