//
//  GameView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/26/21.
//

import SwiftUI

struct GameView: View {
    
    
    @State var weapon: Bool = true
    @State var meds: Bool = true
    @State var drop: Bool = true
    @State var gear: Bool = true
    @State var legend: Bool = true
    @State var special: Bool = true
    @State var duo: Bool = false
    
    @ObservedObject var viewModel: RouletteViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Group {
                    Toggle("WEAPONS", isOn: $weapon)
                        .foregroundColor(.white)
                        .navigationBarTitle("")
                    
                    Text(viewModel.weaponsString)
                        .foregroundColor(.white)
                    
                    Toggle("MEDICALS", isOn: $meds)
                        .foregroundColor(.white)
                    
                    Text(viewModel.medString).foregroundColor(.white)
                        .foregroundColor(.white)
                    
                    Toggle("DROPZONE", isOn: $drop)
                        .foregroundColor(.white)
                    
                    Text(viewModel.dropZoneString)
                        .foregroundColor(.white)
                }.fixedSize(horizontal: false, vertical: true)
                
                Group {
                    Toggle("GEAR", isOn: $gear)
                        .foregroundColor(.white)
                    
                    Text(viewModel.gearString).foregroundColor(.white)
                    
                    Toggle("LEGENDS", isOn: $legend)
                        .foregroundColor(.white)
                    
                    ForEach(viewModel.characterArray, id: \.self) { legend in
                        Text(legend)
                    }.foregroundColor(.white)
                    
                    Toggle("SPECIALS", isOn: $special)
                        .foregroundColor(.white)
                    
                    Text(viewModel.specialString)
                        .foregroundColor(.white)
                    
                    //  Spacer().frame(height: 70)
                }.fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                    viewModel.resetButton()
                }, label: {
                    Text("RESET")
                }).frame(minWidth: 0, maxWidth: 200)
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
                }).frame(minWidth: 0, maxWidth: 200)
                .font(Font.custom("blocktastic", size: 30))
                .padding()
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 3))
                Spacer()
            }
            .background(Image("game_view")
                            .resizable()
                            .edgesIgnoringSafeArea(.all))
        }
    }
}

