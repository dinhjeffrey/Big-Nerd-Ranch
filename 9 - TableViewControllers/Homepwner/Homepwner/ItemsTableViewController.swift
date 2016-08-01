//
//  ItemsTableViewController.swift
//  Homepwner
//
//  Created by jeffrey dinh on 8/1/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    // MARK:- Constants and variables
    // dependency injection
    var itemStore: ItemStore!
    struct Storyboard {
        static let cell = "UITableViewCell"
    }
    
    // MARK: - View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.cell, forIndexPath: indexPath)
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        return cell
    }
}






















































































