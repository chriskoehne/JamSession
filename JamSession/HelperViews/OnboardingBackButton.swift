//
//  OnboardingBackButton.swift
//  JamSession
//
//  Created by Chris Koehne on 8/6/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct OnboardingBackButton: View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 20, height: 40).foregroundColor(.clear)
                Image(systemName: "chevron.left").font(.largeTitle)
                    .foregroundColor(ColorManager.noPurple)
                Image(systemName: "chevron.left").font(.largeTitle)
                    .foregroundColor(ColorManager.noPurple).offset(x: 1, y: 0)
            }
            Text("Back").font(.headline).foregroundColor(.clear)
        }
    }
}

struct OnboardingBackButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBackButton()
    }
}
