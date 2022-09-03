//
//  HomeTableViewCell.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func populateData(contact:Contact) {
        
    }
}
