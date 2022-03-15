import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        #if DEBUG
        copySampleDataIfNeeded()
        #endif
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
    }
}

#if DEBUG
private extension AppDelegate {

    func copySampleDataIfNeeded() {
        let fileManager = FileManager.default

        func documentsDirectoryURL() throws -> URL {
            try fileManager.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
        }

        func createDirectory(at url: URL) throws {
            try fileManager.createDirectory(
                at: url,
                withIntermediateDirectories: false,
                attributes: nil
            )
        }

        func recipesSampleData() throws -> Data {
            if let sampleRecipesDataURL = Bundle.main.url(forResource: "recipes", withExtension: "json") {
                return try Data(contentsOf: sampleRecipesDataURL)
            } else {
                return Data()
            }
        }

        do {
            let documentsURL = try documentsDirectoryURL()
            let storageURL = documentsURL.appendingPathComponent("MyMeals")
            if !fileManager.fileExists(atPath: storageURL.relativePath) {
                try createDirectory(at: storageURL)
                let recipesFileURL = storageURL.appendingPathComponent("recipes.json")
                let sampleData = try recipesSampleData()
                fileManager.createFile(atPath: recipesFileURL.relativePath, contents: sampleData, attributes: nil)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
#endif
