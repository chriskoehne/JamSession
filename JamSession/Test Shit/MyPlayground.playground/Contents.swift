import UIKit
import Foundation

class User: ObservableObject {
    @Published var username: String
    @Published var name: String
    @Published var info0: InstrumentInfo
    @Published var info1: InstrumentInfo
    @Published var info2: InstrumentInfo
    @Published var genre0: Genre
    @Published var genre1: Genre
    @Published var genre2: Genre
    @Published var bio: String
    
    
    func getNumInstruments() -> Int {
        return info2.instrument != Instrument.none ? 3 : info1.instrument != Instrument.none ? 2 : 1
    }
    
    func getNumGenres() -> Int {
        return genre2 != Genre.none ? 3 : genre1 != Genre.none ? 2 : 1
    }
//    func instrumentOptions(_ infoA: InstrumentInfo, _ infoB: InstrumentInfo, except: InstrumentInfo) -> [Instrument] {
//        let instruments = [infoA.instrument, infoB.instrument]
//        return allInstruments.filter { !instruments.contains($0) }
//    }
    
    func defaultInstrument() -> Instrument {
        let instruments = [info0.instrument, info1.instrument, info2.instrument]
        return allInstruments.filter { !instruments.contains($0) } [0]
    }
    
    
    
    init(username: String, name: String, info0: InstrumentInfo, info1: InstrumentInfo, info2: InstrumentInfo, genre0: Genre, genre1: Genre, genre2: Genre, bio: String) {
        self.username = username
        self.name = name
        self.info0 = info0
        self.info1 = info1
        self.info2 = info2
        self.genre0 = genre0
        self.genre1 = genre1
        self.genre2 = genre2
        self.bio = bio
    }
}

struct InstrumentInfo: Equatable, Hashable {
    var instrument: Instrument
    var proficiency: Double

}

enum Instrument: String, CaseIterable, Identifiable {
    case guitar = "Guitar"
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

enum Proficiencies: String, CaseIterable {
    case novice = "Novice"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
//    case expert = "Expert"
}

struct MusicOptions {
    
    let instrumentInfos: [Instrument] = Instrument.allCases
    
//    let instrumentInfos =  ["Guitar", "Bass", "Drums", "Piano", "Vocals",
//                        "Saxophone", "Percussion", "Clarinet", "Other"]
    
    let genres = ["Rock", "Alternative", "Pop", "Punk", "Indie", "Electric",
                  "Country", "Folk", "Jazz", "Blues", "Other"]
    
}


 let allInstruments: [Instrument] = Instrument.allCases


func stripProficiencies(infos: [InstrumentInfo?]) -> [Instrument] {
    var stripped = [Instrument]()
    print("here")
    for i in 0..<infos.count {
        if infos[i] != nil {
            stripped.append(infos[i]!.instrument)
        }
    }
    
    return stripped
}

func updateInstruments(userInstrument: [InstrumentInfo]) -> [Instrument] {
    let filterFrom = stripProficiencies(infos: userInstrument)
    return allInstruments.filter { !filterFrom.contains($0) }
}

func updateExcept(userInfo: [InstrumentInfo?], except: Instrument) -> [Instrument] {
    var filterFrom = stripProficiencies(infos: userInfo)
    filterFrom = filterFrom.filter { $0 != except }
    return allInstruments.filter { !filterFrom.contains($0) }
}

private func defaultInstrument(infos: [InstrumentInfo]) -> Instrument {
    let filtered = updateInstruments(userInstrument: infos)
    return filtered[0]

}

func allInstrExcept(except: InstrumentInfo) -> [Instrument] {
    return allInstruments.filter { $0 != except.instrument}
}



var user = User(username: "ckoehne", name: "Chris Koehne", info0: InstrumentInfo(instrument: Instrument.guitar, proficiency: 2.0), info1: InstrumentInfo(instrument: Instrument.drums, proficiency: 2.0), info2: InstrumentInfo(instrument: Instrument.bass, proficiency: 2.0), genre0: Genre.alt, genre1: Genre.none, genre2: Genre.none, bio: "Fuck bios")


//dump(user.defaultInstrument())


//dump(user.instrumentOptions(user.info1, user.info2, except: user.info0))
//var infos = [InstrumentInfo(instrument: Instrument.guitar, proficiency: 2.0), InstrumentInfo(instrument: Instrument.bass, proficiency: 1.0), InstrumentInfo(instrument: Instrument.drums, proficiency: 0.0)]
//
//var infos: [InstrumentInfo?] = [nil, nil]
//
//dump(updateExcept(userInfo: infos, except: Instrument.guitar))
//print()
//dump(defaultInstrument(infos: infos))

var og: [Int?] = [nil, 1, 2, 3, 4, nil]

og[4] = nil

func shiftShit(og: [Int?]) -> [Int?] {
    var arr = og
    for i in 1..<arr.count {
        if arr[i] != nil && arr[i - 1] == nil {
            arr[i - 1] = arr[i]
            arr[i] = nil
        }
    }
    return arr
}

og = shiftShit(og: og)
dump(og)


