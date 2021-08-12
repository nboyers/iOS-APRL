//
//  ContentView.swift
//  ApexRoulette
// @Author Noah Boyers
//  Updated on 08/11/21.
//

import SwiftUI

// TODO: Hamburger Menu GLitch - Takes user back to main menu
// When they click the menu in GameView


struct MainMenuView: View {
    
    @State var showMenu = false
    
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
            GeometryReader { geo in
                VStack {
                    Group{
                        Text("Map Selection")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(Font.custom("blocktastic", size: 60))
                            .foregroundColor(.white)
                        
                        //Distance from the button to Text
                        
                        Spacer()
                            .frame(height: geo.size.height*0.6)
                        
                        NavigationLink(destination: GameView(viewModel: RouletteViewModel.init(MAP: "OLYMPUS"))
                                        .navigationBarTitle("") //this must be empty
                                        .navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true)) {
                            Text("OLYMPUS")
                        }
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(Font.custom("blocktastic", size: 30))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 3))
                        
                        //Distance inbetween the buttons
                        Spacer()
                            .frame(height: geo.size.height/30)
                        
                        NavigationLink(destination: GameView(viewModel: RouletteViewModel.init(MAP: "WORLD'S EDGE"))
                                        .navigationBarTitle("") //this must be empty
                                        .navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true)) {
                            Text("WORLD'S EDGE")
                        }
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(Font.custom("blocktastic", size: 30))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 3))
                        
                        //Final Spacer at the bottom
                        Spacer()
                            .frame(height: geo.size.height/0.5)
                        
                    }
                }
            }.background(Image("main_menu")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
    }
}


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
