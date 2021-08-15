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
    var duos: Bool = false
    
    //SWITCHES
    var weaponSwitch: Bool = true
    var locationSwitch:Bool  = true
    var medicalsSwitch: Bool = true
    var gearSwitch: Bool = true
    var legendSwitch: Bool = true
    var specialsSwitch: Bool = true
    
    
    
    //Random Results
    @Published var legendString: String = ""
    @Published var weaponsString: String = ""
    @Published var dropZoneString: String = ""
    @Published var medString: String = ""
    @Published var gearString: String = ""
    @Published var specialString: String = ""
    private var characterArray: [String] = []
    
    //Model Call
    let model: Gamemodel = Gamemodel()
    
    init (){}
    init(MAP: String) {
        mapChoice = MAP
    }
    
    func startGame() {
        
        
        if locationSwitch {
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
        } else {
            dropZoneString = ""
        }
        
        if weaponSwitch {
            weaponsString = getRandom(array: model.WEAPONS)
        } else {
            weaponsString = ""
        }
        
        if medicalsSwitch {
            medString = getRandom(array: model.MEDICALS)
        } else {
            medString = ""
        }
        
        if gearSwitch {
            gearString = getRandom(array: model.GEAR)
        } else {
            gearString = ""
        }
        
        if legendSwitch {
            
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
                legendString = characterArray.joined(separator: ", ")
            } else {
                characterArray = [firstPos,secPos,thirdPos]
                legendString = characterArray.joined(separator: ", ")
            }
        } else {
            legendString = ""
            characterArray = []
        }
        
        if specialsSwitch {
            specialString = getRandom(array: model.SPECIAL)
        } else {
            specialString = ""
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
        legendString = ""
        characterArray = []
        weaponSwitch = true
        locationSwitch = true
        medicalsSwitch = true
        gearSwitch = true
        legendSwitch = true
        specialsSwitch = true
        
    }
}
