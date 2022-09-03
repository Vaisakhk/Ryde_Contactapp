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
    private func navigateToDetail(idString: String) {
//        let controller = DetailsRouter(idString)
//        navigationController?.pushRouter(controller, animated: true)
    }
}

// MARK: - Home Presenter To Router Protocol
extension HomeRouter: HomePresenterToRouterProtocol {
    func pushToDetailScreen(contactID: String) {
        navigateToDetail(idString: contactID)
    }
}
