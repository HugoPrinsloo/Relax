//
//  ShelfViewController.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/14.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class NewShelfViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var items: [RelaxObject] = RelaxSampleData.items
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "RelaxContentCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
}

extension NewShelfViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RelaxContentCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}
