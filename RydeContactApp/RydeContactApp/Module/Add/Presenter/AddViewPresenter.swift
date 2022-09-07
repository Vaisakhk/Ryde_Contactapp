//
//  AddViewPresenter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class AddViewPresenter : AddViewToPresenterProtocol{
    private var _view: AddPresenterToViewProtocol?
    private var _router: AddPresenterToRouterProtocol?
    private var _interactor: AddPresenterToInteractorProtocol?
    
    var presenterDelegate:AddViewPresenterProtocol?
    /*
     * Initializing Presenter
     * Input   :
     *          router    :- Presenter to router protocol that helps in Navigation
     *          view      :- Presenter to view protocol that helps to communicate with view
     *          interactor:- Presenter to interactor protocol that helps to execute bussiness logics
     */
    init(router: AddPresenterToRouterProtocol, view: AddPresenterToViewProtocol, interactor: AddPresenterToInteractorProtocol) {
        _view = view
        _router = router
        _interactor = interactor
    }
    
    /*
     * View didload Called when Controller viewdidload is called
     * Input          : NA
     */
    func viewDidload() {

    }
    
    /*
     * TO add Contact details
     * Input          :
     *                firstName :- firstName need to update
     *                lastName  :- lastName need to update
     *                mobile    :- mobile need to update
     *                email     :- email need to update
     */
    
    func updateCandidateDetails(with firstName:String?, lastName:String? ,mobile:String?, email:String?) {
        _interactor?.updateCandidateDetails( firstName: firstName, lastName: lastName, mobile: mobile, email: email)
    }
    
}

extension AddViewPresenter : AddInteractorToPresenterProtocol  {
    func contactResult(data: Contact, from isAdding:Bool) {
        _view?.refreshView()
        if(isAdding) {
            _router?.showAlertPopup(with: "Contact Added Successfully", title: " Contact App ", successButtonTitle: "Ok", successBlock: { [weak self] isSuccess in
                if let clDelegate = self?.presenterDelegate {
                    clDelegate.contactCreatedSuccessfully()
                }
                self?._router?.dismissAddView()
            })
        }
    }
    
    func contactValidationFailed(message:String) {
        _router?.showAlertPopup(with: message, title: " Contact App ", successButtonTitle: "Ok", successBlock: {  isSuccess in
           
        })
    }
    
    func contactResultFailed(message:String) {
        _router?.showAlertPopup(with: message, title: " Contact App ", successButtonTitle: "Ok", successBlock: {  isSuccess in
           
        })
    }
}
