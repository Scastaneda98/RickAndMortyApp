//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var characters: Characters?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        getCharacters()
    }
    
    private func getCharacters() {
        isLoading = true
        errorMessage = nil
        
        ApiClient.shared.fetchData(endpoint: "character", method: .get) { (result: Result<Characters, APIError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async { [self] in
                    characters = response
                    isLoading = false
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "Failed to load characters. Please try again later."
                }
            }
        }
    }
    
    func changePage(page: String) {
        let page = getPage(urlPage: page)
        isLoading = true
        errorMessage = nil
        
        ApiClient.shared.fetchData(endpoint: "character?\(page)", method: .get) { (result: Result<Characters, APIError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async { [self] in
                    characters = response
                    isLoading = false
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "Failed to load characters. Please try again later."
                }
            }
        }
    }
    
    
    
    private func getPage(urlPage: String) -> String {
        if let url = URL(string: urlPage) {
            // Obtén la parte de la consulta de la URL
            if let query = url.query {
                // Imprime la parte de la consulta
                return query
            }
        }
        return ""
    }
}
