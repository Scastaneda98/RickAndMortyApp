//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject var viewmodel = CharacterDetailViewModel()
    let characterId: Int
    
    var body: some View {
        ZStack {
            BackgroundView()
            Group {
                if let character = viewmodel.character {
                    CharacterInformationView(character: character)
                } else if viewmodel.isLoading {
                    LoadingView()
                } else {
                    ErrorView(message: "Character Not found")
                }
            }
            .onAppear {
                viewmodel.getCharacterDetail(id: characterId)
            }
        }
        
    }
}

#Preview {
    CharacterDetailView(characterId: 1)
}
