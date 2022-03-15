final class RecipesListDataProvider {

    private let localStorage: LocalStorageInterface

    init(localStorage: LocalStorageInterface) {
        self.localStorage = localStorage
    }
}

extension RecipesListDataProvider: RecipesListDataProviderInterface {

    func getRecipes(completionHandler: (Result<[Recipe], MyMealsError>) -> Void) {
        do {
            let recipes: [Recipe] = try localStorage.retrieve(fromFileName: "recipes.json")
            completionHandler(.success(recipes))
        } catch {
            // TODO: Handle error properly
            completionHandler(.failure(.someError))
        }
    }
}
