//
//  CharactersListView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewmodel = CharactersViewModel()
    @State private var currentePage = 1
    var body: some View {
        NavigationStack {
            Group {
                if viewmodel.isLoading {
                    LoadingView()
                } else if let errorMessage = viewmodel.errorMessage {
                    ErrorView(message: errorMessage)
                } else if let characters = viewmodel.characters{
                    CharactersListView(characters: characters.results)
                        .navigationTitle("Characters")
                        .toolbarBackground(Color(red: 0.4, green: 0.8, blue: 0.2), for: .navigationBar)
                        .toolbar {
                            if let prev = viewmodel.characters?.info.prev {
                                Button(action: {
                                    viewmodel.changePage(page: prev)
                                    currentePage-=1
                                }){
                                    Image(systemName: "chevron.left")
                                        .foregroundStyle(.black)
                                }
                            }
                            
                            Text("\(currentePage) / \(viewmodel.characters?.info.pages ?? 0)")
                            
                            if let next = viewmodel.characters?.info.next {
                                Button(action: {
                                    viewmodel.changePage(page: next)
                                    currentePage+=1
                                }){
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                } else {
                    EmptyView()
                }
            }
            
        }
    }
}

#Preview {
    CharactersView()
}
