//
//  HomeNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HomeNavBar: View {
    var body: some View {
        HStack(spacing: 6) {
            Image("ProfilePicture2")
                .resizable()
                .scaledToFit()
                .frame(width: 50 * .deviceFontScale,
                       height: 50 * .deviceFontScale)
            
            Text("Welcome")
                .font(.customfont(.semibold, fontSize: 16 * .deviceFontScale))
                .foregroundStyle(Color.primaryApp)
            Text("there!")
                .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                .foregroundStyle(Color.primaryText)
            
            Spacer()
            
            Image("Notification")
                .resizable()
                .scaledToFit()
                .frame(width: 26 * .deviceFontScale,
                       height: 26 * .deviceFontScale)
            
        }
    }
}

#Preview {
    HomeNavBar()
}
