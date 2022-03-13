final class RecipesListInteractor {
    // No code needed yet here
}

extension RecipesListInteractor: RecipesListInteractorInterface {

    func getRecipes(completionHandler: (Result<[Recipe], MyMealsError>) -> Void) {
        let recipes = [
            Recipe(
                identifier: "0",
                title: "Chicken Curry",
                ingredients: "- Chicken\n- Curry",
                instructions: "Very tasty chicken curry!"
            ),
            Recipe(
                identifier: "1",
                title: "Salad",
                ingredients: "- Lettuce\n- Tomato",
                instructions: "Delicious!"
            ),
            Recipe(
                identifier: "2",
                title: "Burrito",
                ingredients: "- Tortilla\n- Beans\n- Rice",
                instructions: "Awesome!"
            )
        ]
        completionHandler(.success(recipes))
    }
}
