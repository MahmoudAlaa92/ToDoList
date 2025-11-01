//
//  CustomeNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        HStack(spacing: 6) {
            Image("Back")
                .resizable()
                .scaledToFit()
                .frame(width: 26 * .deviceFontScale,
                       height: 26 * .deviceFontScale)
            
            Spacer()
            
            HStack {
                Image("Search")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26 * .deviceFontScale,
                           height: 26 * .deviceFontScale)
                Image("Notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26 * .deviceFontScale,
                           height: 26 * .deviceFontScale)
            }
        }
    }
}

#Preview {
    CustomNavBar()
}
