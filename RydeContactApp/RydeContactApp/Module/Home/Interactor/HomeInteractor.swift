//
//  HomeInteractor.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol?
    var networkHander:NetworkHandler = NetworkHandler.sharedHandler
    let coreDataHandler = CoreDataHandler.sharedInstance
    
    /*
     * Get Contact Details from server
     */
    func getContactData( for page: Int) {
        
        networkHander.startNetworkRequest(urlString: CONTACTAPI.BASEURL + "users?per_page=10&page=\(page)", data: nil, methodType: .MethodTypeGET, completion: {[weak self] (_ result: Result<ContactList, CONTACTERROR>) in
            switch result {
            case .success(let response):
                guard let weakSelf = self else {
                    return
                }
                weakSelf.processContactList(data: response.data)
                DispatchQueue.main.async {
                    weakSelf.presenter?.contactResultData(data: weakSelf.getDataFromLocalDb(),with: response.totalPage)
                }
                
                print(response)
                break
            
            case .failure(let error) :
                print(error)
                break
 
            }
        })
    }
    
    /*
     * Get All Saved Data Initially
     */
    func getSavedContactDetails() {
        presenter?.contactResultData(data: getDataFromLocalDb(),with: 0)
    }
    
    /*
     * Save Api response to local Db
     */
    fileprivate func processContactList (data: [ContactResult]) {
        for contactResult in data {
            let contactData:[Contact] = self.coreDataHandler.getAllDatasWithPredicate(entity: "Contact", predicate: NSPredicate(format: "(id == %d)", contactResult.id), sortDescriptor: NSSortDescriptor(key: "firstName", ascending: true)) as? [Contact] ?? []
            var contact = contactData.first
            if(contact == nil ){
                contact = coreDataHandler.newEntityForName(entityName: "Contact") as? Contact
            }
            contact?.id = Int32(contactResult.id)
            contact?.email = contactResult.email
            contact?.firstName = contactResult.firstName
            contact?.lastName = contactResult.lastName
            contact?.avathar = contactResult.avatar
            coreDataHandler.saveContext()
        }
    }
    
    /*
     * Fetch data from local Db
     */
    fileprivate func getDataFromLocalDb() -> [Contact] {
        coreDataHandler.getAllDatas(entity: "Contact")  as? [Contact] ?? []
        
    }
}
