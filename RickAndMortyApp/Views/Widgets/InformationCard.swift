//
//  InformationCard.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct InformationCard: View {
    var title: String
    var text: String
    var body: some View {
        GroupBox(label: Text(title)
            .font(.title), content: {
            VStack() {
                Text(text)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(maxHeight: .infinity)
        })
        
        .backgroundStyle(Color(red: 0.4, green: 0.8, blue: 0.2))
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    InformationCard(title: "Status", text: "Morty")
}
