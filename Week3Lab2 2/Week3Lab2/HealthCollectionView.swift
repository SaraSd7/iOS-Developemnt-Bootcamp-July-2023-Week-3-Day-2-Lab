//
//  HealthCollectionView.swift
//  Week3Lab2
//
//  Created by Sara Sd on 20/01/1445 AH.
//

import Foundation
import UIKit
import SnapKit

class HealthCollectionView: UIView {
    
    
    let categories: Array<String> = [
       "Health",
       "Exercise"
    ]
    
    var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    init() {
        super.init(frame: .zero)
        let layout = UICollectionViewFlowLayout()
          layout.itemSize = CGSize(width: 100, height: 50)
          layout.minimumLineSpacing = 4
          layout.minimumInteritemSpacing = 4
//          layout.scrollDirection = .vertical
          collectionView = .init(frame: .zero, collectionViewLayout: layout)
          collectionView.dataSource = self
          collectionView.delegate = self
          collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
          collectionView.showsHorizontalScrollIndicator = false
          self.addSubview(collectionView)
          collectionView.snp.makeConstraints {
              $0.leading.top.trailing.bottom.equalTo(0)
          }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HealthCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categories.count
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        let lable = UILabel()
        lable.text = categories[indexPath.item]
        lable.textAlignment = .center
        cell.addSubview(lable)
        lable.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalTo(cell)
        }
        cell.backgroundColor = .gray.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 5
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
