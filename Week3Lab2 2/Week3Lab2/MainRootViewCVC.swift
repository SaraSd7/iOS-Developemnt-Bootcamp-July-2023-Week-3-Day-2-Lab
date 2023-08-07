//
//  MainRootViewCVC.swift
//  Week3Lab2
//
//  Created by  on 8/7/23.
//

import UIKit

private let reuseIdentifier = "Cell"

//import SnapKit

class MainRootViewCVC: UIViewController {
    
    lazy var data: [String : [String]] = [
        "Most Popular": ["U.S Politics",
                         "Tech Campanies",
                         "TV & Movies",
                         "Recipes",
                         "Travel",
                         "Celebs",
                         "Resturants"],
        
        "LifeStyle": [ "Travel Tips",
                       "Luxury Homes",
                       "Architecture",
                       "Interior Design",
                       "Fashion",
                       "Men's Style",
                       "Cars",
                       "Wine & Drinks",
                       "Home Products",
                       "Kitchen Products"],
        
        "Health": ["Health", "Exercise"]
    ]
    
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Personalize your feed"
        label.font = .boldSystemFont(ofSize: 30)
        label.backgroundColor = .red
        label.textAlignment = .center
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select 10 or more topics"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .green
        label.textAlignment = .center
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier) // Cell
        
        collectionView.register(UICollectionViewCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "header") // Header
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = true
        return collectionView
    }()
    
    lazy var bottomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Selection", for: .normal)
        button.backgroundColor = .systemGray5
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        view.addSubview(bottomButton)
        bottomButton.snp.makeConstraints { make in
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view).inset(30)
            make.right.equalTo(self.view)
        }
        
    }
}


extension MainRootViewCVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.keys.count + 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return .init(width: view.frame.width, height: 50)
        case 1:
            return .init(width: view.frame.width, height: 50)
        default:
            return CGSize(width: Array(data.values)[indexPath.section - 2].sorted(by: {$0 > $1})[indexPath.row].size(withAttributes: [.font : UIFont.systemFont(ofSize: 17)]).width + 10, height: 40)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "header",
                                                                         for: indexPath)
        switch indexPath.section {
        case 0:
            return headerView
        case 1:
            return headerView
        default:
            let title = UILabel(frame: CGRect(x: 0, y: 0, width: headerView.bounds.size.width, height: 50))
            title.text = "\t" + Array(data.keys).sorted(by: {$0 > $1})[indexPath.section - 2]
            title.textAlignment = .left
            title.font = .boldSystemFont(ofSize: 24)
            headerView.addSubview(title)
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return .init()
        case 1:
            return .init()
        default:
            return .init(width: view.frame.size.width, height: 50)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return Array(data.values)[section - 2].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        switch indexPath.section {
        case 0:
            let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
            title.text = "Personalize your feed"
            title.font = .boldSystemFont(ofSize: 25)
            title.textAlignment = .center
            cell.contentView.addSubview(title)
        case 1:
            let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
            title.text = "Select 10 or more topics"
            title.textAlignment = .center
            cell.contentView.addSubview(title)
        default:
            cell.backgroundColor = .systemGray6
            cell.layer.cornerRadius = 10
            let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
            title.text = Array(data.values)[indexPath.section - 2].sorted(by: {$0 > $1})[indexPath.row]
            title.textAlignment = .center
            cell.contentView.addSubview(title)
        }
        return cell
    }
    
    
}
