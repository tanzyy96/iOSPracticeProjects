//
//  Person.swift
//  NamesToFaces
//
//  Created by Tan Zhi Yang on 19/7/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name:String, image:String) {
        self.name = name
        self.image = image
    }
}
