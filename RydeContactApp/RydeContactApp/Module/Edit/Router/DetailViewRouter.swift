//
//  DetailViewRouter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation
import UIKit

final class DetailViewRouter: BaseRouter {
    init() {
        let view = DetailViewController(nibName: "DetailViewController", bundle: nil)

        super.init(viewController: view)
        let interactor: DetailPresenterToInteractorProtocol = DetailViewInteractor()
        let router: DetailPresenterToRouterProtocol = self
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailViewPresenter(router: router, view: view, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
    }

    // MARK: - Navigate to Detail
    private func navigateToDetail(idString: String) {
//        let controller = DetailsRouter(idString)
//        navigationController?.pushRouter(controller, animated: true)
    }
}

// MARK: - Detail Presenter To Router Protocol
extension DetailViewRouter: DetailPresenterToRouterProtocol {
    func pushToEditScreen(contactID: String) {
        
    }
    
}
