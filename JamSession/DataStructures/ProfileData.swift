//
//  User.swift
//  JamSession
//
//  Created by Chris Koehne on 7/13/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    @Published var email: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var password: String
    @Published var info0: InstrumentInfo
    @Published var info1: InstrumentInfo
    @Published var info2: InstrumentInfo
    @Published var genre0: Genre
    @Published var genre1: Genre
    @Published var genre2: Genre
    @Published var pfPics: [Image?]
    @Published var pfPic0: Image?
    @Published var pfPic1: Image?
    @Published var pfPic2: Image?
    @Published var pfPic3: Image?
    @Published var pfPic4: Image?
    @Published var pfPic5: Image?
    @Published var bio: String

    
    
    func getNumInstruments() -> Int {
        return info2.instrument != Instrument.none ? 3 : info1.instrument != Instrument.none ? 2 : 1
    }
    
    func defaultInstrument() -> Instrument {
        let instruments = [info0.instrument, info1.instrument, info2.instrument]
        return allInstruments.filter { !instruments.contains($0) } [0]
    }
    
    func getNumGenres() -> Int {
        return genre2 != Genre.none ? 3 : genre1 != Genre.none ? 2 : 1
    }
    
    func defaultGenre() -> Genre {
        let genres = [genre0, genre1, genre2]
        return allGenres.filter { !genres.contains($0) } [0]
    }
    
    
    init(email: String, firstName: String, lastName: String, password: String, info0: InstrumentInfo, info1: InstrumentInfo, info2: InstrumentInfo, genre0: Genre, genre1: Genre, genre2: Genre, bio: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.info0 = info0
        self.info1 = info1
        self.info2 = info2
        self.genre0 = genre0
        self.genre1 = genre1
        self.genre2 = genre2
        self.pfPics = [Image?]()
        self.bio = bio
        for _ in 0..<6 {
            self.pfPics.append(nil)
        }
    }
    
    init() {
        self.email = ""
        self.firstName = ""
        self.lastName = ""
        self.password = ""
        self.info0 = InstrumentInfo(instrument: Instrument.guitarLead, proficiency: 2.0)
        self.info1 = InstrumentInfo(instrument: Instrument.none, proficiency: 2.0)
        self.info2 = InstrumentInfo(instrument: Instrument.none, proficiency: 2.0)
        self.genre0 = Genre.rock
        self.genre1 = Genre.none
        self.genre2 = Genre.none
        self.pfPics = [Image?]()
        self.bio = ""
        for _ in 0..<6 {
            self.pfPics.append(nil)
        }
    }
    
    
    init(email: String, firstName: String, lastName: String, password: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        
        self.info0 = InstrumentInfo(instrument: Instrument.guitarLead, proficiency: 2.0)
        self.info1 = InstrumentInfo(instrument: Instrument.none, proficiency: 2.0)
        self.info2 = InstrumentInfo(instrument: Instrument.none, proficiency: 2.0)
        self.genre0 = Genre.rock
        self.genre1 = Genre.none
        self.genre2 = Genre.none
        self.bio = ""
        self.pfPics = [Image?]()
        for _ in 0..<6 {
            self.pfPics.append(nil)
        }
    }
    
    init(info0: InstrumentInfo, info1: InstrumentInfo, info2: InstrumentInfo, genre0: Genre, genre1: Genre, genre2: Genre) {
        self.info0 = info0
        self.info1 = info1
        self.info2 = info2
        self.genre0 = genre0
        self.genre1 = genre1
        self.genre2 = genre2
        
        self.email = ""
        self.firstName = ""
        self.lastName = ""
        self.password = ""
        self.bio = ""
        self.pfPics = [Image?]()
        for _ in 0..<6 {
            self.pfPics.append(nil)
        }
        
    }
    
}

struct InstrumentInfo: Equatable, Hashable {
    var instrument: Instrument
    var proficiency: Double
}

func instrumentOptions(_ infoA: InstrumentInfo, _ infoB: InstrumentInfo, except: InstrumentInfo) -> [Instrument] {
    let instruments = [infoA.instrument, infoB.instrument]
    return allInstruments.filter { !instruments.contains($0) }
}

func genreOptions( _ genreA: Genre, _ genreB: Genre, except: Genre) -> [Genre] {
    let genres = [genreA, genreB]
    return allGenres.filter { !genres.contains($0) }
}

/* old functions */

/*
 func stripProficiencies(infos: [InstrumentInfo]) -> [Instrument] {
    var stripped = [Instrument]()
    for i in 0..<infos.count {
            stripped.append(infos[i].instrument)
    }
    return stripped
}

func defaultInstrument(currentInfo: [InstrumentInfo]) -> Instrument {
    let filterFrom = stripProficiencies(infos: currentInfo)
    return allInstruments.filter { !filterFrom.contains($0) }[0]
}
 */
