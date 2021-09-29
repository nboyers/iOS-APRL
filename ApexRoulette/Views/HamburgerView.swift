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
    @State private var showingAlert = false
    
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Spacer().frame(height: proxy.size.height * 0.15)
                
                //MARK: IAP BUTTON
                HStack {
                    Image(systemName: viewmodel.purchasedID.isEmpty ? "dollarsign.square.fill" : "hand.thumbsup.fill")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    
                    Button(viewmodel.purchasedID.isEmpty ? "Premium" : "Thank you"){
                        if viewmodel.purchasedID.isEmpty {
                            viewmodel.purchase()
                        } else {
                            viewmodel.fetchProducts()
                        }
                    }
                    .foregroundColor(.gray)
                    .font(.headline)
                    .disabled(!viewmodel.products.isEmpty)
                    
                }.padding(.top, 30)
                
                
                
                //MARK: Restore Button
                HStack {
                    Image(systemName: "wand.and.stars")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Button("Restore Purchase") {
                        if viewmodel.purchasedID.isEmpty {
                            viewmodel.purchase()
                        } else {
                            viewmodel.fetchProducts()
                            showingAlert = true
                        }
                    }
                    .foregroundColor(.gray)
                        .font(.headline)
                        .alert("Purchase Restored!", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) {}
                        }
                        .disabled(viewmodel.products.isEmpty)
                    
                    
                    }.padding(.top,30.0)
                    
                    
                    //MARK: GAME FUNCTIONS
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
