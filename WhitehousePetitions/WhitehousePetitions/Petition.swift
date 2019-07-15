//
//  Petition.swift
//  WhitehousePetitions
//
//  Created by Tan Zhi Yang on 14/7/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
    
    func search(word: String) -> Bool {
        let text = body.lowercased()
        if text.contains(word.lowercased()) {
            return true
        }
        return false
    }
}

