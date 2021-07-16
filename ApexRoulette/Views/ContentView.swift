//
//  ContentView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/20/21.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 100)
                Text("Map Selection")
                    .font(Font.custom("blocktastic", size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
  
                Spacer().frame(height: 400)
                OlympusButton()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer().frame(height: 20)
                World_EdgeButton()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer().frame(height: 20)
                
                
                Spacer()
            }.background(Image("main_menu")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            
            
        }
    }
    
    
    struct OlympusButton: View {
        var body: some View {
            NavigationLink(destination: GameView(viewModel: RouletteViewModel.init(MAP: "OLYMPUS"))) {
                        Text("OLYMPUS")
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .frame(minWidth: 0, maxWidth: 200)
                    .font(Font.custom("blocktastic", size: 30))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 3))
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    struct World_EdgeButton: View {
        var body: some View {
          
            NavigationLink(destination: GameView(viewModel: RouletteViewModel.init(MAP: "WORLD'S EDGE"))) {
                        Text("WORLD'S EDGE")
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .frame(minWidth: 0, maxWidth: 200)
                    .font(Font.custom("blocktastic", size: 30))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 3))
            
        }
    }
}
    
    struct Content_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
