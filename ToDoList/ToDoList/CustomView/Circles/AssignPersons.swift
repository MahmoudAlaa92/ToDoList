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
            
            HStack(spacing: 2) {
                ForEach(persons, id: \.self) { name in
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42 * .deviceFontScale,
                               height: 42 * .deviceFontScale)
                }
            }
            
        }
    }
}

#Preview {
    AssignPersons(persons: ["ProfilePicture", "ProfilePicture2"])
}
