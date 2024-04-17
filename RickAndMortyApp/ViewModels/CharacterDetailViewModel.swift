//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func getCharacterDetail(id: Int) {
        isLoading = true
        errorMessage = nil
        
        ApiClient.shared.fetchData(endpoint: "character/\(id)", method: .get) { (result: Result<Character, APIError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async { [self] in
                    character = response
                    isLoading = false
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "Failed to load character. Please try again later."
                }
            }
        }
    }
}
