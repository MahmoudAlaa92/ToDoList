//
//  AddProject.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct AddProject: View {
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.white)
                    .frame(width: 20 * .deviceFontScale,
                           height: 20 * .deviceFontScale)
                
                
                Text("Add project")
                    .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                    .foregroundStyle(.white)
                
            }
            .padding()
            .background(Color.primaryApp)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .onTapGesture {
                action?()
            }
        }
    }
}

#Preview {
    AddProject()
}
