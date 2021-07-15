//
//  RouletteViewModel.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/25/21.
//

import Foundation
import Combine

public class RouletteViewModel : ObservableObject  {
    // Plays into what map is chosen
    var mapChoice: String = ""
    var duos: Bool = true
    
    //SWITCHES
    var weapon: Bool = true
    var location:Bool  = true
    var medicals: Bool = true
    var gear: Bool = true
    var legend: Bool = true
    var specials: Bool = true
    
    
    
    //Random Results
    private var characterString: String = ""
    @Published var weaponsString: String = ""
    @Published var dropZoneString: String = ""
    @Published var medString: String = ""
    @Published var gearString: String = ""
    @Published var specialString: String = ""
    @Published var characterArray: [String] = []
    
    //Model Call
    let model: Gamemodel = Gamemodel()
    
    init(){}
    
    init(MAP: String) {
        mapChoice = MAP
    }
    
    func startGame() {
        if location {
            switch(mapChoice){
            case "OLYMPUS":
                dropZoneString = getRandom(array: model.OLYMPUS)
                break;
                
            case "WORLD'S EDGE":
                dropZoneString = getRandom(array: model.WORLDS_EDGE)
                break;
            default:
                dropZoneString = ""
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
    
    private func getRandom( array: [String] )-> String {
        return array.randomElement()!
    }
    func resetButton() {
        weaponsString  = ""
        dropZoneString = ""
        medString = ""
        gearString = ""
        specialString = ""
        characterArray =  []
    }
}
