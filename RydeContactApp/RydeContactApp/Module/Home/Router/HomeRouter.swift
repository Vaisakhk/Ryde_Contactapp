//
//  HomeRouter.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import UIKit

final class HomeRouter: BaseRouter {
    init() {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "viewController") as? ViewController ?? ViewController()

        super.init(viewController: view)
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = self
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter(router: router, view: view, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
    }

    // MARK: - Navigate to Detail
    private func navigateToDetail(selectedContactId: Int,presenterProtocol:DetailViewPresenterProtocol) {
        let controller = DetailViewRouter(contactId: selectedContactId, from: presenterProtocol
        )
        navigationController?.pushRouter(controller, animated: true)
    }
    
    // MARK: - Navigate to Add
    private func navigateToAddContact(presenterProtocol:AddViewPresenterProtocol) {
        let controller = AddViewRouter(homePresenter: presenterProtocol)
        viewController.presentRouter(controller, presentationStyle: .fullScreen)
    }
}

// MARK: - Home Presenter To Router Protocol
extension HomeRouter: HomePresenterToRouterProtocol {
    func pushToAddContactScreen(presenterProtocol:AddViewPresenterProtocol) {
        navigateToAddContact(presenterProtocol: presenterProtocol)
    }
    
    func pushToDetailScreen(contactID: Int, presenterProtocol:DetailViewPresenterProtocol) {
        navigateToDetail(selectedContactId: contactID,presenterProtocol:presenterProtocol)
    }
}
