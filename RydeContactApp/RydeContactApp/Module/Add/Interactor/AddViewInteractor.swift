//
//  DetailViewInteractor.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class AddViewInteractor: AddPresenterToInteractorProtocol {
    var presenter: AddInteractorToPresenterProtocol?
    let coreDataHandler = CoreDataHandler.sharedInstance
    var networkHander:NetworkHandler = NetworkHandler.sharedHandler
    
    
    func updateCandidateDetails( firstName:String?, lastName:String? ,mobile:String?, email:String?){
        guard let tempFirstName = firstName ,let tempLastName = lastName
        else {
            presenter?.contactValidationFailed(message: "First name and last name can't be empty")
            return
        }
        if(tempFirstName.isEmpty || tempLastName.isEmpty) {
            presenter?.contactValidationFailed(message: "First name and last name can't be empty")
        }else {
        let contactId = getLastContactID() + 1
        var requestData:[String:String] = [:]
        requestData["name"] = tempFirstName
        requestData["id"] = "\(contactId)"
        requestData["first_name"] = firstName
        requestData["last_name"] = tempLastName
        networkHander.startNetworkRequest(urlString: CONTACTAPI.BASEURL + "users", data: requestData, methodType: .MethodTypePOST) { [weak self](_ result: Result<AddResponse, CONTACTERROR>) in
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
        
    }
    
    /*
     * Save Api response to local Db
     */
    fileprivate func updateContact ( firstName:String, lastName:String, contactId:Int) {
        let contact = coreDataHandler.newEntityForName(entityName: "Contact") as? Contact
        contact?.firstName = firstName
        contact?.lastName = lastName
        contact?.id = Int32(contactId)
        coreDataHandler.saveContext()
        if let tempContact = contact {
            DispatchQueue.main.async {
                self.presenter?.contactResult(data: tempContact,from: true)
            }
        }
    }
    
    fileprivate func getLastContactID() -> Int {
       let contacts =  coreDataHandler.getAllDatasWithPredicate(entity: "Contact", predicate: nil, sortDescriptor: NSSortDescriptor(key: "id", ascending: true)) as? [Contact] ?? []
        return contacts.count != 0 ? Int(contacts.last?.id ?? 1) : 1
    }
}
