import Foundation

final class LocalStorage {

    // Dependencies
    private let fileManager = FileManager.default

    // Vars
    private static let storageFilePathComponent = "MyMeals"
}

extension LocalStorage: LocalStorageInterface {

    func save<T: Encodable>(_ objects: [T], toFileName fileName: String) throws {
        let fileURL = try fileURL(forFileName: fileName)
        let data = try JSONEncoder().encode(objects)
        try data.write(to: fileURL, options: [])
    }

    func retrieve<T: Decodable>(fromFileName fileName: String) throws -> [T] {
        // TODO: Move to background queue
        let fileURL = try fileURL(forFileName: fileName)
        let data = try Data(contentsOf: fileURL, options: [])
        return try JSONDecoder().decode([T].self, from: data)
    }
}

private extension LocalStorage {

    func fileURL(forFileName fileName: String) throws -> URL {
        try storageDirectoryURL().appendingPathComponent(fileName)
    }

    func storageDirectoryURL() throws -> URL {
        let storageURL = try documentsDirectoryURL().appendingPathComponent(LocalStorage.storageFilePathComponent)
        if !fileManager.fileExists(atPath: storageURL.relativePath) {
            try fileManager.createDirectory(
                at: storageURL,
                withIntermediateDirectories: false,
                attributes: nil
            )
        }
        return storageURL
    }

    func documentsDirectoryURL() throws -> URL {
        try fileManager.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
    }
}
