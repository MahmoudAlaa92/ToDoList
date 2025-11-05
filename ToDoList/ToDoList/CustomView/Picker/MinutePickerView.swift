//
//  MinutePickerView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//


import SwiftUI

struct MinutePickerView: View {
    @Binding var selectedMinute: Int
    @State private var isExpanded = false
    let fromTo : [Int]
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            pickerHeader
            
            if isExpanded {
                minuteList
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .animation(.easeInOut, value: isExpanded)
    }
    
    // MARK: - Header (collapsed state)
    private var pickerHeader: some View {
        HStack {
            Text(String(format: "%02d", selectedMinute))
                .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                .foregroundColor(.black)
            
            Image(systemName: "chevron.down")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.gray)
                .frame(width: 12 * .deviceFontScale,
                       height: 12 * .deviceFontScale)
                .rotationEffect(.degrees(isExpanded ? 180 : 0))
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring()) {
                isExpanded.toggle()
            }
        }
    }
    
    // MARK: - Dropdown list
    private var minuteList: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 6) {
                ForEach(fromTo, id: \.self) { minute in
                    minuteRow(minute)
                }
            }
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: 50 * .deviceFontScale,
               maxHeight: 150 * .deviceFontScale)
        .background(Color.white)
        
    }
    
    // MARK: - Single minute row
    private func minuteRow(_ minute: Int) -> some View {
        let isSelected = minute == selectedMinute
        // Add leading zero for numbers less than 10
        let displayText = String(format: "%02d", minute)
        
        return Text(displayText)
            .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
            .foregroundColor(isSelected ? .white : .black)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(isSelected ? Color.primaryApp : Color.clear)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                selectedMinute = minute
                withAnimation(.spring()) {
                    isExpanded = false
                }
            }
    }
    
}

