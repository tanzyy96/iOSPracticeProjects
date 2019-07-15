//
//  ViewController.swift
//  checkListApp
//
//  Created by Tan Zhi Yang on 29/6/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class checklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListItem", for: indexPath)
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            if indexPath.row == 0 {
                label.text = "Run a marathon"
            } else {
                label.text = "Sleep"
            }
        }
        
        return cell
    }
}

