//
//  EditViewRouter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation
import UIKit

final class EditViewRouter: BaseRouter {
    init(contactId:Int) {
        let view = EditViewController(nibName: "EditViewController", bundle: nil)

        super.init(viewController: UINavigationController(rootViewController: view))
        let interactor: EditPresenterToInteractorProtocol = EditViewInteractor()
        let router: EditPresenterToRouterProtocol = self
        let presenter: EditViewToPresenterProtocol & EditInteractorToPresenterProtocol = EditViewPresenter(router: router, view: view, interactor: interactor, contact: contactId)
        view.presenter = presenter
        interactor.presenter = presenter
    }

    // MARK: - Navigate to Edit
    private func dismissEdit() {
        viewController.dismiss(animated: true)
    }
}

// MARK: - Edit Presenter To Router Protocol
extension EditViewRouter: EditPresenterToRouterProtocol {
    func dismissEditView() {
        dismissEdit()
    }
    
}
