//
//  HomeTableViewCell.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit
import SDWebImage
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func populateData(contact:Contact) {
        userNameLabel.text = (contact.firstName ?? "") + " " + (contact.lastName ?? "")
        userImageView.sd_setImage(with: URL(string: contact.avathar ?? ""), placeholderImage: UIImage(named: "placeHolder"), options: SDWebImageOptions.refreshCached) { (_, _, _, _) in
        }
    }
}
