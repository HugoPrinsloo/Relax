//
//  NatureViewController.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/15.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class NatureViewController: UIViewController {

    private let contentManager = RelaxContentManager()
    private let type: Type = .nature
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "RelaxContentCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        contentManager.fetch { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension NatureViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentManager.numberOfItems(for: type)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RelaxContentCell
        cell.configure(with: contentManager.itemAtIndex(indexPath.item, type: type))
        return cell
    }
    
    
}

