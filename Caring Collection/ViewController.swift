//
//  ViewController.swift
//  Caring Collection
//
//  Created by Sergei Semko on 5/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Constants {
        static let cellWidth: CGFloat = 300
        static let cellSpacing: CGFloat = 10
        static let cellIdentifier: String = "cell"
    }

    private lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: Constants.cellWidth, height: 400)
        collectionViewFlowLayout.minimumLineSpacing = Constants.cellSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: view.layoutMargins.left, bottom: 0, right: 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let cellWidthWithSpacing = Constants.cellWidth + Constants.cellSpacing
        let offset = targetContentOffset.pointee.x
        let index = round(offset / cellWidthWithSpacing)
        let newOffset = index * cellWidthWithSpacing
        
        targetContentOffset.pointee.x = newOffset
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        return cell
    }
}

