//
//  DetailProtocol.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

protocol DetailViewToPresenterProtocol:BasePresenterProtocal {
    func viewDidload()
    var contactId: Int { get }
    var currentContact: Contact? { get }
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
    func pushToEditScreen(contactID: String)
}

protocol DetailInteractorToPresenterProtocol:BaseInteractorToPresenterProtocol {
    func contactResult(data: Contact)
}


