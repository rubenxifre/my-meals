final class RecipesListPresenter {

    private weak var view: RecipesListViewInterface?
    private let interactor: RecipesListInteractorInterface

    init(view: RecipesListViewInterface, interactor: RecipesListInteractorInterface) {
        self.view = view
        self.interactor = interactor
    }
}

extension RecipesListPresenter: RecipesListPresenterInterface {

    func start() {
        interactor.getRecipes { result in
            switch result {
            case .success(let recipes):
                let viewData = RecipesListViewDataMapper.map(from: recipes)
                view?.update(with: viewData)
            case .failure:
                // TODO: handle error
                break
            }
        }
    }
}
