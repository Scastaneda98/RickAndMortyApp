//
//  EmptyView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            Text("No character found")
                .foregroundStyle(.gray)
                .font(.title)
            .bold()
        }
    }
}

#Preview {
    EmptyView()
}
