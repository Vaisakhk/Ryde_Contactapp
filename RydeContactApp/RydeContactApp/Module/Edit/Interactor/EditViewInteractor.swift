//
//  DetailViewInteractor.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class EditViewInteractor: EditPresenterToInteractorProtocol {
    var presenter: EditInteractorToPresenterProtocol?
    let coreDataHandler = CoreDataHandler.sharedInstance
    var networkHander:NetworkHandler = NetworkHandler.sharedHandler
    
    func getContactEdits(for contactId: Int) {
        let contactDetails = coreDataHandler.getAllDatasWithPredicate(entity: "Contact", predicate:  NSPredicate(format: "(id == %d)", contactId), sortDescriptor: nil) as? [Contact] ?? []
        if let contact = contactDetails.first {
            presenter?.contactResult(data: contact, from: false)
        }
    }
    
    func updateCandidateDetails(for contactId:Int, firstName:String?, lastName:String? ,mobile:String?, email:String?){
        guard let tempFirstName = firstName ,let tempLastName = lastName
        else {
            return
        }
        var requestData:[String:String] = [:]
        requestData["name"] = tempFirstName
        requestData["id"] = "\(contactId)"
        requestData["first_name"] = firstName
        requestData["last_name"] = tempLastName
        networkHander.startNetworkRequest(urlString: CONTACTAPI.BASEURL + "users/\(contactId)", data: requestData, methodType: .MethodTypePUT) { [weak self](_ result: Result<EditResponse, CONTACTERROR>) in
            guard let weakSelf = self else {
                return
            }
            switch result {
            case .success(_):
                weakSelf.updateContact(firstName: tempFirstName, lastName: tempLastName, contactId: contactId)
                break
                
            case .failure(let error) :
                weakSelf.presenter?.contactResultFailed(message: error.errorMessage())
                break
            }
        }
        
    }
    
    /*
     * Save Api response to local Db
     */
    fileprivate func updateContact ( firstName:String, lastName:String, contactId:Int) {
        let contactData:[Contact] = self.coreDataHandler.getAllDatasWithPredicate(entity: "Contact", predicate: NSPredicate(format: "(id == %d)", contactId), sortDescriptor: NSSortDescriptor(key: "firstName", ascending: true)) as? [Contact] ?? []
        var contact = contactData.first
        if(contact == nil ){
            contact = coreDataHandler.newEntityForName(entityName: "Contact") as? Contact
        }
        contact?.firstName = firstName
        contact?.lastName = lastName
        coreDataHandler.saveContext()
        if let tempContact = contact {
            DispatchQueue.main.async {
                self.presenter?.contactResult(data: tempContact,from: true)
            }
        }
    }
}
