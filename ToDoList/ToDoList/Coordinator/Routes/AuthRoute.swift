//
//  AuthRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 08/11/2025.
//

import SwiftUI

// MARK: - Auth Routes

enum AuthRoute: Route, ViewBuildable {
    
    case login
    case signup
    
    var id: String {
        switch self {
        case .login: return "login"
        case .signup: return "signup"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
        case .login:
            LogInView(viewModel: LoginViewModel(coordinator: coordinator))
        case .signup:
            SignUp(coordinator: coordinator, viewModel: SignUpViewModel())
        }
    }
}
