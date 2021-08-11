//
//  ContentView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/20/21.
//

import SwiftUI



struct MainMenuView: View {
    
    @State var showMenu = false //Showing Side View
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }}}
        
        
        NavigationView {
            GeometryReader { geometry in
                
                ZStack(alignment: .leading) {
                    
                    CompleteView(showMenu: $showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    
                    
                    if self.showMenu {
                        HamburgerView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.gray)
                          
                    }
                ))
                .gesture(drag)
            }
        }
        
        
        
    }
}




struct CompleteView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 100)
                
                Text("Map Selection")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("blocktastic", size: 60))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 400)
                OlympusButton()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer().frame(height: 20)
                World_EdgeButton()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer().frame(height: 20)
                
                
                Spacer()
            }.background(Image("main_menu")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
    }
}

struct OlympusButton: View {
    var body: some View {
        NavigationLink(destination: GameView(viewModel: RouletteViewModel.init(MAP: "OLYMPUS"))) {
            Text("OLYMPUS")
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .frame(minWidth: 0, maxWidth: 200)
        .font(Font.custom("blocktastic", size: 30))
        .padding()
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 3))
    }
}

struct World_EdgeButton: View {
    var body: some View {
        NavigationLink(destination: GameView(viewModel: RouletteViewModel.init(MAP: "WORLD'S EDGE"))) {
            Text("WORLD'S EDGE")
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .frame(minWidth: 0, maxWidth: 200)
        .font(Font.custom("blocktastic", size: 30))
        .padding()
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 3))
        
    }
}







struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
