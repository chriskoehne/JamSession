//
//  MatchPage.swift
//  JamSession
//
//  Created by Chris Koehne on 8/11/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct MatchPage: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                .edgesIgnoringSafeArea(.all)
            
            
            
        }
    }
}

struct MatchPage_Previews: PreviewProvider {
    static var previews: some View {
        MatchPage()
    }
}
