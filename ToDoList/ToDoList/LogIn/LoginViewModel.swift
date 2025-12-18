//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 18/12/2025.
//
import Combine
import Foundation

@MainActor
class LoginViewModel: LogInViewModelType {
    
    // MARK: - Published Properties (Outputs)
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Init
    init(coordinator: CoordinatorProtocol?) {
        self.coordinator = coordinator
    }    
}
// MARK: - Handlers
//
extension LoginViewModel {
    // MARK: - Inputs (Actions)
    func handleLogin() {
        isLoading = true
        errorMessage = nil
        
        // Simulate login process
        // In a real app, you'd call your authentication service here
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.isLoading = false
            self?.coordinator?.login()
        }
    }
    
    func handleGoogleLogin() {
        isLoading = true
        errorMessage = nil
        
        // Handle Google sign in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.isLoading = false
            self?.coordinator?.login()
        }
    }
    
    func handleQRCodeLogin() {
        isLoading = true
        errorMessage = nil
        
        // Handle QR code login
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.isLoading = false
            self?.coordinator?.login()
        }
    }
    
    func navigateToSignUp() {
        coordinator?.pushAuth(.signup)
    }
}
