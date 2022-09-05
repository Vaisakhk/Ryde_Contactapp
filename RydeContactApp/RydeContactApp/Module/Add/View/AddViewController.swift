//
//  AddViewController.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit
import SDWebImage

class AddViewController: UIViewController {
    @IBOutlet weak var userPhotoView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    var presenter: AddViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidload()
        customizeUI()
        populateData()
    }

    //MARK: - View Customization
    func customizeUI() {
        title = "Add Contact"
        addRightBarButtonCustom()
        addLeftBarButtonCustom()
        self.navigationController?.navigationBar.tintColor = UIColor(named: "AppGreen")
        userPhotoView.layer.borderWidth = 2
        userPhotoView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func addRightBarButtonCustom() {
        let barButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(self.backButtonaction))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func addLeftBarButtonCustom() {
        let barButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.leftButtonaction))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    //MARK: - Populate Data
    func populateData() {
        emailTextField.text =  ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        mobileTextField.text = " "
       
//        userImageView.sd_setImage(with: URL(string: presenter?.currentContact?.avathar ?? ""), placeholderImage: UIImage(named: "placeHolder"), options: SDWebImageOptions.refreshCached) { (_, _, _, _) in
//        }
    }
    
    //MARK: - UIView Actions
    @objc func backButtonaction() {
        self.dismiss(animated: true)
    }
    
    @objc func leftButtonaction() {
        presenter?.updateCandidateDetails(with: firstNameTextField.text, lastName: lastNameTextField.text, mobile: mobileTextField.text, email: emailTextField.text)
    }
    
    @IBAction func tapGuestureAction(_ sender: Any) {
        
    }
}

extension AddViewController : AddPresenterToViewProtocol {
    func refreshView() {
        populateData()
    }
    
    func hideEmptyView() {
        
    }
    
    func showEmptyView() {
        
    }
    
    
}
