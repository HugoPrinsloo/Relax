//
//  RelaxObject.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/14.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

struct RelaxObject {
    let title: String
    let coverImage: UIImage
}

struct RelaxSampleData {
    static let items: [RelaxObject] = [RelaxObject(title: "Docks", coverImage: UIImage(named: "docks")!),
                                RelaxObject(title: "Camp fire", coverImage: UIImage(named: "fire")!),
                                RelaxObject(title: "Forest", coverImage: UIImage(named: "forest")!),
                                RelaxObject(title: "Ocean drive", coverImage: UIImage(named: "ocean")!),
                                RelaxObject(title: "Wind", coverImage: UIImage(named: "wind")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample1")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample2")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample3")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample4")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample5")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample6")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample7")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample8")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample9")!),
                                RelaxObject(title: "Some title", coverImage: UIImage(named: "sample10")!),
]
}
