//
//  CharactersListView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct CharactersListView: View {
    let characters: [Character]
    @State private var searchText = ""

    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(characters) { character in
                        NavigationLink(destination: CharacterDetailView(characterId: character.id)) {
                            CharacterCardView(name: character.name, image: character.image)
                        }
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CharactersListView(characters: [Character(id: 2, name: "Morty Smith", status: .alive, species: "Human", type: "", gender: .male, origin: Location(name: "unknown", url: ""), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [], url: "https://rickandmortyapi.com/api/character/2", created: "2017-11-04T18:50:21.651Z"), Character(id: 1, name: "Morty Smith", status: .alive, species: "Human", type: "", gender: .male, origin: Location(name: "unknown", url: ""), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [], url: "https://rickandmortyapi.com/api/character/2", created: "2017-11-04T18:50:21.651Z")])
}
