//
//  UserCard.swift
//  JamSession
//
//  Created by Chris Koehne on 8/11/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct UserCard: View {
    @EnvironmentObject var user: User
    
    let picWidth: CGFloat = screenWidth * 0.95

    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            //                RoundedRectangle(cornerRadius: 20, style: .continuous)
            //                    .foregroundColor(ColorManager.jamSessionDefault)
            //                    .frame(width: picWidth, height: picWidth * 3/2, alignment: .center)
            
            Rectangle()
                .foregroundColor(ColorManager.jamSessionDarker)
                .frame(width: picWidth, height: picWidth * 3/2, alignment: .center)
            Rectangle().foregroundColor(ColorManager.white).frame(width: picWidth, height: 100, alignment: .center).opacity(0.5)
            VStack {
                Text("\(user.firstName)")
                    .font(.largeTitle).bold()
                    .foregroundColor(ColorManager.white)
                    .shadow(radius: 5)
                    .padding()
                Spacer()
                Text("hi")
            }
            .frame(width: picWidth, height: picWidth * 3/2, alignment: .bottomLeading)
            
        }
        
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard()
            .environmentObject(
                User(email: "ckoehne@purdue.edu", firstName: "Chris", lastName: "Koehne", password: "ffffff", info0: InstrumentInfo(instrument: Instrument.guitarLead,proficiency: 2.0),
                     info1: InstrumentInfo(instrument: Instrument.drums, proficiency: 2.0),
                     info2: InstrumentInfo(instrument: Instrument.none, proficiency: 2.0),
                     genre0: Genre.alt,genre1: Genre.none, genre2: Genre.none, bio: "ugh")
        )
    }
}
