//
//  GameModel.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 6/20/21.
//

import Foundation

struct Gamemodel {
    
    let WEAPONS: [String] = ["Light Ammo Only", "Heavy Ammo Only", "Mozambique Only",
                             "No Shotguns", "ARs Only", "No Ars", "Snipers Only", "Energy Ammo Only",
                             "Shotguns Only", "Pistols Only","Guns with Hop Ups Only",
                             "LMGs Only", "Bow Only", "Can't use attachments on weapons", "P2020/Mozambique Only",
                             "Fists Only"]
    
    let MEDICALS: [String] = ["No Lifeline Drone","Lifeline Drone only","No Phoenix Kits",
                              "Phoenix Kits only","No healables","Shield Batteries only","Only shield regen",
                              "Only health regen", "No big heals","Only big heals","Med kits only","Shield Cells only"
                              ,"Syringes only","Who's ready to die on a zipline? I am!"]
    
    let GEAR: [String] = ["No body shields","No arc stars","No extended mags",
                          "No barrel stabalisers","No helmets","Helmets only",
                          "No knockdown shields (minus self res shield)","No red evos","Only white gear",
                          "No frag grenades","No thermite grenades","Only grenades are thermites","No abilities",
                          "Only use the Helmet and Body Shield","Ultimate Accelerant only",
                          "Don't use the Knockdown Shield",
                          "Don't use any body protection","Don't use the backpack"]
    
    let ALL_LEGENDS: [String] = ["Bloodhound","Pathfinder","Bangalore", "Caustic","Crypto",
                             "Fuse", "Gibraltar", "Horizon", "Lifeline","Loba", "Mirage", "Octane", "Rampart", "Revenant",
                             "Wattson", "Wraith","Seer"]
    
    let DEFAULT_LEGENDS: [String] = ["Bloodhound","Pathfinder","Bangalore","Lifeline","Wraith","Gibraltar"]
        
    let SPECIAL:[String] = ["Minimalism: You cannot use a backpack.",
                            "Beware the man with one gun, he knows how to use it: Only use one gun.",
                            "Time's Up! Jumpmaster lands somewhere else to others. " +
                            "You have to stay in water as much as possible. You must find water and fight in it." +
                                    " If there is no water in the circle play as normal.",
                    "Every time you kill someone, you have to switch your weapon that you used to kill them, with one of their weapons.",
                    "Boxing Match. You must drop your weapons, throw hands and punch the final squad to death.",
                            "No Purples! You are not allowed to use anything graded purple or higher. "
                            ,"Purple Evo Shields earned must be dropped immediately!",
                    "Respect the Dead: No looting bodies.",
                    "No Respawns or Revives! Pretty self explanatory. No golden knockdown either.",
                    "Ironman Challenge. You are only allowed to use Mozambique's without hammerpoint!" +
                            " No higher than blue shields and no more than 2 stacks of healable. GL HF." ,
                            "Hot Switch. " + "When you kill someone you must swap your weapons for theirs. " +
                            "You must thirst any downed player and swap before attacking another player.",
                    "Sticks and Stones! Only use grenades and bows for a whole game. GLHF",
                    "Cannot open door, must either loot open structure or shoot/kick/explode the doors open.",
                           "xxXMontageXxx: If you have a scoped weapon, you must do a 360 before you can shoot.",
                            "You can only land on a house if somebody else is already going for that house",
                            "Never revive teammates","Only loot houses from the 2nd floor and up",
                            "Jump out of the plane as soon as possible and only head East. " +
                                    "Land as far east as you can possibly get",
                            "Choose between the first 5 weapons you encounter " +
                                    "but there is no going back once you dropped one." ,
                            "Only use the first weapon you find during the game.",
                            "Act as if your abilities don't exist.",
                            "Keep moving! You are not allowed to stop moving at any point in time.",
                            "You're not allowed to reload whilst fighting an enemy. Switching weapons only!",
                            "After the zone appears, you are only allowed to move when the zone does. " +
                                    "When the zone doesn't move, you don't",
                            "You must go to the center of the circle as fast as you can every time the circle shrinks." +
                                    " you have to find new armor to replace it.",
                            "Hipfire only.","Too late for peace! Don't use the Peacekeeper"]
    
    let OLYMPUS: [String] = ["Oasis" , "Turbine" , "Power Grid" , "Energy Depot" ,
                             "Hammond Labs" , "Grow Towers" , "Gardens" , "Rift" , "Far-Left of Phase Runner" ,
                             "Estates" , "Middle of Phase Runner" , "Elysium" , "Hydroponics" , "Bonsai Plaza" ,
                             "Oribtal Cannon" , "Solar Array" , "Fight Night"]
    
    let WORLDS_EDGE: [String] = ["Trials" , "Skyhook" , "Survey Camp" , "Overlook" ,
                                 "Fragment E" , "Harvester" , "Fragment W" , "Countdown" , "Thermal Station" ,
                                 "Launch Site" , "The Dome" , "Lava City" , "Sorting Factory" , "Staging" ,
                                 "The Geyser" , "Your Choice" , "Train Yard" , "Lava Fissure"]
    
    let KINGS_CANYON = ["Crash Site", "Water/Caustic Treatment", "Broken Relay",
        "Artillery", "Airbase", "Hot Zone", "Runoff", "Salvage" , "Gauntlet", "Spotted Lake" ,
        "The Pit" , "Bunker", "Hydro Dam" , "Repulsor", "Labs", "Swamps",
        "The Cage"];
}
