//
//  GameView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/25/21.
//

import SwiftUI

struct GameView: View {
    @State var test: Bool
    var body: some View {
        VStack {
            Group{
                Toggle("WEAPONS", isOn: $test)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
                    .foregroundColor(.white)

                Toggle("MEDICALS", isOn: $test)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
                    .foregroundColor(.white)
                Toggle("DROPZONE", isOn: $test)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
            }
            Group {
                
                Toggle("GEAR", isOn: $test)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
               
                Toggle("LEGENDS", isOn: $test)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
              
                Toggle("SPECIALS", isOn: $test)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
                Spacer().frame(height: 70)
            }
            
            Button(action: {
                //TODO: Add logic later
            }, label: {
                Text("RESET")
            }).padding(.horizontal, 60)
            .padding(.vertical,10)
            .foregroundColor(.white)
            .background(Color.red)
            
            Spacer().frame(height: 30)
            
            Button(action: {
                //TODO: Add logic later
            }, label: {
                Text("RANDOMIZER")
            }).padding(.horizontal, 60)
            .padding(.vertical,10)
            .foregroundColor(.white)
            .background(Color.red)
            Spacer()
            
            
            
        }.background(Image("game_view")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}

struct GameView_Previews: PreviewProvider {
    //   var test = true
    static var previews: some View {
        GameView(test: true)
    }
}
