struct RecipesListViewData {

    struct Row {
        let imageURL: String
        let title: String
        let ingredients: String
        let instructions: String
    }

    let rows: [Row]
}

extension RecipesListViewData {

    func row(atIndex index: Int) -> RecipesListViewData.Row? {
        guard rows.indices.contains(index) else {
            return nil
        }
        return rows[index]
    }
}
