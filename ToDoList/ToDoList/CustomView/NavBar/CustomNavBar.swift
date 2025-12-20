//
//  CustomeNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct CustomNavBar: View {
    var showSearchIcon: Bool = true
    var showBackIcon: Bool = true
    var onTappedBack: (() -> Void)?
    var onTappedSearch: (() -> Void)?
    var onTappedNotification: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 6) {
            if showBackIcon {
                Image("Back")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26 * .deviceFontScale,
                           height: 26 * .deviceFontScale)
                    .onTapGesture { onTappedBack?() }
            }
            Spacer()
            
            HStack {
                if showSearchIcon {
                    Image("Search")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28 * .deviceFontScale,
                               height: 28 * .deviceFontScale)
                        .onTapGesture { onTappedSearch?() }
                }
                Image("Notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28 * .deviceFontScale,
                           height: 28 * .deviceFontScale)
                    .onTapGesture {
                        onTappedNotification?()
                    }
            }
        }
        .padding(.bottom, 16 * .deviceFontScale)
    }
}

#Preview {
    CustomNavBar()
}
