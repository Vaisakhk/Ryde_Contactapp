//
//  HomePresenter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    private var _view: HomePresenterToViewProtocol?
    private var _interactor: HomePresenterToInteractorProtocol?
    private var _router: HomePresenterToRouterProtocol?
    
    var contactList: [Contact]?
    
    var currentPage: Int?
    
    var currentKeyWord: String?
    
    /*
     * Initializing Presenter
     * Input   :
     *          router    :- Presenter to router protocol that helps in Navigation
     *          view      :- Presenter to view protocol that helps to communicate with view
     *          interactor:- Presenter to interactor protocol that helps to execute bussiness logics
     */
    init(router: HomePresenterToRouterProtocol, view: HomePresenterToViewProtocol, interactor: HomePresenterToInteractorProtocol) {
        _view = view
        _router = router
        _interactor = interactor
    }
    
    func viewDidload() {
        
    }
    
    func didClickContacts(for index: Int) {
        
    }
    
    func reachedBottomOftheScroll(with index: Int) {
        
    }
}


extension HomePresenter : HomeInteractorToPresenterProtocol {
    func contactResultData(data: Contact) {
        
    }
    
    func contactFetchFailedWithError(errorString: String) {
        
    }
    
}
