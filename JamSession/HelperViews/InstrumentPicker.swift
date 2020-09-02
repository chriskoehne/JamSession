//
//  InstrumentPicker.swift
//  JamSession
//
//  Created by Chris Koehne on 7/21/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

// This is meant to be used in a form
struct InstrumentPicker: View {
    
    @ObservedObject var user: User
    
    var body: some View {
        Group {
            //info0
            Picker(selection: $user.info0.instrument, label: Text("Instrument 1")) {
                ForEach(instrumentOptions(user.info1, user.info2, except: user.info0), id: \.self) {
                    Text($0.rawValue)
                }
            }.pickerStyle(DefaultPickerStyle())
            VStack {
                HStack {
                    Text("Proficiency")
                    Spacer()
                    Text("\(proficiencyToString(self.user.info0.proficiency))")
                        .foregroundColor(Color.gray)
                }
                Slider(value: self.$user.info0.proficiency, in: 0...4, step: 1)
                    .accentColor(ColorManager.jamSessionDefault)
                    .padding(.horizontal)
            }
            //info1
            if user.info1.instrument != Instrument.none  {
                Picker(selection: $user.info1.instrument, label: Text("Instrument 2")) {
                    ForEach(instrumentOptions(user.info0, user.info2, except: user.info1), id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(DefaultPickerStyle())
                VStack {
                    HStack {
                        Text("Proficiency")
                        Spacer()
                        Text("\(proficiencyToString(self.user.info1.proficiency))")
                            .foregroundColor(Color.gray)
                    }
                    Slider(value: $user.info1.proficiency, in: 0...4, step: 1)
                        .accentColor(ColorManager.jamSessionDefault)
                        .padding(.horizontal)
                }
            }
            //info2
            if user.info2.instrument != Instrument.none  {
                Picker(selection: $user.info2.instrument, label: Text("Instrument 3")) {
                    ForEach(instrumentOptions(user.info0, user.info1, except: user.info2), id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(DefaultPickerStyle())
                VStack {
                    HStack {
                        Text("Proficiency")
                        Spacer()
                        Text("\(proficiencyToString(self.user.info2.proficiency))")
                            .foregroundColor(Color.gray)
                    }
                    Slider(value: $user.info2.proficiency, in: 0...4, step: 1)
                        .accentColor(ColorManager.jamSessionDefault)
                        .padding(.horizontal)
                }
            }
        }
    }
}



struct InstrumentPicker_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentPicker(user: User(info0: InstrumentInfo(instrument: Instrument.guitarLead,proficiency: 2.0),
                                                  info1: InstrumentInfo(instrument: Instrument.none, proficiency: 2.0),
                                                  info2: InstrumentInfo(instrument: Instrument.none, proficiency: 2.0),
                                                  genre0: Genre.alt,genre1: Genre.none, genre2: Genre.none))
    }
}
