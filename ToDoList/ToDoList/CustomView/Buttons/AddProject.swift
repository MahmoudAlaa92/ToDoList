//
//  AddProject.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct AddProject: View {
    var title: String
    var titleColor: Color = .white
    var backGround: Color
    var plusCircleColor: Color = .white
    var action: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(plusCircleColor)
                    .frame(width: 24 * .deviceFontScale,
                           height: 24 * .deviceFontScale)
                
                
                Text(title)
                    .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                    .foregroundStyle(titleColor)
                
            }
            .padding(backGround == .white ? 0 : 12)
            .background(backGround)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.vertical, 4 * .deviceFontScale)
            .onTapGesture {
                action?()
            }
        }
    }
}

#Preview {
    AddProject(title: "Add project", backGround: Color.primaryApp)
}
