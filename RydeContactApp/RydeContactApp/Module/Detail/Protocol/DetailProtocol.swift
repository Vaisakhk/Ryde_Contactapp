//
//  DetailProtocol.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

protocol DetailViewToPresenterProtocol:BasePresenterProtocal {
    func viewDidload()
    func viewWillAppear()
    func viewWillDisappear()
    var currentContact: Contact? { get }
    var userName: String {get}
    var presenterDelegate:DetailViewPresenterProtocol?{get set}
    func didClickEditContacts()
}

protocol DetailPresenterToViewProtocol:BaseViewProtocol {
    func refreshView()
    func hideEmptyView()
    func showEmptyView()
}

protocol DetailPresenterToInteractorProtocol:BaseInteractorProtocol {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
    func getContactDetails(for contactId:Int)
}

protocol DetailPresenterToRouterProtocol:RouterProtocal {
    func pushToEditScreen(contactID: Int)
}

protocol DetailInteractorToPresenterProtocol:BaseInteractorToPresenterProtocol {
    func contactResult(data: Contact)
}


protocol DetailViewPresenterProtocol {
    func backButtonClicked()
}
