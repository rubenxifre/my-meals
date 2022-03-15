struct RecipesListViewDataMapper {

    static func map(from recipes: [Recipe]) -> RecipesListViewData {
        RecipesListViewData(rows: recipes.map(mapRow(from:)))
    }
}

private extension RecipesListViewDataMapper {

    static func mapRow(from recipe: Recipe) -> RecipesListViewData.Row {
        RecipesListViewData.Row(
            imageURL: "",
            title: recipe.title,
            ingredients: recipe.ingredients,
            instructions: recipe.instructions
        )
    }
}
