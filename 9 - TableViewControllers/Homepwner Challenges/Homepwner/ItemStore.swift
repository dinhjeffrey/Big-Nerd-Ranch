//
//  ItemStore.swift
//  Homepwner
//
//  Created by jeffrey dinh on 8/1/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class ItemStore {
    
    // MARK: - Init
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    // MARK: - Constants and variables
    var allItems = [Item]()
    
    // MARK: - Methods
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}















































































