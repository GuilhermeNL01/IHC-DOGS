//
//  DogBreedRow.swift
//  iDogs
//
//  Created by Guilherme Nunes Lobo on 27/05/24.
//

import SwiftUI

struct DogBreedRow: View {
    let breed: DogBreed

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                Image(breed.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
                    .clipped()
                    .cornerRadius(10)

                Text(breed.name)
                    .font(.headline)
                    .padding(.all, 10)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding([.leading, .bottom], 10)
            }
            .shadow(radius: 2)
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5) 
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}
