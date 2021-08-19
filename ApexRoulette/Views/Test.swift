//
//  Test.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 8/19/21.
//

import SwiftUI

struct Test: View {
    
    @State var show = false
    var body: some View {
 
        NavigationView {
            List {
                ForEach(1...15, id: \.self) { index in
                    Button {
                        withAnimation{
                            show.toggle()
                        }
                    } label: {
                        Text("Day \(index) of Swift")
                    }
                }
            }
            .navigationTitle("TEST..1..2..3")
        }.fullSwipePop(show: $show) {
            GameView(viewModel: RouletteViewModel.init(MAP: "World's Edge"))
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
