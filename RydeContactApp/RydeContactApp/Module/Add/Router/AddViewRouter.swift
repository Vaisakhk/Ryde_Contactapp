//
//  AddViewRouter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation
import UIKit

final class AddViewRouter: BaseRouter {
    init(homePresenter:AddViewPresenterProtocol) {
        let view = AddViewController(nibName: "AddViewController", bundle: nil)

        super.init(viewController: UINavigationController(rootViewController: view))
        let interactor: AddPresenterToInteractorProtocol = AddViewInteractor()
        let router: AddPresenterToRouterProtocol = self
        let presenter: AddViewToPresenterProtocol & AddInteractorToPresenterProtocol = AddViewPresenter(router: router, view: view, interactor: interactor)
        presenter.presenterDelegate = homePresenter
        view.presenter = presenter
        interactor.presenter = presenter
    }

    /*
     * To Dismiss Add View
     * Input          : NA
     */
    private func dismissAdd() {
        viewController.dismiss(animated: true)
    }
}

// MARK: - Add Presenter To Router Protocol
extension AddViewRouter: AddPresenterToRouterProtocol {
    func dismissAddView() {
        dismissAdd()
    }
    
}
