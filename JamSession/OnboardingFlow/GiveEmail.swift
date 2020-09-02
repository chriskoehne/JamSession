//
//  GiveEmail.swift
//  JamSession
//
//  Created by Chris Koehne on 7/31/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct GiveEmail: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    @Environment(\.presentationMode) var presentationMode
    @State var goodEmail: Bool = false
    @State var firstTime: Bool = true
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Let's start with your email").font(.system(size: onboardingFontSize())).foregroundColor(ColorManager.white).bold()
                    .padding([.leading, .trailing], (screenWidth - screenWidth * 0.94))
                
                TextField("example@purdue.edu", text: $user.email, onCommit: {
                    self.verifyEmail()
                } ).textFieldStyle(UnderlineStyle()).keyboardType(.emailAddress).autocapitalization(UITextAutocapitalizationType.none)
                    .disableAutocorrection(true)
                
                
                
                if goodEmail || firstTime {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.clear)
                            .frame(width: screenWidth * 3/4, height: screenWidth * 3/4 * 1/3)
                        Text("Please enter a valid Purdue email.").bold().foregroundColor(.clear)
                    }.opacity(0)
                    
                } else if !firstTime {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.lessCoolCoral]), startPoint: .leading, endPoint: .trailing))
                        Text("Please enter a valid Purdue email.").bold().foregroundColor(ColorManager.white)
                    }
                    .frame(width: screenWidth * 3/4, height: screenWidth * 3/4 * 1/3)
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.15)))
                }
                Spacer()
                if goodEmail {
                    NavigationLink(destination: GiveFirstName()) {
                        ZStack {
                            Capsule(style: .continuous)
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                .shadow(radius: 8, x: 8, y: 8)
                            Text("Continue").font(.largeTitle).foregroundColor(ColorManager.white).bold()
                        }
                        .frame(width: screenWidth * 0.8, height: screenWidth * 0.18, alignment: .center)
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.15)))
                    }
                }
                else {
                    ZStack {
                        Capsule(style: .continuous)
                            .fill(Color.clear)
                            .shadow(radius: 8, x: 8, y: 8)
                        Text("Continue").font(.largeTitle).foregroundColor(ColorManager.white).bold()
                    }
                    .frame(width: screenWidth * 0.8, height: screenWidth * 0.18, alignment: .center)
                    .opacity(0)
                }
                
                Spacer()
                //                Text("\(screenWidth) | \(onboardingFontSize())")
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                OnboardingBackButton()
            }
        )
        .onAppear {
            if self.user.email != "" {
                self.verifyEmail()
            }
        }
    }
    
    func verifyEmail() {
        self.firstTime = false
        user.email = user.email.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = user.email
        let regex = try! NSRegularExpression(pattern: "^([a-zA-Z0-9]{2,15}@purdue.edu)$")
        let range = NSRange(location: 0, length: email.utf16.count)
        self.goodEmail = regex.firstMatch(in: email, options: [], range: range) != nil
    }
}

struct GiveEmail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GiveEmail()
                .environmentObject(User(email: "", firstName: "", lastName: "", password: ""))
                .environmentObject(UserStatus())
        }
    }
}
