//
//  ProfileViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

// MARK: - Input Protocol
protocol ProfileViewModelInput: ObservableObject {
    func didTapBack()
    func didTapMoreOptions()
    func didTapEditPhoto()
    func didTapDownloadQRCode()
    func updateFullName(_ name: String)
    func updateEmail(_ email: String)
    func updatePhoneNumber(_ phone: String)
    func saveProfile()
}

// MARK: - Output Protocol
protocol ProfileViewModelOutput: ObservableObject {
    var profile: ProfileModel { get }
    var fullName: String { get }
    var email: String { get }
    var phoneNumber: String { get }
    var profileImageName: String { get }
    var sourceTab: Tabs { get }
    var isSaving: Bool { get }
    var hasChanges: Bool { get }
}

// MARK: - Protocol with Coordinator
protocol ProfileViewModelType:  ProfileViewModelInput, ProfileViewModelOutput {
    var coordinator: CoordinatorProtocol? { get set }
}
