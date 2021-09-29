//
//  GameView.swift
//  ApexRoulette
//
// Created by Noah Boyers on 8/26/21.
//
import SwiftUI


struct GameView: View {
    
    @ObservedObject var viewModel = RouletteViewModel()
    
    let frameHieght: CGFloat = 10
    
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
            Spacer()
            
        }
        .background(Image("game_view")
                        .resizable()
                        .edgesIgnoringSafeArea(.all))
        
    }
    
}



struct ButtonsGroup: View {
    @ObservedObject var viewModel: RouletteViewModel
    @StateObject var adViewmodel = Store()
    var interstitial = Interstitial()
    
    
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
                let seconds = 5.0
                
                if adViewmodel.purchasedID.isEmpty  {
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        self.retriveAds()
                    }
                }
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
    func retriveAds() {
        
        interstitial.LoadInterstitial()
        interstitial.showAd(self)
    }
    
}




struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
