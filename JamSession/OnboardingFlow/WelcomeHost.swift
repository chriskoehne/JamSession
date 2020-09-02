//
//  WelcomeHost.swift
//  JamSession
//
//  Created by Chris Koehne on 8/6/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct WelcomeHost: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    var body: some View {
        ZStack {
            if userStatus.loggedIn == false {
                LoginPage()
            } else {
                ProfileForm()
                    .transition(.move(edge: .trailing)).animation(.default)
            }
        }
    }
}

struct WelcomeHost_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeHost()
            .environmentObject(User())
            .environmentObject(UserStatus())
    }
}

class UserStatus: ObservableObject {
    @Published var loggedIn: Bool = false
}
