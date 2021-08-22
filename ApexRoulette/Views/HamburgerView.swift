////
////  HamburgerView.swift
////  ApexRoulette
////
////  Created by Noah Boyers on 8/11/21.


import SwiftUI

struct RecipeRow: View {
    let recipe: Recipes
    let action: () -> Void
    
    var body: some View {
        HStack {
            ZStack {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(9)
                    .opacity(recipe.isLocked ? 0.8 : 1)
                    .blur(radius: recipe.isLocked ? 3.0 :0)
                    .padding()
                Image(systemName: "lock.fill")
                    .font(.largeTitle)
                    .opacity(recipe.isLocked ? 1 : 0)
            }
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(recipe.description)
                    .font(.caption)
            }
            Spacer()
            if let price = recipe.price , recipe.isLocked {
                Button(action: action, label: {
                        Text(price)
                            .foregroundColor(.white)
                            .padding([.leading,.trailing,.top,.bottom])
                            .background(Color.black)
                            .cornerRadius(25.0)
                    
                    
                })
            }
        }
    }
}


struct HamburgerView: View {
    @StateObject var store = InAppPurchaseViewModel()
    
    
    
    @Binding var startLegend: Bool
    @Binding var duos: Bool
    
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
                    Toggle("Starter Legends", isOn: $startLegend)
                        .frame(width: proxy.size.width / 1.5)
                        //      .disabled(!hamView.isPremuim)
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                    
                    
                    Toggle("Duos", isOn: $duos)
                        .frame(width: proxy.size.width / 1.5)
                        //   .disabled(!hamView.isPremuim)
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
        .environmentObject(store)
    }
}

struct HamburgerView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
