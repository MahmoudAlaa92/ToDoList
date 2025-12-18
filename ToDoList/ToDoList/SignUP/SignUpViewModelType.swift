//
//  SignUpViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 18/12/2025.
//

import Combine

protocol SignUpViewModelType: ObservableObject {

    // MARK: - Input
    var nameText: String { get set }
    var emailText: String { get set }
    var passwordText: String { get set }

    // MARK: - Output
    var isFormValid: Bool { get }
}
