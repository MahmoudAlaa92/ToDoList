//
//  HomeNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HomeNavBar: View {
    var onTappedNotification: () -> Void
    var onTappedProfilePicture: () -> Void
    let onTappedMenu: () -> Void  // Add this new parameter

    var body: some View {
        HStack(spacing: 6) {
            // Menu Button (Left side)
            Button(action: onTappedMenu) {
                Image(systemName: "line.3.horizontal")
                    .font(.title2)
                    .foregroundStyle(Color.primary)
            }
            
            
            Image("ProfilePicture2")
                .resizable()
                .scaledToFit()
                .frame(width: 50 * .deviceFontScale,
                       height: 50 * .deviceFontScale)
                .onTapGesture { onTappedProfilePicture() }
            
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
                .onTapGesture {
                    onTappedNotification()
                }
            
        }
    }
}

#Preview {
    HomeNavBar(onTappedNotification: {}, onTappedProfilePicture: {}, onTappedMenu: {})
}
