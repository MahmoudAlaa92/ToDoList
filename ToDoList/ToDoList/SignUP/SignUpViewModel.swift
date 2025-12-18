//
//  SignUpViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 18/12/2025.
//

import Foundation
import Combine

@MainActor
class SignUpViewModel: SignUpViewModelType {
    
    // MARK: - Properties
    @Published var nameText: String = ""
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    
    @Published private(set) var isFormValid: Bool = false
    var cancellabels = Set<AnyCancellable>()
    
    // MARK: - Init
    init() {
        bindFormValidation()
    }
}
// MARK: - Private Handeler
//
extension SignUpViewModel {
    private func bindFormValidation() {
        Publishers
            .CombineLatest3($nameText, $emailText, $passwordText)
            .map{ name, email, password in
                !name.isEmpty &&
                !email.isEmpty &&
                !password.isEmpty
            }
            .removeDuplicates()
            .assign(to: &$isFormValid)
    }
}
