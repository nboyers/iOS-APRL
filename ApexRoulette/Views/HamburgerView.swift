//
//  HamburgerView.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 8/11/21.
//

import SwiftUI

struct HamburgerView: View {
    var body: some View {
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
            HStack {
                Image(systemName: "hands.sparkles.fill")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Contact Us")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HamburgerView_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerView()
    }
}
