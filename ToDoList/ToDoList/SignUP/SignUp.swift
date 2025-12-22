//
//  SignUp.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import Combine
import SwiftUI

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
        Images.intro
            .resizable()
            .scaledToFit()
            .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
            .padding(.top, 50)
    }

    func textFields() -> some View {
        VStack(spacing: 14) {
            CustomTextField(
                placeholder: L10n.Auth.Signup.Username.placeholder,
                text: $viewModel.nameText
            )
            CustomTextField(
                placeholder: L10n.Auth.Signup.Email.placeholder,
                text: $viewModel.emailText
            )
            CustomTextField(
                placeholder:L10n.Auth.Signup.Password.placeholder,
                text: $viewModel.passwordText
            )
        }
        .padding(.bottom, 16)
    }

    @ViewBuilder
    func buttons() -> some View {
        PrimaryButton(title: L10n.Auth.Signup.createAccount) {

        }
        .disabled(!viewModel.isFormValid)
        .opacity(viewModel.isFormValid ? 1.0 : 0.8)

        HStack {
            Text(L10n.Auth.Signup.alreadyHaveAccount)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryText)

            Text(L10n.Auth.Login.title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.primaryApp)
                .onTapGesture { coordinator?.goBackAuth() }
        }
    }
}
