//
//  GameView.swift
//  ApexRoulette
//
// Created by Noah Boyers on 8/26/21.
//
import SwiftUI


struct GameView: View {
    
    @ObservedObject var viewModel = RouletteViewModel()
    @ObservedObject var  store = Store()
    let frameHieght: CGFloat = 10
    @State var live : Bool = true
    var body: some View {
        
        VStack {
            
            Group {
                Toggle("WEAPONS", isOn: $viewModel.weaponSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                
                Text(viewModel.weaponsString)
                    .foregroundColor(.white)
                    .frame(height: frameHieght)
                
                Toggle("MEDICALS", isOn: $viewModel.medicalsSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                Text(viewModel.medString)
                    .foregroundColor(.white)
                    .frame(height: frameHieght)
                
                Toggle("DROPZONE", isOn: $viewModel.locationSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                Text(viewModel.dropZoneString)
                    .foregroundColor(.white)
                    .frame(height: frameHieght)
                
            }
            Group {
                Toggle("GEAR", isOn: $viewModel.gearSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                Text(viewModel.gearString)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                
                Toggle("LEGENDS", isOn: $viewModel.legendSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                Text(viewModel.legendString)
                    .foregroundColor(.white)
                    .frame(height: frameHieght)
                
                
                Toggle("SPECIALS", isOn: $viewModel.specialsSwitch)
                    .foregroundColor(.white)
                    .padding()
                
                
                Text(viewModel.specialString)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
            ButtonsGroup(viewModel: viewModel)
            if store.purchasedID.isEmpty {
                Banner()
            }
        }
        .background(Image("game_view")
                        .resizable()
                        .edgesIgnoringSafeArea(.all))
    }
    
}



struct ButtonsGroup: View {
    @ObservedObject var viewModel: RouletteViewModel
    @StateObject var adViewmodel = Store()
    @State var showIntersitialAd : Bool = false
    var IA = Interstitial()
    var body: some View {
        let adLuck = Int.random(in: 0...4)
        Group {
            Button(action: {
                viewModel.resetButton()
                if adLuck == 2  {
                    IA.showAd(self)
                }
                
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
            

            Button("RANDOMIZER") {
                viewModel.startGame()
            }
            .frame(minWidth: 0, maxWidth: 150)
            .font(Font.custom("blocktastic", size: 30))
            .padding()
            .foregroundColor(.white)
            .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 3))
        }
        Spacer()
        
    }
}
