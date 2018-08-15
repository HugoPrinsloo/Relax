//
//  RelaxContentCell.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/14.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class RelaxContentCell: UICollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coverImageView.backgroundColor = Color.heartRed
        coverImageView.layer.cornerRadius = 8
        coverImageView.clipsToBounds = true
    }
    
    func configure(with relaxObject: RelaxObject) {
//        coverImageView.image = relaxObject.coverImage
//        titleLabel.text = relaxObject.title
    }
}
