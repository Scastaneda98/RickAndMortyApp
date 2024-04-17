//
//  LoadingView.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                .scaleEffect(3.0)
        }
        
    }
}

#Preview {
    LoadingView()
}
