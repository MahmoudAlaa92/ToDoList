//
//  HeaderSelectedTime.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct HeaderSelectedTime: View {
    var time: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image("clock")
                .resizable()
                .scaledToFit()
                .frame(width: 200 * .deviceFontScale,
                       height: 200 * .deviceFontScale)
            
            Text(time)
                .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                .foregroundStyle(Color.LightGray)
        }
    }
}

#Preview {
    HeaderSelectedTime(time: "03:24 pm")
}
