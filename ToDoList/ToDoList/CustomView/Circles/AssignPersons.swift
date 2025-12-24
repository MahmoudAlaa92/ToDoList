//
//  AssignPersons.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI

struct AssignPersons: View {
    
    var persons: [Image]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(L10n.AddTask.assignTo)
                .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
            
            HStack(spacing: 2) {
                ForEach(persons.enumerated(), id: \.offset) { (_,image) in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42 * .deviceFontScale,
                               height: 42 * .deviceFontScale)
                }
            }
            
        }
    }
}
// MARK: - Previews
#Preview {
    AssignPersons(persons: [Images.profilePicture, Images.profilePicture2])
}
