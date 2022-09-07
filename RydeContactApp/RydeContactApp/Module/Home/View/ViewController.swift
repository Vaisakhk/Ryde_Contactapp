//
//  ViewController.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit
import PKHUD

class ViewController: UIViewController {
    var presenter: HomeViewToPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    /*
     *View Life cycle
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        
        customizeUI()
    }
    
    /*
     * View Customization
     * Input          : NA
     */
    func customizeUI() {
        title = "Contact"
        addRightBarButtonCustom()
        addLeftBarButtonCustom()
        self.navigationController?.navigationBar.tintColor = UIColor(named: "AppGreen")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    /*
     * To add custom right button
     * Input          : NA
     *
     */
    func addRightBarButtonCustom() {
        let barButton = UIBarButtonItem(title: "Groups", style: .done, target: self, action: #selector(self.backButtonaction))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    /*
     * To add custom Left button
     * Input          : NA
     *
     */
    func addLeftBarButtonCustom() {
        let barButton = UIBarButtonItem(image: UIImage(named: "plusIcon"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.leftButtonaction))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    /*
     * To handle Back button action
     * Input          : NA
     *
     */
    @objc func backButtonaction() {
       
    }
    
    /*
     * To handle left button action
     * Input          : NA
     *
     */
    @objc func leftButtonaction() {
        presenter?.didClickAddContacts()
    }
    
}

//MARK: - Home Presenter To view Protocol

extension ViewController : HomePresenterToViewProtocol {
    func refreshTableView() {
        tableView.reloadData()
    }
    
    func showProgressView() {
        showSpinner()
    }
    
    func hideProgressView() {
        hideSpinner()
    }
}


//MARK: - Table View Delegate and Datasource

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter?.reachedBottomOftheScroll(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presenter?.contactList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell, let data = presenter?.contactList?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.populateData(contact:data )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didClickContacts(for: indexPath.row)
    }
}

//MARK: - View controller extension to show progress hud

extension UIViewController {
    @objc func showSpinner() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    @objc func hideSpinner() {
        PKHUD.sharedHUD.hide()
    }
}
