import UIKit

struct RecipesListConfigurator {

    static func prepare() -> UIViewController {
        let viewController = RecipesListViewController()
        let interactor = RecipesListInteractor()
        let presenter = RecipesListPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
