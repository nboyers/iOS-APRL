//
//  HamburgerView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 8/11/21.
//

import SwiftUI

/// TODO: Create a paid button + Debugging
/// FIXME: Toggle for legends and duos not responding correctly

struct HamburgerView: View {
    @ObservedObject var hamView = HambugerViewModel()
    @ObservedObject var gameView = RouletteViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Rating")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 100)
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Premium")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 30)
                
                VStack {
                    Toggle("Starter Legends", isOn: $gameView.starterLegends)
                        .frame(width: proxy.size.width / 1.5)
                        .disabled(!hamView.isPremuim)
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                    
                    Toggle("DUOS", isOn: $gameView.duos)
                        .frame(width: proxy.size.width / 1.5)
                        .disabled(!hamView.isPremuim)
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32/255, green: 32/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HamburgerView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
