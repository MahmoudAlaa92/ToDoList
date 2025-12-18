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
extension LogInView {
    
    private func backgroundImage() -> some View {
        Image("backGround")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight * 0.5)
    }
    
    private func topIllustration() -> some View {
        Image("manandwomen")
            .resizable()
            .scaledToFit()
            .frame(width: .screenWidth * 0.8, height: .screenHeight * 0.4)
            .padding(.bottom, 40)
    }
    
    private func introText() -> some View {
        VStack(spacing: 8) {
            Text("Glad you're here!!")
                .font(.customfont(.semibold, fontSize: 20))
                .foregroundStyle(Color.primaryApp)
            
            Text("""
            Welcome to Daily Grind, your go-to app to organize, prioritize, and manage your tasks effectively.
            """)
                .multilineTextAlignment(.center)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
        }
    }
    
    private func socialJoinSection() -> some View {
        VStack(spacing: 14) {
            HStack {
                LineDivider()
                Text("Join with us")
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundStyle(Color.primaryApp)
                LineDivider()
            }
            
            HStack(spacing: 20) {
                IconCardView(
                    imageName: "ProfilePicture",
                    title: "Your Account"
                ) {
                    viewModel.handleLogin()
                }
                
                IconCardView(
                    imageName: "Google",
                    title: "Your Gmail"
                ) {
                    viewModel.handleGoogleLogin()
                }
                
                IconCardView(
                    imageName: "QrCode",
                    title: "Your Qr Code"
                ) {
                    viewModel.handleQRCodeLogin()
                }
            }
        }
    }
    
    private func signUpPrompt() -> some View {
        HStack {
            Text("Don't have an account?")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
            
            Text("Sign UP")
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
