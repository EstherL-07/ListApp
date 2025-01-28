//
//  ContentView.swift
//  ListApp
//
//  Created by apple on 27/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var fadeIn = false
    @State private var navigateToMainView = false // To control navigation

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue // Background color of the splash screen
                    .edgesIgnoringSafeArea(.all)
                
                Text("\(Constants.splashText)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(fadeIn ? 1 : 0) // Fade-in effect
                    .scaleEffect(fadeIn ? 1 : 0.8) // Slight zoom-in effect
                    .animation(.easeIn(duration: 1), value: fadeIn)
                    .onAppear {
                        // Trigger the animation when the view appears
                        fadeIn.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            navigateToMainView = true
                        }
                    }
                
                NavigationLink(destination: CityListView(), isActive: $navigateToMainView) {
                    EmptyView()
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        SplashScreenView()
    }
}

#Preview {
    ContentView()
}
