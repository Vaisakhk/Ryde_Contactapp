//
//  DetailViewRouter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation
import UIKit

final class DetailViewRouter: BaseRouter {
    init(contactId:Int, from homePresenter:DetailViewPresenterProtocol) {
        let view = DetailViewController(nibName: "DetailViewController", bundle: nil)

        super.init(viewController: view)
        let interactor: DetailPresenterToInteractorProtocol = DetailViewInteractor()
        let router: DetailPresenterToRouterProtocol = self
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailViewPresenter(router: router, view: view, interactor: interactor, currentContactId: contactId)
        presenter.presenterDelegate = homePresenter
        view.presenter = presenter
        interactor.presenter = presenter
    }

    // MARK: - Navigate to Detail
    private func navigateToDetail(idString: Int) {
        let editRouter = EditViewRouter(contactId: idString)
        viewController.presentRouter(editRouter, presentationStyle: .fullScreen)
    }
}

// MARK: - Detail Presenter To Router Protocol
extension DetailViewRouter: DetailPresenterToRouterProtocol {
    func pushToEditScreen(contactID: Int) {
        navigateToDetail(idString: contactID)
    }
    
}
