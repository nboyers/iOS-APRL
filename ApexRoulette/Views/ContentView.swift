//
//  ContentView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/20/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Map Selection")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            Spacer().frame(height: 300)
            Button(action: {
                //TODO: Add logic later
            }, label: {
                Text("OLYMPUS")
            }).padding(.horizontal, 60)
            .padding(.vertical,10)
            .foregroundColor(.white)
            .background(Color.red)
            
            Spacer().frame(height: 30)
            
            Button(action: {
                //TODO: Add logic later
            }, label: {
                Text("WORLD'S EDGE")
            }).padding(.horizontal, 60)
            .padding(.vertical,10)
            .foregroundColor(.white)
            .background(Color.red)
            Spacer()
            
        }.background(Image("main_menu")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
