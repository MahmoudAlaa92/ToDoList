//
//  UIFont.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

enum FontType: String {
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semibold = "Poppins-SemiBold"
    case bold = "Poppins-Bold"
}

extension Font {
    
    static func customfont(_ font: FontType, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}
