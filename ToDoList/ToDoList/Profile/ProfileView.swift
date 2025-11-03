//
//  ProfileView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State var changeFullName: String = ""
    var body: some View {
        
        ZStack {
            VStack {
                BackAndEllipsesNavBar()
                    .padding(.top, 20 * .deviceFontScale)
                
                VStack {
                    ZStack {
                        Image("ProfilePicture2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 180)
                        
                        Image("Edit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 40)
                            .padding(10)
                            .background(Circle().fill(Color.white))
                            .offset(y: 80)
                            .onTapGesture {}
                    }
                    .frame(height: 200)

                    Text("Edite your photo")
                        .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                        .foregroundStyle(Color.darkGray)
                }
                .padding(.bottom, 8)
                
                
                VStack(spacing: 16) {
                    CustomTextField(title:"Full Name", placeholder: "Enter your full name", text: $changeFullName)
                    CustomTextField(title:"Email", placeholder: "Enter your email", text: $changeFullName)
                    CustomTextField(title:"Full Phone Number", placeholder: "+20 1142128919", text: $changeFullName)
                    HStack {
                        Text("Your QR Code")
                            .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                        Text("download")
                            .foregroundStyle(Color.primaryApp)
                            .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                        Spacer()
                    }
                }
                
                PrimaryButton(title: "Save info", action: {})
                    .padding(.top, 24)
                
                Spacer()
            }
            
        }
        .padding(.horizontal, 20)
        
    }
    
}

#Preview {
    ProfileView()
}
