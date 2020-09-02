//
//  GenrePicker.swift
//  JamSession
//
//  Created by Chris Koehne on 7/21/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

// This is meant to be used in a form
struct GenrePicker: View {
    
    @ObservedObject var user: User
    
    var body: some View {
        Group {
            Picker(selection: $user.genre0, label: Text("Genre 1")) {
                ForEach(genreOptions(user.genre1, user.genre2, except: user.genre0), id: \.self) {
                    Text($0.rawValue)
                }
            }.pickerStyle(DefaultPickerStyle())
            
            if user.genre1 != Genre.none  {
                Picker(selection: $user.genre1, label: Text("Genre 2")) {
                    ForEach(genreOptions(user.genre0, user.genre2, except: user.genre1), id: \.self) {
                        Text($0.rawValue)
                    }
                }.pickerStyle(DefaultPickerStyle())
            }
            //info2
            if user.genre2 != Genre.none  {
                Picker(selection: $user.genre2, label: Text("Genre 3")) {
                    ForEach(genreOptions(user.genre0, user.genre1, except: user.genre2), id: \.self) {
                        Text($0.rawValue)
                    }
                }.pickerStyle(DefaultPickerStyle())
            }
        }
    }
}

struct GenrePicker_Previews: PreviewProvider {
    static var previews: some View {
        GenrePicker(user: User(info0: InstrumentInfo(instrument: Instrument.guitarLead,proficiency: 2.0),
                                             info1: InstrumentInfo(instrument: Instrument.none, proficiency: 2.0),
                                             info2: InstrumentInfo(instrument: Instrument.none, proficiency: 2.0),
                                             genre0: Genre.alt,genre1: Genre.none, genre2: Genre.none))
    }
}

