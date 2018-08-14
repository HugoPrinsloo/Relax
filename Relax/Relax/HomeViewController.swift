//
//  ViewController.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/14.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.midBlue
        collectionView.register(UINib(nibName: "RelaxContentCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RelaxContentCell
        
        return cell
    }
}
