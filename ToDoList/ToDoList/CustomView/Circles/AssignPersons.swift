//
//  AssignPersons.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI

struct AssignPersons: View {
    
    var persons: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Assign To")
                .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
            
            HStack(spacing: 8) {
                ForEach(persons, id: \.self) { name in
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 38 * .deviceFontScale,
                               height: 38 * .deviceFontScale)
                }
            }
            
        }
    }
}

#Preview {
    AssignPersons(persons: ["ProfilePicture", "ProfilePicture2"])
}
