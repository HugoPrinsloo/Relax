//
//  RelaxContentCell.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/14.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import SDWebImage

class RelaxContentCell: UICollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            coverImageView.layer.cornerRadius = 8
            coverImageView.clipsToBounds = true
        coverImageView.backgroundColor = Color.washoutBlue
    }
    
    func configure(with relaxObject: RelaxObject) {
        coverImageView.sd_setImage(with: URL(string: relaxObject.thumbnailURL), placeholderImage: UIImage(named: "placeholder"), options: [.continueInBackground, .progressiveDownload], progress: nil, completed: nil)
        titleLabel.text = relaxObject.title
    }
}


