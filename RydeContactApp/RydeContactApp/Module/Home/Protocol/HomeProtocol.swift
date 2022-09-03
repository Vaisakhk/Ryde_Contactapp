//
//  HomeProtocol.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

protocol HomeViewToPresenterProtocol {
    func viewDidload()
    func didClickContacts(for index: Int)
    func reachedBottomOftheScroll(with index: Int)
    var contactList: [Contact]? { get }
    var currentPage: Int? { get }
    var currentKeyWord: String? { get set }
}

protocol HomePresenterToViewProtocol {
    func refreshTableView()
    func hideEmptyView()
    func showEmptyView()
}

protocol HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func getContactData(with searchText: String, for page: Int)

}

protocol HomePresenterToRouterProtocol {
    func pushToDetailScreen(contactID: String)
}

protocol HomeInteractorToPresenterProtocol {
    func contactResultData(data: Contact)
    func contactFetchFailedWithError(errorString: String)
}


