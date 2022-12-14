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
    
    /*
     * View didload Called when Controller viewdidload is called
     * Input          : NA
     */
    
    func viewDidload() {
        _interactor?.getSavedContactDetails()
        _view?.showProgressView()
        _interactor?.getContactData(for: currentPage ?? 0)
    }
    
    /*
     * Did click contact from view
     * Input          :
     *                index    :- index of the selected contact
     */
    
    func didClickContacts(for index: Int) {
        if let contact = contactList?[index] {
            _router?.pushToDetailScreen(contactID: Int(contact.id), presenterProtocol: self)
        }
    }
    
    /*
     * Once reached bottom of the table view
     * Input          :
     *                index    :- index of the last item in UI
     */
    
    func reachedBottomOftheScroll(with index: Int) {
        if index == (contactList?.count ?? 0) - 1 && _totalPage > currentPage ?? 0 {
            currentPage = (currentPage ?? 0) + 1
            _view?.showProgressView()
            _interactor?.getContactData(for: currentPage ?? 0)
        }
    }
    
    /*
     * Did click Addcontact from view
     * Input          : NA
     *
     */
    
    func didClickAddContacts() {
        _router?.pushToAddContactScreen(presenterProtocol: self)
    }
}


extension HomePresenter : HomeInteractorToPresenterProtocol {
    func contactResultData(data: [Contact], with totalPages: Int) {
        _view?.hideProgressView()
        contactList = data
        if data.count == 0 {
            _totalPage = 1
        } else {
            _totalPage = totalPages
        }
    }
    
    func contactFetchFailedWithError(errorString: String) {
        _view?.showProgressView()
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
