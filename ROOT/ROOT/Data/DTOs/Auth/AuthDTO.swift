import Foundation

struct AuthDTO: Decodable {
    let deviceToken, xquareID, password: String
    
    enum CodingKeys: String, CodingKey {
        case deviceToken
        case xquareID = "xquareId"
        case password
    }
}

struct AuthResponseDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    
    func toDomain() -> AuthToken {
        return AuthToken(
            accessToken: accessToken,
            refreshToken: refreshToken
        )
    }
}
