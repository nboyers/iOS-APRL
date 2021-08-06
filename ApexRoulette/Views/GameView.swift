//
//  GameView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/26/21.
//

import SwiftUI


struct GameView: View {
    
    @ObservedObject var viewModel = RouletteViewModel() 
   // var interstitial:Interstitial
    
    var body: some View {
        
        VStack {
            
            Group {
                Toggle("WEAPONS", isOn: $viewModel.weaponSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                
                Text(viewModel.weaponsString)
                    .foregroundColor(.white)
                    .frame(height: 10)
                
                Toggle("MEDICALS", isOn: $viewModel.medicalsSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                Text(viewModel.medString)
                    .foregroundColor(.white)
                    .frame(height: 10)
                
                Toggle("DROPZONE", isOn: $viewModel.locationSwitch) //for the map
                    .foregroundColor(.white)
                    .padding()
                
                Text(viewModel.dropZoneString)
                    .foregroundColor(.white)
                    .frame(height: 10)
                
            }
            
            
            Group {
                Toggle("GEAR", isOn: $viewModel.gearSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                Text(viewModel.gearString)
                    .foregroundColor(.white)
                    .frame(height: 10)
                    .fixedSize(horizontal: false, vertical: true)
                
                Toggle("LEGENDS", isOn: $viewModel.legendSwitch) 
                    .foregroundColor(.white)
                    .padding()

                Text(viewModel.legendString)
                    .foregroundColor(.white)
                    .frame(height: 10)

                
                Toggle("SPECIALS", isOn: $viewModel.specialsSwitch)
                    .foregroundColor(.white)
                    .padding()

                
                Text(viewModel.specialString)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            
            Spacer()
            ButtonsGroup(viewModel: viewModel)
            Spacer()
        }
        .background(Image("game_view")
                        .resizable()
                        .edgesIgnoringSafeArea(.all))
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
