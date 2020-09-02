//
//  MusicOptions.swift
//  JamSession
//
//  Created by Chris Koehne on 7/14/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import Foundation

enum Instrument: String, CaseIterable, Identifiable {
    case guitarLead = "Guitar (lead)"
    case guitarRhythm = "Guitar (rhythm)"
    case bass = "Bass"
    case drums = "Drums"
    case piano = "Piano"
    case vocals = "Vocals"
    case saxophone = "Saxophone"
    case percussion = "Percussion"
    case clarinet = "Clarinet"
    case other = "Other"
    
     case none = "None"
    
    var id: String { self.rawValue }
}

enum Genre: String, CaseIterable, Identifiable {
    case rock = "Rock"
    case alt = "Alternative"
    case pop = "Pop"
    case punk = "Punk"
    case indie = "Indie"
    case electronic = "Electronic"
    case country = "Country"
    case folk = "Folk"
    case jazz = "Jazz"
    case blues = "Blues"
    case other = "Other"
    
    case none = "None"
    
    var id: String { self.rawValue }
    
}

func proficiencyToString(_ proficiency: Double) -> String {
    if proficiency == 0.0 {
        return "Newbie"
    }
    if proficiency == 1.0 {
        return "Novice"
    }
    if proficiency == 2.0 {
        return "Intermediate"
    }
    if proficiency == 3.0 {
        return "Advanced"
    }
    if proficiency == 4.0 {
        return "Expert"
    }
    return "Error"
}

let allGenres: [Genre] = Genre.allCases.filter { $0 != Genre.none }
let allInstruments: [Instrument] = Instrument.allCases.filter { $0 != Instrument.none }





