////
////  HamburgerView.swift
////  ApexRoulette
////
/// Created by Noah Boyers on 8/26/21.

import SwiftUI
import StoreKit

struct HamburgerView: View {
    
    @StateObject var  viewmodel = Store()
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
                    Image(systemName: "dollarsign.square.fill")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    
                    
                        Button(action:{
                            if viewmodel.purchasedID.isEmpty {
                                viewmodel.purchase()
                            }
                        }) {
                            Text(viewmodel.purchasedID.isEmpty ? "Premium" : "Thank You")
                                .foregroundColor(.gray)
                                .font(.headline)
                        }.disabled(!viewmodel.purchasedID.isEmpty)
                    
                }.padding(.top, 30)
                
                
                
                
                VStack {
                    Toggle("Starter Legends", isOn: $startLegend)
                        .frame(width: proxy.size.width / 1.5)
                        .disabled(viewmodel.purchasedID.isEmpty)
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                    
                    
                    Toggle("Duos", isOn: $duos)
                        .frame(width: proxy.size.width / 1.5)
                        .disabled(viewmodel.purchasedID.isEmpty)
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
        .onAppear {
            viewmodel.fetchProducts()
        }
    }
}
struct HamburgerView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
