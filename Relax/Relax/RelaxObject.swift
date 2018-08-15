//
//  RelaxObject.swift
//  Relax
//
//  Created by Hugo Prinsloo on 2018/08/14.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import CloudKit

enum Type {
    case featured
    case nature
    case ocean
    case unknown
}

struct RelaxObject {
    
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
    private var items: [RelaxObject] = []

    func fetch(completion: @escaping (() -> Void)) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "RelaxFile", predicate: predicate)
        
        container.publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let records = records {
                for record in records {
                    self.items.append(RelaxObject(record: record))
                    print(self.items)
                }
                completion()
            }
        }
    }
    
    func itemAtIndex(_ index: Int, type: Type) -> RelaxObject {
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

