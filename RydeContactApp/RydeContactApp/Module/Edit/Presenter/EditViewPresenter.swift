//
//  EditViewPresenter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class EditViewPresenter : EditViewToPresenterProtocol{
    private var _view: EditPresenterToViewProtocol?
    private var _router: EditPresenterToRouterProtocol?
    private var _interactor: EditPresenterToInteractorProtocol?
    
    private var _contactId: Int = 0
    var currentContact: Contact?
    
    /*
     * Initializing Presenter
     * Input   :
     *          router    :- Presenter to router protocol that helps in Navigation
     *          view      :- Presenter to view protocol that helps to communicate with view
     *          interactor:- Presenter to interactor protocol that helps to execute bussiness logics
     */
    init(router: EditPresenterToRouterProtocol, view: EditPresenterToViewProtocol, interactor: EditPresenterToInteractorProtocol, contact:Int) {
        _view = view
        _router = router
        _interactor = interactor
        _contactId = contact
    }
    
    /*
     * View didload Called when Controller viewdidload is called
     * Input          : NA
     */
    func viewDidload() {
        _interactor?.getContactEdits(for: _contactId)
    }
    
    /*
     * TO update Contact details
     * Input          :
     *                firstName :- firstName need to update
     *                lastName  :- lastName need to update
     *                mobile    :- mobile need to update
     *                email     :- email need to update
     */
    func updateCandidateDetails(with firstName:String?, lastName:String? ,mobile:String?, email:String?) {
        _interactor?.updateCandidateDetails(for: _contactId, firstName: firstName, lastName: lastName, mobile: mobile, email: email)
    }
    
}

extension EditViewPresenter : EditInteractorToPresenterProtocol  {
    func contactResult(data: Contact, from isEditing:Bool) {
        currentContact = data
        _view?.refreshView()
        if(isEditing) {
            _router?.showAlertPopup(with: "Contact edited Successfully", title: " Contact App ", successButtonTitle: "Ok", successBlock: { [weak self] isSuccess in
                self?._router?.dismissEditView()
            })
        }
    }
    
    func contactResultFailed(message: String) {
        _router?.showAlertPopup(with: message, title: " Contact App ", successButtonTitle: "Ok", successBlock: { isSuccess in
        })
    }
}
