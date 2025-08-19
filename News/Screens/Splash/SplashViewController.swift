//
//  ViewController.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import UIKit
import SnapKit

// MARK: - SplashViewController

class SplashViewController: UIViewController {

    // MARK: Properties
    
    private let appLogoImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.image = .init(systemName: "newspaper.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let appNameLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "News"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        splashToTabBar()
    }
    
    // MARK: Publics
    
    func splashToTabBar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                return
            }
            
            let newsListNavController = UINavigationController(rootViewController: NewsListViewController())
            
            UIView.transition(with: self.view, duration: 0.75, options: .transitionCrossDissolve) {
                sceneDelegate.window?.rootViewController = newsListNavController
            }
        }
    }
}

// MARK: - Private

private extension SplashViewController {
    func configureView() {
        addViews()
        configureLayout()
        
        view.backgroundColor = .systemBackground
    }
    
    func addViews() {
        view.addSubviews(
            appLogoImageView,
            appNameLabel
        )
    }
    
    func configureLayout() {
        appLogoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(216)
            $0.height.equalTo(240)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(appLogoImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
}
