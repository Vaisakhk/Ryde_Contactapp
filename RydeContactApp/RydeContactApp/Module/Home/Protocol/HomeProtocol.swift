//
//  HomeProtocol.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

protocol HomeViewToPresenterProtocol:BasePresenterProtocal {
    func viewDidload()
    func didClickContacts(for index: Int)
    func didClickAddContacts()
    func reachedBottomOftheScroll(with index: Int)
    var contactList: [Contact]? { get }
    var currentPage: Int? { get }
}

protocol HomePresenterToViewProtocol:BaseViewProtocol {
    func refreshTableView()
    func hideEmptyView()
    func showEmptyView()
}

protocol HomePresenterToInteractorProtocol:BaseInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func getSavedContactDetails()
    func getContactData( for page: Int)
}

protocol HomePresenterToRouterProtocol:RouterProtocal {
    func pushToDetailScreen(contactID: Int, presenterProtocol:DetailViewPresenterProtocol)
    func pushToAddContactScreen(presenterProtocol:AddViewPresenterProtocol) 
}

protocol HomeInteractorToPresenterProtocol:BaseInteractorToPresenterProtocol {
    func contactResultData(data: [Contact], with totalPages : Int)
    func contactFetchFailedWithError(errorString: String)
}


