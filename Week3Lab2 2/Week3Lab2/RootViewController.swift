//
//  RootViewController.swift
//  Week3Lab2
//
//  Created by Sara Sd on 20/01/1445 AH.
//

import Foundation
import UIKit
import SnapKit

class RootViewController: UIViewController {
    
    let mustPopular: MustPopularCollectionView = .init() // MustPopularCollectionView()
    let lifeStyle: LifestyleCollectionView = .init() // LifestyleCollectionView()
    let health: HealthCollectionView = .init() // HealthCollectionView()
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureMustPopular()
        configureLifeStyle()
        configureHealth()
        self.title = "Pesonlize your feed"
        button.backgroundColor = .gray
        button.setTitle("0 selected", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        self.view.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(health.snp.bottom)
            $0.width.equalTo(self.view.frame.width - 32)
            $0.height.equalTo(50)
            $0.leading.equalTo(16)
        }
    }
    func configureMustPopular() {
        self.view.addSubview(mustPopular)
        mustPopular.snp.makeConstraints {
            $0.top.equalTo(100)
            $0.width.equalTo(self.view.frame.width - 32)
            $0.height.equalTo(200 + 16)
            $0.leading.equalTo(16)
        }
    }
    
    func configureLifeStyle() {
        self.view.addSubview(lifeStyle)
        lifeStyle.snp.makeConstraints {
            $0.top.equalTo(mustPopular.snp.bottom)
            $0.width.equalTo(self.view.frame.width - 32)
            $0.height.equalTo(200 + 16)
            $0.leading.equalTo(16)
        }
    }
    func configureHealth() {
        self.view.addSubview(health)
        health.snp.makeConstraints {
            $0.top.equalTo(lifeStyle.snp.bottom)
            $0.width.equalTo(self.view.frame.width - 32)
            $0.height.equalTo(200 + 16)
            $0.leading.equalTo(16)
        }
    }
    @objc func buttonAction(sender: UIButton!) {
        
    }
}




