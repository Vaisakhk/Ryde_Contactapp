//
//  DetailViewController.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit

class DetailViewController: UIViewController {

    var presenter: DetailViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidload()
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
