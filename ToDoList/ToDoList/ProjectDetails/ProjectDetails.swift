//
//  ProjectDetails.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 06/11/2025.
//

import SwiftUI

struct ProjectDetails: View {
    
    @State var changeComment: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                CustomNavBar(showSearchIcon: false)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Client Review &Feedback")
                            .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
                        
                        Text("Redesign app")
                            .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                            .foregroundStyle(Color.LightGray)
                    }
                    Spacer()
                }
                
                Image("cubes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth / 1.5,
                           height: .screenWidth / 1.5)
                
                HStack {
                    Text("31August,2024")
                        .font(.customfont(.regular, fontSize: 18 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                    Spacer()
                    Text("11am to 9pm")
                        .font(.customfont(.regular, fontSize: 18 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                }
                
                DescriptionRow()
                
                AssignPersons(persons: ["ProfilePicture", "ProfilePicture2"])
                CustomTextField(title: "Comment",
                                placeholder: "Enter your comment",
                                height: 100 * .deviceFontScale,
                                text: $changeComment)
                PrimaryButton(title: "Add Your Comment", action: {})
                
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ProjectDetails()
}
