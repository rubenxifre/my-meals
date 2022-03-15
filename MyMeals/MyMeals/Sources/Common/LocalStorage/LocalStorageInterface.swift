protocol LocalStorageInterface {
    func save<T: Encodable>(_ objects: [T], toFileName fileName: String) throws
    func retrieve<T: Decodable>(fromFileName fileName: String) throws -> [T]
}
