//
//  ItemListTableViewController.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import UIKit

class ItemListTableViewController: UITableViewController, Storyboarded, ModuleOutput {

    private var items: [String] = ["Alfred Stone", "Kirk Russel", "Mike Vazovsky"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
    }
    
    var moduleOutputHandler: ((String) -> ())?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moduleOutputHandler?(items[indexPath.row])
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}
