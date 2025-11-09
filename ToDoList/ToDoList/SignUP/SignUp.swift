//
//  SignUp.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

struct SignUp: View {
    
    @State var nameText: String = ""
    let coordinator: AppCoordinator

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Image("intro")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                    .padding(.top, 50)
                
                VStack(spacing: 14) {
                    CustomTextField(placeholder: "Enter Your name", text: $nameText)
                    CustomTextField(placeholder: "Enter Your Email", text: $nameText)
                    CustomTextField(placeholder: "Enter Your Password", text: $nameText)
                }
                .padding(.bottom, 16)
                
                PrimaryButton(title: "Creat An Account") {}
                    
                HStack {
                    Text("Already  have an account ?")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.secondaryText)
                    
                    Text("Log In")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.primaryApp)
                }
                
                Spacer()
            }
            
        }
        .padding(20)
        .ignoresSafeArea()
    }
}
