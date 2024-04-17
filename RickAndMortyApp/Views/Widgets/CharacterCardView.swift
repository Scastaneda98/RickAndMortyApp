//
//  CharacterCardView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct CharacterCardView: View {
    let name: String
    let image: String
    var body: some View {
        GroupBox {
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            Text(name)
                .font(.title)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .bold()
                .lineLimit(3)
                .minimumScaleFactor(0.2)
            
        }
        .frame(width: 150, height: 250)
        .padding(.horizontal)
        .backgroundStyle(Color(red: 0.4, green: 0.8, blue: 0.2))
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        
    }
}

#Preview {
    CharacterCardView(name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
}
