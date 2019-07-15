//
//  ViewController.swift
//  StormViewer
//
//  Created by Tan Zhi Yang on 5/7/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pics = [String]() // 1.1 Initiating an array of string

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View Controller Properties
        title = "Storm viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 1.2 Accessing
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pics.append(item)
            }
        }
        pics.sort()
    }
    
    // 2.1 Standard tableView stuff
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for:indexPath)
//        cell.textLabel?.text = pics[indexPath.row]
        let cellTitle = "Picture \(indexPath.row+1) of \(pics.count)"
        cell.textLabel?.text = cellTitle
        return cell
    }
    // 2.2 Row select will pass data to the detailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 3.1 Try loading "Detail" view controller and typecast to DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 3.2 Set DVC's selectedImage property
            vc.selectedImage = pics[indexPath.row]
            // 3.3 Using UIViewController's navigationController, we push the DVC
            navigationController?.popToViewController(vc, animated: true)
        }
    }

}

