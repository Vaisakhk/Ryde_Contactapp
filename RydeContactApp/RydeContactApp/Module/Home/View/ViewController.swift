//
//  ViewController.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit

class ViewController: UIViewController {
    var presenter: HomeViewToPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        
        customizeUI()
    }
    
    //MARK: - View Customization
    func customizeUI() {
        title = "Contact"
        addRightBarButtonCustom()
        addLeftBarButtonCustom()
        self.navigationController?.navigationBar.tintColor = UIColor(named: "AppGreen")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func addRightBarButtonCustom() {
        let barButton = UIBarButtonItem(title: "Groups", style: .done, target: self, action: #selector(self.backButtonaction))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func addLeftBarButtonCustom() {
        let barButton = UIBarButtonItem(title: "Plus", style: .done, target: self, action: #selector(self.leftButtonaction))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    //MARK: - UIView Actions
    @objc func backButtonaction() {
       
    }
    
    @objc func leftButtonaction() {
       
    }
    
}

//MARK:- Hisory Presenter To view Protocol

extension ViewController : HomePresenterToViewProtocol {
    func refreshTableView() {
        tableView.reloadData()
    }
    
    func hideEmptyView() {
        
    }
    
    func showEmptyView() {
        
    }
}


//MARK:- Table View Delegate and Datasource

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
