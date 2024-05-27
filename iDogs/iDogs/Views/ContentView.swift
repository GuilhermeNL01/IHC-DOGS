//
//  ContentView.swift
//  iDogs
//
//  Created by Guilherme Nunes Lobo on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showOnboarding = false
    
    let dogBreeds = [
        DogBreed(name: "Raça 1", image: "placeholder"),
        DogBreed(name: "Raça 2", image: "placeholder"),
        DogBreed(name: "Raça 3", image: "placeholder")
    ]

    var body: some View {
        NavigationStack {
            VStack {
                // Barra de Pesquisa
                HStack {
                    TextField("Search...", text: .constant(""))
                        .padding(10)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    
                    Button(action: {
                        // Botão de Filtro
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
                .padding()

                // Lista de raças
                ScrollView {
                    ForEach(dogBreeds) { breed in
                        DogBreedRow(breed: breed)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Dog Breeds")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden()
            }
        }
    }



#Preview {
    ContentView()
}
