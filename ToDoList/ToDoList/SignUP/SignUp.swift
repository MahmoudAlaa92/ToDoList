//
//  SignUp.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI
import Combine

struct SignUp<VM: SignUpViewModelType>: View {
    
    // MARK: - Properties
    weak var coordinator: CoordinatorProtocol?
    @StateObject var viewModel: VM
    
    // MARK: - Init
    init(coordinator: CoordinatorProtocol?, viewModel: VM) {
        self.coordinator = coordinator
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - LifeCycle
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                backgroundPhoto()
                textFields()
                buttons()
                Spacer()
            }
            
        }
        .padding(20)
        .ignoresSafeArea()
    }
}
// MARK: - Subviews
//
extension SignUp {
    
    func backgroundPhoto() -> some View {
        Image("intro")
            .resizable()
            .scaledToFit()
            .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
            .padding(.top, 50)
    }
    
    func textFields() -> some View {
        VStack(spacing: 14) {
            CustomTextField(placeholder: "Enter Your name", text: $viewModel.nameText)
            CustomTextField(placeholder: "Enter Your Email", text: $viewModel.emailText)
            CustomTextField(placeholder: "Enter Your Password", text: $viewModel.passwordText)
        }
        .padding(.bottom, 16)
    }
    
    @ViewBuilder
    func buttons() -> some View {
        PrimaryButton(title: "Creat An Account") {
            
        }
        .disabled(!viewModel.isFormValid)
        .opacity(viewModel.isFormValid ? 1.0 : 0.8)

        HStack {
            Text("Already  have an account ?")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
            
            Text("Log In")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.primaryApp)
                .onTapGesture { coordinator?.goBackAuth() }
        }
    }
}
