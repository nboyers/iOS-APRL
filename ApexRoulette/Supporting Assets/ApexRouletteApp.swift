//
//  ApexRouletteApp.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/20/21.
//

import SwiftUI

@main
struct ApexRouletteApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(weapon: true, meds: true,drop: true,gear: true, legend: true,special: true)
        }
    }
}
