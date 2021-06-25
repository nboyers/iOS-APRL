//
//  GameView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/25/21.
//

import SwiftUI

struct GameView: View {
    

    @State var weapon: Bool = true
    @State var meds: Bool = true
    @State var drop: Bool = true
    @State var gear: Bool = true
    @State var legend: Bool = true
    @State var special: Bool = true
    @State var duo: Bool = true

    
    var body: some View {
        VStack {
            Group{
                Toggle("WEAPONS", isOn: $weapon)
                    .foregroundColor(.white)
                
                Text("FIXME")
                    .foregroundColor(.white)
                    .foregroundColor(.white)

                Toggle("MEDICALS", isOn: $meds)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
                    .foregroundColor(.white)
                Toggle("DROPZONE", isOn: $drop)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
            }
            
            Group {
                Toggle("GEAR", isOn: $gear)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
               
                Toggle("LEGENDS", isOn: $legend)
                    .foregroundColor(.white)
                Text("FIXEME").foregroundColor(.white)
              
                Toggle("SPECIALS", isOn: $special)
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
        GameView(weapon: true, meds: true,drop: true,gear: true, legend: true,special: true)
    }
}
