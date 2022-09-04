//
//  DetailViewInteractor.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class DetailViewInteractor: DetailPresenterToInteractorProtocol {
    var presenter: DetailInteractorToPresenterProtocol?
    let coreDataHandler = CoreDataHandler.sharedInstance
    
    func getContactDetails(for contactId: Int) {
        let contactDetails = coreDataHandler.getAllDatasWithPredicate(entity: "Contact", predicate:  NSPredicate(format: "(id == %d)", contactId), sortDescriptor: nil) as? [Contact] ?? []
        if let contact = contactDetails.first {
            presenter?.contactResult(data: contact)
        }
    }
}
