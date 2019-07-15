//
//  customCell.swift
//  tableView
//
//  Created by Tan Zhi Yang on 30/6/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /* Manual configuration
     // cell.textLabel?.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
     cell.textLabel?.text = data[indexPath.section][indexPath.row]
     cell.detailTextLabel?.text = subs[indexPath.section][indexPath.row]
     
     // withRenderingMode allows color configuration
     cell.imageView?.image = UIImage(named: "calendar")?.withRenderingMode(.alwaysTemplate)
     cell.imageView?.tintColor = colors[indexPath.row%3]
     */
}
