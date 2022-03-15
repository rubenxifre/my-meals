final class RecipesListInteractor {

    private let dataProvider: RecipesListDataProviderInterface

    init(dataProvider: RecipesListDataProviderInterface) {
        self.dataProvider = dataProvider
    }
}

extension RecipesListInteractor: RecipesListInteractorInterface {

    func getRecipes(completionHandler: (Result<[Recipe], MyMealsError>) -> Void) {
        dataProvider.getRecipes(completionHandler: completionHandler)
    }
}
