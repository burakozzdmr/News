//
//  SettingsViewController.swift
//  News
//
//  Created by Burak Özdemir on 20.08.2025.
//

import UIKit
import SnapKit

protocol SettingsViewControllerProtocol: AnyObject {
    
}

// MARK: - SettingsViewController

class SettingsViewController: UIViewController {

    // MARK: Properties
    
    private lazy var settingsTableView: UITableView = {
        let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private let viewModel: SettingsViewModel
    
    // MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    // MARK: Inits
    
    init(viewModel: SettingsViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.controllerDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Privates

private extension SettingsViewController {
    func configureView() {
        addViews()
        configureLayout()
    }
    
    func addViews() {
        view.addSubview(settingsTableView)
    }
    
    func configureLayout() {
        settingsTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return .init()
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - SettingsControllerProtocol

extension SettingsViewController: SettingsViewControllerProtocol {
    
}
