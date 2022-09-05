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
    private var _totalPage: Int = 0
    
    var contactList: [Contact]? {
        didSet {
            _view?.refreshTableView()
        }
    }
    
    var currentPage: Int?
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
        _interactor?.getSavedContactDetails()
        _interactor?.getContactData(for: currentPage ?? 0)
    }
    
    func didClickContacts(for index: Int) {
        if let contact = contactList?[index] {
            _router?.pushToDetailScreen(contactID: Int(contact.id), presenterProtocol: self)
        }
    }
    
    func reachedBottomOftheScroll(with index: Int) {
        if index == (contactList?.count ?? 0) - 1 && _totalPage > currentPage ?? 0 {
            currentPage = (currentPage ?? 0) + 1
            _interactor?.getContactData(for: currentPage ?? 0)
        }
    }
    
    func didClickAddContacts() {
        _router?.pushToAddContactScreen(presenterProtocol: self)
    }
}


extension HomePresenter : HomeInteractorToPresenterProtocol {
    func contactResultData(data: [Contact], with totalPages: Int) {
        contactList = data
        if data.count == 0 {
            _totalPage = 1
            _router?.showAlertPopup(with: AlertConstants.noDataFound, title: AlertConstants.alertTitle, successButtonTitle: AlertConstants.alertTitle)
            _view?.showEmptyView()
        } else {
            _totalPage = totalPages
            _view?.hideEmptyView()
        }
    }
    
    func contactFetchFailedWithError(errorString: String) {
        _view?.showEmptyView()
        //_router?.showAlertPopup(with: errorString, title: AlertConstants.alertTitle, successButtonTitle: AlertConstants.alertOkButton)
    }
    
}

extension HomePresenter : DetailViewPresenterProtocol {
    func backButtonClicked() {
        _interactor?.getSavedContactDetails()
    }
}

extension HomePresenter : AddViewPresenterProtocol {
    func contactCreatedSuccessfully() {
        _interactor?.getSavedContactDetails()
    }
}
