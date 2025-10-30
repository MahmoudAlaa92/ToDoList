//
//  LineDivider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

struct LineDivider: View {
    var width: CGFloat = 50
    var height: CGFloat = 1
    var color: Color = .primaryApp
    
    var body: some View {
        Rectangle() 
            .fill(color)
            .frame(width: width, height: height)
    }
}

#Preview {
    LineDivider()
}
