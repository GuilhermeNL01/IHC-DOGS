//
//  OnboardingView.swift
//  iDogs
//
//  Created by Guilherme Nunes Lobo on 27/05/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    
    private let onboardingSteps = [
        OnboardingStep(image: "dog_intro", title: "iDogs", description: "Bem-vindo ao iDogs, o app que traz diversas raças de cachorro na palma da sua mão."),
        OnboardingStep(image: "how_it_works", title: "Como Funciona?", description: "Navegue por uma lista de raças de cachorro. Clique em uma raça para ver mais detalhes."),
        OnboardingStep(image: "breed_list", title: "Lista de Raças", description: "Veja uma lista completa de raças de cachorro. Encontre a raça perfeita para você."),
        OnboardingStep(image: "breed_details", title: "Detalhes da Raça", description: "Clique em uma raça para ver sua foto e detalhes completos.")
    ]
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TabView(selection: $currentStep) {
                    ForEach(0..<onboardingSteps.count, id: \.self) { it in
                        VStack {
                            Spacer()
                            Image(onboardingSteps[it].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .padding(.bottom, 20)
                            
                            Text(onboardingSteps[it].title)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.brown)
                                .padding(.bottom, 10)
                            
                            Text(onboardingSteps[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 40) // Add more space below the description
                                .foregroundColor(.gray)
                                .font(.body)
                        }
                        .tag(it)
                        .opacity(currentStep == it ? 1 : 0)
                        .animation(.easeInOut, value: currentStep)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                HStack {
                    ForEach(0..<onboardingSteps.count, id: \.self) { it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.brown)
                                .transition(.opacity)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                                .transition(.opacity)
                        }
                    }
                }
                .padding(.bottom, 24)
                NavigationLink(destination: ContentView()) {
                    
                    Text("Comece Já")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                    
                }
                .padding(.bottom, 40)
                
                Spacer()
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    OnboardingView()
}
