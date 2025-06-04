import Foundation
import SwiftUI

struct EmptyResponse: Codable {}

// Import User and AuthError from User.swift
@MainActor
class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var error: AuthError?
    
    private let networkService = NetworkService.shared
    private let userDefaults = UserDefaults.standard
    private let tokenKey = "auth_token"
    
    init() {
        // Check for existing token and validate it
        if let token = userDefaults.string(forKey: tokenKey) {
            Task {
                await validateToken(token)
            }
        }
    }
    
    private func validateToken(_ token: String) async {
        do {
            let response: AuthResponse = try await networkService.request("/auth/validate", token: token)
            self.user = response.user
            self.isAuthenticated = true
        } catch {
            // Token is invalid, clear it
            userDefaults.removeObject(forKey: tokenKey)
        }
    }
    
    // MARK: - Sign In
    func signIn(email: String, password: String) async {
        isLoading = true
        error = nil
        
        do {
            let loginData = ["email": email, "password": password]
            let jsonData = try JSONSerialization.data(withJSONObject: loginData)
            
            let response: AuthResponse = try await networkService.request(
                "/auth/login",
                method: "POST",
                body: jsonData
            )
            
            // Save token
            userDefaults.set(response.token, forKey: tokenKey)
            
            self.user = response.user
            self.isAuthenticated = true
        } catch NetworkError.unauthorized {
            self.error = .invalidCredentials
        } catch NetworkError.serverError {
            self.error = .serverError
        } catch {
            self.error = .unknownError
        }
        
        isLoading = false
    }
    
    // MARK: - Sign Up
    func signUp(email: String, password: String, fullName: String) async {
        isLoading = true
        error = nil
        
        do {
            let signUpData = [
                "email": email,
                "password": password,
                "full_name": fullName
            ]
            let jsonData = try JSONSerialization.data(withJSONObject: signUpData)
            
            let response: AuthResponse = try await networkService.request(
                "/auth/register",
                method: "POST",
                body: jsonData
            )
            
            // Save token
            userDefaults.set(response.token, forKey: tokenKey)
            
            self.user = response.user
            self.isAuthenticated = true
        } catch NetworkError.serverError {
            self.error = .serverError
        } catch {
            self.error = .unknownError
        }
        
        isLoading = false
    }
    
    // MARK: - Sign Out
    func signOut() {
        userDefaults.removeObject(forKey: tokenKey)
        user = nil
        isAuthenticated = false
    }
    
    // MARK: - Reset Password
    func resetPassword(email: String) async {
        isLoading = true
        error = nil
        
        do {
            let resetData = ["email": email]
            let jsonData = try JSONSerialization.data(withJSONObject: resetData)
            
            let _: EmptyResponse = try await networkService.request(
                "/auth/reset-password",
                method: "POST",
                body: jsonData
            )
        } catch NetworkError.serverError {
            self.error = .serverError
        } catch {
            self.error = .unknownError
        }
        
        isLoading = false
    }
} 
