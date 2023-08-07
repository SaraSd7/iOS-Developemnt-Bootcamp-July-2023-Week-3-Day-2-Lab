//
//  MustPopularCollectionView.swift
//  Week3Lab2
//
//  Created by Sara Sd on 20/01/1445 AH.
//

import Foundation
import UIKit
import SnapKit

class MustPopularCollectionView: UIView {
    
    
    let categories: Array<String> = [
        "U.S Politics",
        "Tech Campanies",
        "TV & Movies",
        "Recipes",
        "Travel",
        "Celebs",
        "Resturants"
    ]
    
    var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    init() {
        super.init(frame: .zero)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 110, height: 50)
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
        //        configureTextField()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MustPopularCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return categories.count
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        let lable = UILabel()
        lable.text = categories[indexPath.item]
        lable.textAlignment = .center
        //        lable.tintColor = .blue
        //        lable.backgroundColor = .orange
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
