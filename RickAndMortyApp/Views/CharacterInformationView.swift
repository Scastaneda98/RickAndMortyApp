//
//  CharacterInformationView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct CharacterInformationView: View {
    var character: Character
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                }
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                HStack {
                    InformationCard(title: "Status", text: character.status.rawValue)
                    InformationCard(title: "Species", text: character.species)
                }
                .padding([.top, .leading, .trailing], 10.0)
                HStack {
                    InformationCard(title: "Gender", text: character.gender.rawValue)
                    InformationCard(title: "Origin", text: character.origin.name)
                }
                .padding([.top, .leading, .trailing], 10.0)
                HStack {
                    InformationCard(title: "Location", text: character.location.name)
                }
                .padding([.top, .leading, .trailing], 10.0)
                Spacer()
            }
        }
        .toolbarBackground(Color(red: 0.4, green: 0.8, blue: 0.2), for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(character.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    CharacterInformationView(character: Character(id: 2, name: "Morty Smith", status: .alive, species: "Human", type: "", gender: .male, origin: Location(name: "unknown", url: ""), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [], url: "https://rickandmortyapi.com/api/character/2", created: "2017-11-04T18:50:21.651Z"))
}
