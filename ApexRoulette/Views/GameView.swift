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
    

    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Group {
                    Toggle("WEAPONS", isOn: $weapon)
                        .foregroundColor(.white)
                        .padding()
                        
                    
                    Text(viewModel.weaponsString)
                        .foregroundColor(.white)
                        .frame(height: 10)
                    
                    Toggle("MEDICALS", isOn: $meds)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text(viewModel.medString)
                        .foregroundColor(.white)
                        .frame(height: 10)
                    
                    Toggle("DROPZONE", isOn: $location) //for the map
                        .foregroundColor(.white)
                        .padding()
                    
                    Text(viewModel.dropZoneString)
                        .foregroundColor(.white)
                        .frame(height: 10)
                    
                }.fixedSize(horizontal: false, vertical: true)
                
                
                Group {
                    Toggle("GEAR", isOn: $gear)
                        .foregroundColor(.white)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(viewModel.gearString)
                        .foregroundColor(.white)
                        
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Toggle("LEGENDS", isOn: $legend) // FOR DUOS
                        .foregroundColor(.white)
                        .padding()
                    
                    ForEach(viewModel.characterArray, id: \.self) { legend in
                        Text(legend)
                            .fixedSize(horizontal: true, vertical: true)
                    }.foregroundColor(.white)
                    
                    Toggle("SPECIALS", isOn: $special)
                        .foregroundColor(.white)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(viewModel.specialString)
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)

                    
                }
                
                
               Spacer()
                ButtonsGroup(viewModel: viewModel)
                Spacer()
                //  BackButton()
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
            })
            .frame(minWidth: 0, maxWidth: 150)
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

struct BackButton: View {
    var body: some View {
        NavigationLink(destination: ContentView()) {
            Text("Back")
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
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
