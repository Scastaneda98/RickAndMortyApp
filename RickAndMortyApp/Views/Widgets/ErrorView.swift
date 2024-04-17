//
//  ErrorView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    var body: some View {
        ZStack {
            BackgroundView()
            Text(message)
                .foregroundStyle(.red)
                .font(.title)
            .bold()
        }
    }
}

#Preview {
    ErrorView(message: "")
}
