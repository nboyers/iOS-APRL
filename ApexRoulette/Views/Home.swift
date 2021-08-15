//
//  Home.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 8/15/21.
//

import SwiftUI

struct Home: View {
    
    @State var showPop: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(1...15, id: \.self) { index in
                    Button {
                        withAnimation {
                            showPop.toggle()
                        }
                    } label: {
                       Text("Figure \(index)")
                    }
        
                    .foregroundColor(.primary)
                }
            }
            .navigationTitle("Full Swipe Pop")
            
        }.fullSwipePop(show: $showPop){
            GameView()
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
