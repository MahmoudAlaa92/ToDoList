//
//  SelectTimeNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct SelectTimeNavBar: View {
    var onCloseTapped: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Text("Seletct Time")
                .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
         
            Spacer()
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.LightGray)
                .frame(width: 20, height: 20)
                .onTapGesture { onCloseTapped() }
        }
    }
}

#Preview {
    SelectTimeNavBar(onCloseTapped: {})
}
