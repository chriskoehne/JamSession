//
//  InstrumentData.swift
//  JamSession
//
//  Created by Chris Koehne on 7/12/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import Foundation

struct InstrumentData {
    var instrument: Instrument
    var proficiency: Double
    var instrumentTwo: Instrument?
    var proficiencyTwo: Double?
    // I could also do a list of instruments that could correspond to proficiencies
    
}

enum Instrument: String {
    case guitar = "Guitar"
    case electricGuitar = "Guitar (electric)"
    case acousticGuitar = "Guitar (acoustic)"
    case bass = "Bass"
    case drums = "Drums"
    case piano = "Piano"
    case vocals = "Vocals"
    case saxophone = "Saxophone"
    case percussion = "Percussion"
    case clarinet = "Clarinet"
    case other = "Other"
}

//enum Proficiency: Double {
//    case newbie = 0.0
//    case novice = 1.0
//    case intermediate = 2.0
//    case advanced = 3.0
//    case expert = 4.0
//}
