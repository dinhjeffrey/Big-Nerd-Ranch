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
    var items = [[Item]]()
    
    // MARK: - View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        let items = itemStore.allItems
        var itemsSeperatedByValue = [[Item]](count: 2, repeatedValue: [])
        for item in items {
            if item.valueInDollars > 50 {
                itemsSeperatedByValue[0].append(item)
            } else {
                itemsSeperatedByValue[1].append(item)
            }
        }
        let lastItem = Item(name: "No more items!", serialNumber: nil, valueInDollars: nil)
        itemsSeperatedByValue[1].append(lastItem)
        self.items = itemsSeperatedByValue
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "> $50"
        }
        return "<= $50"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.cell, forIndexPath: indexPath)
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        
        print("section is \(indexPath.section)")
        print("row is \(indexPath.row)")
        let cellTitle = items[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = cellTitle.name
        if let dollars = cellTitle.valueInDollars {
            cell.detailTextLabel?.text = "$\(dollars)"
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected section: \(indexPath.section) row: \(indexPath.row)")
    }
}






















































































