//
//  Announcement.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct AnnouncementCard: View {
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("announcement")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth * 0.9 , height: .screenWidth * 0.5)
                .padding(.top, -30)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("You’re almost done for\n today!")
                    .font(.customfont(.medium, fontSize: 15 * .deviceFontScale))
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                
                HStack(spacing: 30) {
                    Text("3/5 Tasks")
                        .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 30)
                    
                    SemiCircleProgressView(progress: 0.6, lineWidth: 5, color: Color.lightPink)
                }
            }
            .offset(y: -4 * .deviceFontScale)
        }
        .padding(.top, -24 * .deviceFontScale)
        .padding(.bottom, -38 * .deviceFontScale)
    }
}

#Preview {
    AnnouncementCard()
}

