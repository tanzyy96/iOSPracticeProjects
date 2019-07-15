//
//  DetailController.swift
//  tableView
//
//  Created by Tan Zhi Yang on 2/7/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var detailText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let t = detailText {
            label.text = t
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
