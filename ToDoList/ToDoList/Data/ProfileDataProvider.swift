//
//  ProfileDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Foundation

// MARK: - Protocol
protocol ProfileDataProviderProtocol {
    func fetchProfile() -> ProfileModel
    func saveProfile(_ profile: ProfileModel) async throws -> Bool
    func uploadProfileImage(_ imageName: String) async throws -> String
    func downloadQRCode() async throws -> Data
}

final class ProfileDataProvider: ProfileDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = ProfileDataProvider()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Public Methods
    func fetchProfile() -> ProfileModel {
        // In production, fetch from UserDefaults, Keychain, or API
        return ProfileModel(
            fullName: "Mahmoud Alaa",
            email: "mahmoudalaa.wr@gmail.com",
            phoneNumber: "+20 1142128919",
            profileImageName: "ProfilePicture2",
            qrCodeUrl: "https://example.com/qr/user123"
        )
    }
    
    func saveProfile(_ profile: ProfileModel) async throws -> Bool {
        // Simulate API call
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
        
        // In production, save to API and/or local storage
        print("Profile saved: \(profile.fullName)")
        
        // Save to UserDefaults example:
        // UserDefaults.standard.set(profile.fullName, forKey: "fullName")
        // UserDefaults.standard.set(profile.email, forKey: "email")
        // UserDefaults.standard.set(profile.phoneNumber, forKey: "phoneNumber")
        
        return true
    }
    
    func uploadProfileImage(_ imageName: String) async throws -> String {
        // Simulate image upload
        try await Task.sleep(nanoseconds: 1_500_000_000) // 1.5 seconds
        
        // In production, upload to server and return URL
        return "https://example.com/images/\(imageName).jpg"
    }
    
    func downloadQRCode() async throws -> Data {
        // Simulate QR code download
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        
        // In production, generate or fetch QR code from server
        return Data()
    }
}
