//
//  Category.swift
//  Todey
//
//  Created by Sourabh Jain on 26/07/19.
//  Copyright © 2019 Sourabh Jain. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    let items = List<Item>()

}
