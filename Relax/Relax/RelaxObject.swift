//
//  RelaxObject.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/14.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import CloudKit

struct RelaxObject {
    let title: String
    let coverImage: UIImage

}

enum Type {
    case featured
    case nature
    case ocean
    case unknown
}

struct RelaxFile {
    
    let title: String
    let thumbnailURL: String
    let soundURL: String
    let availableDate: Date
    let type: Type
    let featured: Bool
    
    init(record: CKRecord) {
        func typeStringToType(_ type: String) -> Type {
            switch type {
            case "Nature":
                return .nature
            case "Ocean":
                return .ocean
            default:
                return .unknown
            }
        }
        
        title = record["title"] as! String
        thumbnailURL = record["thumbnailURL"] as! String
        soundURL = record["soundURL"] as! String
        availableDate = record["availableDate"] as! Date
        let f = record["featured"] as! String
        featured = f == "true" ? true : false
        type = typeStringToType(record["type"] as! String)
    }
}

class RelaxContentManager {
    private let container = CKContainer.default()
    private var items: [RelaxFile] = []

    func fetch(completion: @escaping (() -> Void)) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "RelaxFile", predicate: predicate)
        
        container.publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let records = records {
                for record in records {
                    self.items.append(RelaxFile(record: record))
                    print(self.items)
                }
                completion()
            }
        }
    }
    
    func itemAtIndex(_ index: Int, type: Type) -> RelaxFile {
        if type == .featured {
            let i = items.filter({ $0.featured == true })
            return i[index]
        }
        let i = items.filter({ $0.type == type })
        return i[index]
    }
    
    func numberOfItems(for type: Type) -> Int {
        if type == .featured {
            let i = items.filter({ $0.featured == true })
            return i.count
        }
        let i = items.filter({ $0.type == type })
        return i.count
    }
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
