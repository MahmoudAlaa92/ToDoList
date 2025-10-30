//
//  UIExtension.swift
//  Online-Groceries
//
//  Created by Mahmoud Alaa on 27/09/2025.
//

import SwiftUI

extension CGFloat {
    
    /// Returns the screen width using the connected scene (safe for iOS 16+)
    ///
    static var screenWidth: Double {
        if let screen = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.screen {
            return screen.bounds.size.width
        }
        return 0
    }
    
    /// Returns the screen height using the connected scene (safe for iOS 16+)
    ///
    static var screenHeight: Double {
        if let screen = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.screen {
            return screen.bounds.size.height
        }
        return 0
    }
    
    /// Calculates width based on percentage of the screen width
    ///
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    /// Calculates height based on percentage of the screen height
    ///
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    /// Get the key window safely
    ///
    private static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
    
    /// Safe area insets (top)
    ///
    static var topInsets: Double {
        Double(keyWindow?.safeAreaInsets.top ?? 0.0)
    }
    
    /// Safe area insets (bottom)
    ///
    static var bottomInsets: Double {
        Double(keyWindow?.safeAreaInsets.bottom ?? 0.0)
    }
    
    /// Combined horizontal insets
    ///
    static var horizontalInsets: Double {
        guard let insets = keyWindow?.safeAreaInsets else { return 0.0 }
        return Double(insets.left + insets.right)
    }
    
    /// Combined vertical insets
    ///
    static var verticalInsets: Double {
        guard let insets = keyWindow?.safeAreaInsets else { return 0.0 }
        return Double(insets.top + insets.bottom)
    }
}

extension Date {
    func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
