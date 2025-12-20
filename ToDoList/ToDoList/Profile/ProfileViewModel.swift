//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine
import Foundation

final class ProfileViewModel: ProfileViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: ProfileDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    @Published var profile: ProfileModel
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var isSaving: Bool = false
    @Published var hasChanges: Bool = false
    
    var profileImageName: String {
        profile.profileImageName
    }
    
    let sourceTab: Tabs
    
    // MARK: - Private Properties
    private var originalProfile: ProfileModel
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(
        sourceTab: Tabs,
        coordinator: CoordinatorProtocol?,
        dataProvider: ProfileDataProviderProtocol
    ) {
        self.sourceTab = sourceTab
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        
        // Fetch profile and initialize both profile and originalProfile
        let fetchedProfile = dataProvider.fetchProfile()
        self.profile = fetchedProfile
        self.originalProfile = fetchedProfile
        
        // Initialize editable fields
        self.fullName = fetchedProfile.fullName
        self.email = fetchedProfile.email
        self.phoneNumber = fetchedProfile.phoneNumber
        
        // Setup change detection after all properties are initialized
        setupChangeDetection()
    }
}
// MARK: - Input Methods
//
extension ProfileViewModel {
    func didTapBack() {
        if hasChanges {
            // Show confirmation dialog if there are unsaved changes
            print("Warning: You have unsaved changes")
            // coordinator?.showUnsavedChangesAlert(onDiscard: { [weak self] in
            //     self?.coordinator?.goBack(from: self?.sourceTab ?? .home)
            // })
        } else {
            coordinator?.goBack(from: sourceTab)
        }
    }
    
    func didTapMoreOptions() {
        print("More options tapped")
        // coordinator?.showProfileOptions()
    }
    
    func didTapEditPhoto() {
        print("Edit photo tapped")
        // coordinator?.showImagePicker { [weak self] imageName in
        //     self?.updateProfileImage(imageName)
        // }
    }
    
    func didTapDownloadQRCode() {
        Task { @MainActor in
            do {
                let qrData = try await dataProvider.downloadQRCode()
                print("QR Code downloaded: \(qrData.count) bytes")
                // Save to photo library or share
            } catch {
                print("Failed to download QR code: \(error.localizedDescription)")
            }
        }
    }
    
    func updateFullName(_ name: String) {
        fullName = name
    }
    
    func updateEmail(_ email: String) {
        self.email = email
    }
    
    func updatePhoneNumber(_ phone: String) {
        phoneNumber = phone
    }
    
    func saveProfile() {
        guard hasChanges else {
            print("No changes to save")
            return
        }
        
        guard validateProfile() else {
            print("Invalid profile data")
            return
        }
        
        isSaving = true
        
        // Update profile model
        profile.fullName = fullName
        profile.email = email
        profile.phoneNumber = phoneNumber
        
        Task { @MainActor in
            do {
                let success = try await dataProvider.saveProfile(profile)
                
                if success {
                    print("Profile saved successfully")
                    originalProfile = profile
                    hasChanges = false
                    
                    // Optionally navigate back
                    // coordinator?.goBack(from: sourceTab)
                }
            } catch {
                print("Failed to save profile: \(error.localizedDescription)")
            }
            
            isSaving = false
        }
    }
}
// MARK: - Private Methods
//
private extension ProfileViewModel {
    func setupChangeDetection() {
        // Detect changes in any field
        Publishers.CombineLatest3(
            $fullName,
            $email,
            $phoneNumber
        )
        .dropFirst() // Ignore initial values
        .sink { [weak self] name, email, phone in
            guard let self = self else { return }
            self.hasChanges = (
                name != self.originalProfile.fullName ||
                email != self.originalProfile.email ||
                phone != self.originalProfile.phoneNumber
            )
        }
        .store(in: &cancellables)
    }
    
    func validateProfile() -> Bool {
        // Validate full name
        guard !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        // Validate email
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              email.contains("@") else {
            return false
        }
        
        // Validate phone number
        guard !phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        return true
    }
    
    func updateProfileImage(_ imageName: String) {
        Task { @MainActor in
            do {
                let imageUrl = try await dataProvider.uploadProfileImage(imageName)
                profile.profileImageName = imageName
                print("Profile image updated: \(imageUrl)")
                hasChanges = true
            } catch {
                print("Failed to upload image: \(error.localizedDescription)")
            }
        }
    }
}
