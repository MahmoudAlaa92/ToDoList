//
//  ContentView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

struct LogInView: View {
    
    weak var coordinator: CoordinatorProtocol?

    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                
                backGround()
                
                VStack {
                    
                    Image("manandwomen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.8, height: .screenHeight * 0.4)
                        .padding(.bottom, 40)
                        .padding(.top, 100)
                    
                    intro()
                    
                    VStack(spacing: 20) {
                        
                        HStack {
                            LineDivider()
                            Text("Join with us")
                                .font(.customfont(.regular, fontSize: 12))
                                .foregroundStyle(Color.primaryApp)
                            LineDivider()
                        }
                        
                        joinWith()
                        
                        HStack {
                            Text("Don`t have an account ?")
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundStyle(Color.secondaryText)
                            
                            Text("Sign UP")
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundStyle(Color.primaryApp)
                                .onTapGesture { coordinator?.pushAuth(.signup) }
                        }
                        
                    }
                    .padding(.top, 14)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Views
//
extension LogInView {
    
    func backGround() -> some View {
        Image("backGround")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight * 0.5)
    }
    
    func intro() -> some View {
        VStack(spacing: 8) {
            Text("Glad you're here.!!")
                .font(.customfont(.semibold, fontSize: 20))
                .foregroundStyle(Color.primaryApp)
            
            Text("“Welcome to Daily Grind, your go-to for Daily Grind app is a digital tool that helps you organize, prioritize, and manage your tasks.”")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
            
        }
    }
    
    func joinWith() -> some View {
        HStack(spacing: 20) {
            IconCardView(imageName: "ProfilePicture", title: "Your Account") { coordinator?.login() }
            IconCardView(imageName: "Google", title: "Your Gmail") { coordinator?.login() }
            IconCardView(imageName: "QrCode", title: "Your Qr Code") { coordinator?.login() }
        }
    }
}
