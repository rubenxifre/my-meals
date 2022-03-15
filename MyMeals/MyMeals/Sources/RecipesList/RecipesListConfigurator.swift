import UIKit

struct RecipesListConfigurator {

    static func prepare() -> UIViewController {
        let viewController = RecipesListViewController()
        let localStorage = LocalStorage()
        let dataProvider = RecipesListDataProvider(localStorage: localStorage)
        let interactor = RecipesListInteractor(dataProvider: dataProvider)
        let presenter = RecipesListPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
