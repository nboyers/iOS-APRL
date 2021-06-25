//
//  RouletteViewModel.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/25/21.
//

import Foundation
import Combine


public class RouletteViewModel : ObservableObject {
    // Plays into what map is chosen
    var mapChoice: String = ""
    
    //SWITCHES
    var weapon: Bool
    var dropZone:Bool
    var medicals: Bool
    var gear: Bool
    var legend: Bool
    var specials: Bool
    var duos: Bool
    
    //Random Results
    private var characterString: String?
    @Published var weaponsString: String?
    @Published var dropZoneString: String?
    @Published var medString: String?
    @Published var gearString: String?
    @Published var specialString: String?
    @Published var characterArray: [String]?
    
    //Model Call
    let model: Gamemodel = Gamemodel()
    
    
    init(WEAPONS: Bool, DROPZONE: Bool, MEDS: Bool,
         GEAR: Bool, LEGENDS: Bool, SPECIALS: Bool, DUOS: Bool) {
        weapon = WEAPONS
        dropZone = DROPZONE
        medicals = MEDS
        gear = GEAR
        legend = LEGENDS
        specials = SPECIALS
        duos = DUOS
    }
    
    func startGame() {
        
        DispatchQueue.main.async { [self] in
            
            if dropZone {
                switch(mapChoice){
                case "Olympus":
                    mapChoice = getRandom(array: model.OLYMPUS)
                    break;
                    
                case "Worlds Edge":
                    mapChoice = getRandom(array: model.WORLDS_EDGE)
                    break;
                default:
                    mapChoice = ""
                }
            }
            
            if weapon {
                weaponsString = getRandom(array: model.WEAPONS)
            } else {
                weaponsString = ""
            }
            
            if medicals {
                medString = getRandom(array: model.MEDICALS)
            } else {
                medString = ""
            }
            
            if gear {
                gearString = getRandom(array: model.GEAR)
            } else {
                gearString = ""
            }
            if legend {
                
                var firstPos: String = getRandom(array: model.LEGENDS)
                var secPos: String = getRandom(array: model.LEGENDS)
                var thirdPos: String = getRandom(array: model.LEGENDS)
                
                while(firstPos == secPos || firstPos == thirdPos || secPos == thirdPos) {
                    firstPos = getRandom(array: model.LEGENDS)
                    secPos = getRandom(array: model.LEGENDS)
                    thirdPos = getRandom(array: model.LEGENDS)
                }
                if duos {
                    characterArray = [firstPos,secPos]
                } else {
                    characterArray = [firstPos,secPos,thirdPos]
                }
            }
            
            if specials {
                specialString = getRandom(array: model.SPECIAL)
            }
        }
        
    }
    
    private func getRandom( array: [String] )-> String {
        return array.randomElement()!
    }
}
