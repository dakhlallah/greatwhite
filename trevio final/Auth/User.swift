import Foundation

struct User: Codable, Identifiable {
    let id: String
    var email: String
    var fullName: String
    var phoneNumber: String?
    var profileImageURL: String?
    var createdAt: Date
    var updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case profileImageURL = "profile_image_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Authentication Response
struct AuthResponse: Codable {
    let user: User
    let token: String
}

// MARK: - Authentication Error
enum AuthError: Error {
    case invalidCredentials
    case networkError
    case serverError
    case unknownError
    
    var message: String {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password"
        case .networkError:
            return "Network connection error"
        case .serverError:
            return "Server error occurred"
        case .unknownError:
            return "An unknown error occurred"
        }
    }
} 