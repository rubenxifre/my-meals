protocol RecipesListViewInterface: AnyObject {
    func update(with viewData: RecipesListViewData)
}

protocol RecipesListPresenterInterface {
    func start()
}

protocol RecipesListInteractorInterface {
    func getRecipes(completionHandler: (Result<[Recipe], MyMealsError>) -> Void)
}

protocol RecipesListDataProviderInterface {
    func getRecipes(completionHandler: (Result<[Recipe], MyMealsError>) -> Void)
}
