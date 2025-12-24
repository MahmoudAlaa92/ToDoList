//
//  SplashScreen.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 25/12/2025.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Images
                .splashScreen
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}
// MARK: - Preview
//
#Preview {
    SplashScreenView()
}
