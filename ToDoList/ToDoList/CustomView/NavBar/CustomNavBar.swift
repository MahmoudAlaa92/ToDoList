//
//  CustomeNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct CustomNavBar: View {
    var showSearchIcon: Bool = true
    
    var body: some View {
        HStack(spacing: 6) {
            Image("Back")
                .resizable()
                .scaledToFit()
                .frame(width: 26 * .deviceFontScale,
                       height: 26 * .deviceFontScale)
            
            Spacer()
            
            HStack {
                if showSearchIcon {
                    Image("Search")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28 * .deviceFontScale,
                               height: 28 * .deviceFontScale)
                }
                Image("Notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28 * .deviceFontScale,
                           height: 28 * .deviceFontScale)
            }
        }
        .padding(.bottom, 16 * .deviceFontScale)
    }
}

#Preview {
    CustomNavBar()
}
