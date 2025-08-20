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
    
    weak var viewModelDelegate: SettingsViewModelProtocol?
    weak var controllerDelegate: SettingsViewControllerProtocol?
    
    init() {
        viewModelDelegate = self
    }
}

extension SettingsViewModel: SettingsViewModelProtocol {
    
}
