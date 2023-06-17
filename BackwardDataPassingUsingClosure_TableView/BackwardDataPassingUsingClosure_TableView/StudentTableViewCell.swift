//
//  StudentTableViewCell.swift
//  BackwardDataPassingUsingClosure_TableView
//
//  Created by Mac on 02/05/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var mobileNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
