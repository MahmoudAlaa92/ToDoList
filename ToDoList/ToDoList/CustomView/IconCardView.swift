//
//  IconCardView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

struct IconCardView: View {
    let imageName: String
    let title: String
    var backgroundColor: Color = .white
    var cornerRadius: CGFloat = 15
    var shadowColor: Color = .black.opacity(0.2)
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 40)
                
                Text(title)
                    .font(.customfont(.regular, fontSize: 10))
                    .foregroundStyle(.black)
                
            }
            .frame(width: 90, height: 60)
            .padding(6)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(color: shadowColor,  radius: 2)
        }
    }
}

#Preview {
    IconCardView(imageName: "ProfilePicture", title: "Your Account")
    
}
