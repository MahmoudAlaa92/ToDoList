//
//  BackAndEllipsesNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct BackAndEllipsesNavBar: View {
    var body: some View {
        HStack {
            Image("Back")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Spacer()
            Image("Ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    BackAndEllipsesNavBar()
}
