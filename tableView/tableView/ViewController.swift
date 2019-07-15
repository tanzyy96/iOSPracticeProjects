//
//  ViewController.swift
//  tableView
//
//  Created by Tan Zhi Yang on 30/6/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data: [[String]] = [["Item1","Item2","Item3"],
                            ["A","B","C","D"]]
    let subs: [[String]] = [["item","item","item"],
                            ["letter","letter","letter","letter"]]
    let titles:[String] = ["Items","Letters"]
    let colors: [UIColor] = [.red, .green, .blue]
    var selectedText: String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of rows dynamically
        return data[section].count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // If this function is not configured, by default there will be only 1 section
//        return data.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Return tableview cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customCell
        cell.label.text = data[0][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print("\(data[0][indexPath.row])")
        selectedText = data[0][indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! DetailController
        detail.detailText = selectedText
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    


}

