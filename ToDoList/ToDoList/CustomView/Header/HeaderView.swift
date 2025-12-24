//
//  HeaderView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HeaderView: View {
    var name: String = ""
    var seeAll: String = L10n.Tasks.seeAll
    var onTappedSeeAll: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(name)
                .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
            Spacer()
            Text(seeAll)
                .font(.customfont(.regular, fontSize: 11 * .deviceFontScale))
                .onTapGesture { onTappedSeeAll?() }
        }
    }
}

#Preview {
    HeaderView(onTappedSeeAll: {})
}
