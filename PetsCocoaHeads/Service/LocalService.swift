import Foundation


class LocalService: NetworkService {
    func load(_ forResource: String) async throws -> ScreenModel {
        guard let path = Bundle.main.path(forResource: forResource, ofType: "json") else {
            fatalError("Resource file not found")
        }

        let data = try Data(contentsOf: URL(fileURLWithPath: path))

        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
}
