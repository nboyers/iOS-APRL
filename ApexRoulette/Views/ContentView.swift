//
//  ContentView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/20/21.
//

import SwiftUI

class UserInput: ObservableObject {
    @Published var map: Int = 0
    @Published var duo: Bool = false
}


struct ContentView: View {
    @State var duos: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                TitleCard()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer().frame(height: 400)
                OlympusButton()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer().frame(height: 20)
                World_EdgeButton()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer().frame(height: 20)
                
                DuosButton()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer()
            }.background(Image("main_menu")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
    }
}

//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//
//        ContentView(duo: <#Binding<Bool>#>)
//    }
//}
//#endif

struct OlympusButton: View {
    
    @ObservedObject var input = UserInput()
    
    var body: some View {
        NavigationLink(destination: GameView(viewModel: RouletteViewModel(MAP: 1, WEAPONS: true, DROPZONE: true, MEDS: true, GEAR: true, LEGENDS: true, SPECIALS: true, DUOS: self.input.duo))) {
            Text("OLYMPUS")
        } .frame(minWidth: 0, maxWidth: 200)
        .font(Font.custom("blocktastic", size: 30))
        .padding()
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 3))
    }
}

struct World_EdgeButton: View {
    @ObservedObject var input = UserInput()
    var body: some View {
        NavigationLink(destination: GameView(viewModel: RouletteViewModel(MAP: 2, WEAPONS: true, DROPZONE: true, MEDS: true, GEAR: true, LEGENDS: true, SPECIALS: true, DUOS: self.input.duo))) {
            Text("WORLD'S EDGE")
        }
        .frame(minWidth: 0, maxWidth: 200)
        .font(Font.custom("blocktastic", size: 30))
        .padding()
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 3))
        
    }
}


struct DuosButton: View {
    @ObservedObject var input = UserInput()
    
    var body: some View {
        Toggle("Duos", isOn: self.$input.duo)
            .frame(minWidth: 0, maxWidth: 200, maxHeight: 18)
            .font(Font.custom("blocktastic", size: 30))
            .padding()
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 3))
    }
}

struct TitleCard: View {
    var body: some View {
        Text("Map Selection")
            .font(Font.custom("blocktastic", size: 50))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}
