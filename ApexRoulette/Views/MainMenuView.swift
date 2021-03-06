
import SwiftUI

struct MainMenuView: View {
    
    @State var showMenu = false
    @State var showPop = false
    @State var map: String = ""
    @State var duo: Bool = false
    @State var starter: Bool = false
    
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
                    
                    CompleteView(showPop: $showPop, map: $map)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    
                    if self.showMenu {
                        HamburgerView(startLegend: $starter, duos: $duo)
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                            duo = duo
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.gray)
                    }))
                .gesture(drag)
            }
        }        .fullSwipePop(show: $showPop){
            GameView(viewModel: RouletteViewModel
                .init(MAP: map,DUO: duo, STARTERS: starter))
        }
        .onAppear {
            AppReviewRequest.reviewRequestIfNeeded()
        }
    }
}




struct CompleteView: View {
    @Binding var showPop: Bool
    @Binding var map: String
    @StateObject var adViewmodel = Store()
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Text("Map Selection")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(Font.custom("blocktastic", size: 60))
                        .foregroundColor(.white)
                    
                    //Distance from the button to Text
                    
                    Spacer()
                        .frame(height: geo.size.height * 0.5)
                    
                    //Distance inbetween the buttons
                    HStack {
                        VStack {
                            Group {
                                Button(action: {
                                    adViewmodel.fetchProducts()
                                    self.showPop.toggle()
                                    map = "OLYMPUS"
                                    
                                }) {
                                    Text("OLYMPUS")
                                }
                                Button(action: {
                                    adViewmodel.fetchProducts()
                                    self.showPop.toggle()
                                    map = "WORLD'S EDGE"
                                }) {
                                    Text("WORLD'S EDGE")
                                }
                                
                            }
                            .frame(maxWidth: 200)
                            .font(Font.custom("blocktastic", size: 25))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 3))
                        }
                        
                        VStack {
                            Group {
                                Button(action: {
                                    adViewmodel.fetchProducts()
                                    self.showPop.toggle()
                                    map = "Kings Canyon"
                                }) {
                                    Text("Kings Canyon")
                                }
                                Button(action: {
                                    adViewmodel.fetchProducts()
                                    self.showPop.toggle()
                                    map = "Storm Point"
                                }) {
                                    Text("Storm Point")
                                }
                            }.frame(maxWidth: 200)
                                .font(Font.custom("blocktastic", size: 25))
                                .padding()
                                .foregroundColor(.white)
                                .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 3))
                        }
                    }
                    //Final Spacer at the bottom
                    Spacer()
                        .frame(height: geo.size.height/0.3)
                    
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
        Group {
            MainMenuView()
            MainMenuView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}

