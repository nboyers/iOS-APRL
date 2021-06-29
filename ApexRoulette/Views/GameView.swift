//
//  GameView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/26/21.
//

import SwiftUI


struct GameView: View {
    
    @ObservedObject var viewModel = RouletteViewModel() // Sends the info back to the view
    
    @State private var weapon: Bool = true
    @State private var meds: Bool = true
    @State private var location: Bool = true  // LOCATION ON THE MAP
    @State private var gear: Bool = true
    @State private var legend: Bool = true
    @State private var special: Bool = true

    
    //NEED TO PASS THE MAP AND THE DUOS TO THE VIEWMODEL
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Group {
                    Toggle("WEAPONS", isOn: $weapon)
                        .foregroundColor(.white)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    Text(viewModel.weaponsString)
                        .foregroundColor(.white)
                    
                    Toggle("MEDICALS", isOn: $meds)
                        .foregroundColor(.white)
                    
                    Text(viewModel.medString)
                        .foregroundColor(.white)
                    
                    Toggle("DROPZONE", isOn: $location) //for the map
                        .foregroundColor(.white)
                    
                    Text(viewModel.dropZoneString)
                        .foregroundColor(.white)
                    
                }.fixedSize(horizontal: false, vertical: true)
                
                
                Group {
                    Toggle("GEAR", isOn: $gear)
                        .foregroundColor(.white)
                    
                    Text(viewModel.gearString)
                        .foregroundColor(.white)
                    
                    Toggle("LEGENDS", isOn: $legend) // FOR DUOS
                        .foregroundColor(.white)
                    
                    ForEach(viewModel.characterArray, id: \.self) { legend in
                        Text(legend)
                    }.foregroundColor(.white)
                    
                    Toggle("SPECIALS", isOn: $special)
                        .foregroundColor(.white)
                    
                    Text(viewModel.specialString)
                        .foregroundColor(.white)
                    
                }.fixedSize(horizontal: false, vertical: true)
                
                ButtonsGroup(viewModel: viewModel)
            }
            .background(Image("game_view")
                            .resizable()
                            .edgesIgnoringSafeArea(.all))
        }
    }
}


struct ButtonsGroup: View {
    @ObservedObject var viewModel: RouletteViewModel
    
    var body: some View {
        Group {
            Button(action: {
                viewModel.resetButton()
            }, label: {
                Text("RESET")
            }).frame(minWidth: 0, maxWidth: 150)
            .font(Font.custom("blocktastic", size: 30))
            .padding()
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 3))
            
            Spacer().frame(height: 30)
            
            
            Button(action: {
                viewModel.startGame()
            }, label: {
                Text("RANDOMIZER")
            }).frame(minWidth: 0, maxWidth: 150)
            .font(Font.custom("blocktastic", size: 30))
            .padding()
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 3))
            Spacer()
        }
    }
}
