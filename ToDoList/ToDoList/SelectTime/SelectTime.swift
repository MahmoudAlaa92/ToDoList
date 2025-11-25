//
//  SelectTime.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct SelectTime: View {
    
    @State private var hour = 3
    @State private var minute = 24
    weak var coordinator: CoordinatorProtocol?
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            SelectTimeNavBar(onCloseTapped: { coordinator?.dismissSheet() })
            HeaderSelectedTime(time: "03:24 pm")
            HStack(spacing: 12) {
                MinutePickerView(selectedMinute: $hour, fromTo: Array(0...23))
                Text(":")
                    .foregroundStyle(Color.LightGray)
                MinutePickerView(selectedMinute: $minute, fromTo: Array(1...59))
                Text("pm")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(Color.LightGray)
            }
            
            AlertRow(imageName: "Alarm", title: "Sound", subTitle: "iphone sound")
            AlertRow(imageName: "Sound", title: "Snooz", subTitle: "10 min to 20 min")
            
            HStack{
                SecondaryButton(title: "back", width: (.screenWidth * 0.5 - 30.0), action: {})
                Spacer()
                PrimaryButton(title: "done", width: (.screenWidth * 0.5 - 30.0), action: {})
            }
            .padding(.top, 24)
            
            Spacer()
        }
        .padding(20)

    }
}

#Preview {
    SelectTime()
}
