//
//  AccountCreated.swift
//  JamSession
//
//  Created by Chris Koehne on 8/7/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct AccountCreated: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Rectangle().frame(width: screenWidth, height: screenWidth * 0.2, alignment: .center).foregroundColor(.clear)
                Text("Account Created!").font(.largeTitle).foregroundColor(ColorManager.white).bold()
                    .frame(width: screenWidth * 0.8, alignment: .leading).padding(.top)
                LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .leading, endPoint: .trailing).frame(width: screenWidth * 0.8, height: 5.0, alignment: .bottom).padding(.bottom)
                Text("Next, you'll add some photos and pick your musical interests").font(.title).foregroundColor(ColorManager.white).bold()
                    .frame(width: screenWidth * 0.8, alignment: .leading)
                Spacer()
                

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    self.userStatus.loggedIn = true
                }) {
                    ZStack {
                        Capsule(style: .continuous)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .shadow(radius: 8, x: 8, y: 8)
                        
                        Text("Continue").font(.largeTitle).foregroundColor(ColorManager.white).bold()
                    }
                    .frame(width: screenWidth * 0.8, height: screenWidth * 0.18, alignment: .center)
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.15)))
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct AccountCreated_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountCreated()
                .environmentObject(User(email: "", firstName: "", lastName: "", password: "ffffff"))
                .environmentObject(UserStatus())
        }
    }
}
