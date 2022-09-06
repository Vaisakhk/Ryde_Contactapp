//
//  AddProtocol.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

protocol AddViewToPresenterProtocol:BasePresenterProtocal {
    func viewDidload()
    var presenterDelegate:AddViewPresenterProtocol? {get set}
    func updateCandidateDetails(with firstName:String?, lastName:String? ,mobile:String?, email:String?)
}

protocol AddPresenterToViewProtocol:BaseViewProtocol {
    func refreshView()
    func hideEmptyView()
    func showEmptyView()
}

protocol AddPresenterToInteractorProtocol:BaseInteractorProtocol {
    var presenter: AddInteractorToPresenterProtocol? { get set }
    func updateCandidateDetails( firstName:String?, lastName:String? ,mobile:String?, email:String?)
}

protocol AddPresenterToRouterProtocol:RouterProtocal {
    func dismissAddView()
}

protocol AddInteractorToPresenterProtocol:BaseInteractorToPresenterProtocol {
    func contactValidationFailed(message:String)
    func contactResult(data: Contact, from isAdding:Bool)
    func contactResultFailed(message:String)
}


protocol AddViewPresenterProtocol {
    func contactCreatedSuccessfully()
}

