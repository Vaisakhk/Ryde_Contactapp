//
//  DetailViewController.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    var presenter: DetailViewToPresenterProtocol?
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    //MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
        populateData()
    }
    
    //MARK: - View Customization
    func customizeUI() {
        title = "Detail"
        addLeftBarButtonCustom()
        self.navigationController?.navigationBar.tintColor = UIColor(named: "AppGreen")
    }
    
    //MARK: - Populate Data
    func populateData() {
        emailLabel.text = presenter?.currentContact?.email ?? ""
        userNameLabel.text = presenter?.userName
        phoneNumberLabel.text = "\(presenter?.currentContact?.id ?? 0)"
        userImageView.sd_setImage(with: URL(string: presenter?.currentContact?.avathar ?? ""), placeholderImage: UIImage(named: "placeHolder"), options: SDWebImageOptions.refreshCached) { (_, _, _, _) in
        }
    }
    
    func addLeftBarButtonCustom() {
        let barButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(self.leftButtonaction))
        self.navigationItem.rightBarButtonItem = barButton
    }

    //MARK: - View 
    
    @objc func leftButtonaction() {
        presenter?.didClickEditContacts()
    }
    
    
}

extension DetailViewController : DetailPresenterToViewProtocol {
    func refreshView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showEmptyView() {
        
    }
    
    
}
