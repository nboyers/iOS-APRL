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
    @State var nothing: Bool = false
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Spacer().frame(height: proxy.size.height * 0.15)
                
                HStack {
                    Image(systemName: viewmodel.purchasedID.isEmpty ? "dollarsign.square.fill" : "arrow.2.squarepath")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    
                    Button(action:{
                        if viewmodel.purchasedID.isEmpty {
                            viewmodel.purchase()
                        } else {
                            viewmodel.fetchProducts()
                        }
                    }) {
                        Text(viewmodel.purchasedID.isEmpty ? "Premium" : "Retore Purchase")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                    
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
