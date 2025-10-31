//
//  PersonsView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct PersonsView: View {
    var body: some View {
        HStack {
            Text("Today - 11:42 am - 2:30pm ")
                .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
            Spacer()
            
            HStack(spacing: -18 * .deviceFontScale) {
                Image("woman")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40 * .deviceFontScale,
                           height: 40 * .deviceFontScale)
                Image("teenager girl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40 * .deviceFontScale,
                           height: 40 * .deviceFontScale)
                Image("young smiling man")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40 * .deviceFontScale,
                           height: 40 * .deviceFontScale)
            }
            
        }
        .padding(.horizontal, 26 * .deviceFontScale)

    }
}

#Preview {
    PersonsView()
}
