//
//  DetailViewPresenter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class DetailViewPresenter : DetailViewToPresenterProtocol{
    private var _view: DetailPresenterToViewProtocol?
    private var _router: DetailPresenterToRouterProtocol?
    private var _interactor: DetailPresenterToInteractorProtocol?
    
    private var _contactId: Int = 0
    var currentContact: Contact?
    var userName: String {
        (currentContact?.firstName ?? "") + " " + (currentContact?.lastName ?? "")
    }
    /*
     * Initializing Presenter
     * Input   :
     *          router    :- Presenter to router protocol that helps in Navigation
     *          view      :- Presenter to view protocol that helps to communicate with view
     *          interactor:- Presenter to interactor protocol that helps to execute bussiness logics
     */
    init(router: DetailPresenterToRouterProtocol, view: DetailPresenterToViewProtocol, interactor: DetailPresenterToInteractorProtocol, currentContactId: Int) {
        _view = view
        _router = router
        _interactor = interactor
        _contactId = currentContactId
    }
    
    func viewDidload() {
        _interactor?.getContactDetails(for: _contactId)
    }
    
    
}

extension DetailViewPresenter : DetailInteractorToPresenterProtocol  {
    func contactResult(data: Contact) {
        currentContact = data
    }
    
    
}
