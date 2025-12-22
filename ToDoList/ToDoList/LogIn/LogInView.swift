//
//  LogInView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//
import SwiftUI

struct LogInView<ViewModel: LogInViewModelType>: View {
    // MARK: - Properties
    @ObservedObject private var viewModel: ViewModel
    
    // MARK: - Init
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - LifeCycle
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                backgroundImage()
                
                VStack(spacing: 20) {
                    topIllustration()
                    introText()
                    socialJoinSection()
                    signUpPrompt()
                    checkLoadingPage()
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 100)
            }
        }
        .ignoresSafeArea()
        .disabled(viewModel.isLoading)
    }
}
// MARK: - Subviews
//
extension LogInView {
    
    private func backgroundImage() -> some View {
        Images.backGround
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight * 0.5)
    }
    
    private func topIllustration() -> some View {
        Images.manandwomen
            .resizable()
            .scaledToFit()
            .frame(width: .screenWidth * 0.8, height: .screenHeight * 0.4)
            .padding(.bottom, 40)
    }
    
    private func introText() -> some View {
        VStack(spacing: 8) {
            Text(L10n.Auth.Login.gladYouHere)
                .font(.customfont(.semibold, fontSize: 20))
                .foregroundStyle(Color.primaryApp)
            
            Text(L10n.Auth.Login.welcomeMessage)
                .multilineTextAlignment(.center)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
        }
    }
    
    private func socialJoinSection() -> some View {
        VStack(spacing: 14) {
            HStack {
                LineDivider()
                Text(L10n.Auth.Login.joinWithUs)
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundStyle(Color.primaryApp)
                LineDivider()
            }
            
            HStack(spacing: 20) {
                IconCardView(
                    image: Images.profilePicture,
                    title: L10n.Auth.Login.yourAccount
                ) {
                    viewModel.handleLogin()
                }
                
                IconCardView(
                    image: Images.google,
                    title: L10n.Auth.Login.yourGmail
                ) {
                    viewModel.handleGoogleLogin()
                }
                
                IconCardView(
                    image: Images.qrCode,
                    title: L10n.Auth.Login.yourQrCode
                ) {
                    viewModel.handleQRCodeLogin()
                }
            }
        }
    }
    
    private func signUpPrompt() -> some View {
        HStack {
            Text(L10n.Auth.Login.dontHaveAccount)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
            
            Text(L10n.Auth.Signup.title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.primaryApp)
                .onTapGesture {
                    viewModel.navigateToSignUp()
                }
        }
        .padding(.top, 14)
    }
    
    @ViewBuilder
    private func checkLoadingPage() -> some View {
        if viewModel.isLoading {
            ProgressView()
                .padding(.top, 20)
        }
        
        if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
                .font(.customfont(.regular, fontSize: 12))
                .foregroundStyle(.red)
                .padding(.top, 10)
        }
    }
    
}
