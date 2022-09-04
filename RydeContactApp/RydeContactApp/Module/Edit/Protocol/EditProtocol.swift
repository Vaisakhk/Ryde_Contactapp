//
//  EditProtocol.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

protocol EditViewToPresenterProtocol:BasePresenterProtocal {
    func viewDidload()
    var currentContact: Contact? { get }
    func updateCandidateDetails(with firstName:String?, lastName:String? ,mobile:String?, email:String?)
}

protocol EditPresenterToViewProtocol:BaseViewProtocol {
    func refreshView()
    func hideEmptyView()
    func showEmptyView()
}

protocol EditPresenterToInteractorProtocol:BaseInteractorProtocol {
    var presenter: EditInteractorToPresenterProtocol? { get set }
    func getContactEdits(for contactId:Int)
    func updateCandidateDetails(for contactId:Int, firstName:String?, lastName:String? ,mobile:String?, email:String?)
}

protocol EditPresenterToRouterProtocol:RouterProtocal {
    func dismissEditView()
}

protocol EditInteractorToPresenterProtocol:BaseInteractorToPresenterProtocol {
    func contactResult(data: Contact, from isEditing:Bool)
}


