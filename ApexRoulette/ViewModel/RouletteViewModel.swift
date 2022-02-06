//
//  RouletteViewModel.swift
//  ApexRoulette
//
// Created by Noah Boyers on 8/26/21.
//

import Foundation
import Combine
import SwiftUI



public class RouletteViewModel : ObservableObject  {
    // Plays into what map is chosen
    var mapChoice: String   = ""
    @Published var duos: Bool = false
    @Published var starterLegends: Bool = false
    
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
    
    
    init(){}
    init(MAP: String, DUO:Bool,STARTERS: Bool){
        mapChoice = MAP
        duos = DUO
        starterLegends = STARTERS
    }
    
    
    func startGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            if locationSwitch {
                switch(mapChoice){
                case "OLYMPUS":
                    dropZoneString = getRandom(array: model.OLYMPUS)
                    break;
                    
                case "WORLD'S EDGE":
                    dropZoneString = getRandom(array: model.WORLDS_EDGE)
                    break;
                case "Kings Canyon":
                    dropZoneString = getRandom(array: model.KINGS_CANYON)
                    break
                case "Storm Point":
                    dropZoneString = getRandom(array: model.STORM_POINT)
                    break
                    
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
                
                // This will only fire if the user has paid
                if starterLegends {
                    var starter_one = getRandom(array: model.DEFAULT_LEGENDS)
                    var starter_two = getRandom(array: model.DEFAULT_LEGENDS)
                    var starter_three = getRandom(array: model.DEFAULT_LEGENDS)
                    
                    while starter_one == starter_two || starter_one == starter_three || starter_two == starter_three {
                        starter_one = getRandom(array: model.DEFAULT_LEGENDS)
                        starter_two = getRandom(array: model.DEFAULT_LEGENDS)
                        starter_three = getRandom(array: model.DEFAULT_LEGENDS)
                    }
                    if duos {
                        characterArray = [starter_one, starter_two]
                        legendString = characterArray.joined(separator: ", ")
                    } else {
                        characterArray = [starter_one,starter_two,starter_three]
                        legendString = characterArray.joined(separator: ", ")
                    }
                    
                } else {
                    
                    // This is the default free version
                    var firstPos: String = getRandom(array: model.ALL_LEGENDS)
                    var secPos: String = getRandom(array: model.ALL_LEGENDS)
                    var thirdPos: String = getRandom(array: model.ALL_LEGENDS)
                    
                    while(firstPos == secPos || firstPos == thirdPos || secPos == thirdPos) {
                        firstPos = getRandom(array: model.ALL_LEGENDS)
                        secPos = getRandom(array: model.ALL_LEGENDS)
                        thirdPos = getRandom(array: model.ALL_LEGENDS)
                    }
                    if duos {
                        characterArray = [firstPos,secPos]
                        legendString = characterArray.joined(separator: ", ")
                    } else {
                        characterArray = [firstPos,secPos,thirdPos]
                        legendString = characterArray.joined(separator: ", ")
                    }
                }
                
            }else {
                legendString = ""
                characterArray = []
            }
            
            
            
            if specialsSwitch {
                specialString = getRandom(array: model.SPECIAL)
            } else {
                specialString = ""
            }
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
