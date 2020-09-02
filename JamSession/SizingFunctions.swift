//
//  SizingFunctions.swift
//  JamSession
//
//  Created by Chris Koehne on 8/2/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.size.width

func onboardingFontSize() -> CGFloat {
    return ceil(screenWidth / 8)
}
