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
    }
    
    func configure(with relaxObject: RelaxFile) {
        coverImageView.downloadedFrom(url: URL(string: relaxObject.thumbnailURL)!)
        titleLabel.text = relaxObject.title
    }

}

extension UIImageView {
    func downloadedFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url)
    }
}

