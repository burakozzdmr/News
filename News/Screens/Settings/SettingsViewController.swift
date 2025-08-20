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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.settingsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.settingsList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        let currentCell = viewModel.settingsList[indexPath.section]
        let settingsType = currentCell[indexPath.row].settingsType
        
        cell.tintColor = .label
        cell.textLabel?.text = currentCell[indexPath.row].settingsName
        cell.imageView?.image = .init(systemName: currentCell[indexPath.row].settingsIcon)
        
        switch settingsType {
        case .theme:
            let segmentedControl = UISegmentedControl(items: ["Auto","Light", "Dark"])
            segmentedControl.selectedSegmentIndex = 0
            cell.accessoryView = segmentedControl
            
        case .notification:
            let notificationSwitch = UISwitch()
            cell.accessoryView = notificationSwitch
        case .rateUs, .privacyPolicy, .termsOfUse:
            cell.selectionStyle = .default
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SettingsControllerProtocol

extension SettingsViewController: SettingsViewControllerProtocol {
    
}
