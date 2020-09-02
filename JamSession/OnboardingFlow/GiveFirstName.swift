//
//  GiveFirstName.swift
//  JamSession
//
//  Created by Chris Koehne on 8/2/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct GiveFirstName: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    @Environment(\.presentationMode) var presentationMode
    @State var goodFirstName: Bool = false
    @State var firstTime: Bool = true
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Next comes your first name").font(.system(size: onboardingFontSize())).foregroundColor(ColorManager.white).bold()
                    .padding([.leading, .trailing], (screenWidth - screenWidth * 0.94))
                
                //This is necessary for some reason
                
                TextField("Bruce", text: $user.firstName, onCommit: {
                    self.verifyFirstName()
                } ).textFieldStyle(UnderlineStyle())
                
                
                
                if goodFirstName || firstTime {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.clear)
                        Text("No way that's a real first name.").bold().foregroundColor(.clear)
                    }
                    .frame(width: screenWidth * 3/4, height: screenWidth * 3/4 * 1/3)
                    .opacity(0)
                    
                } else if !firstTime {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.lessCoolCoral]), startPoint: .leading, endPoint: .trailing))
                        
                        Text("No way that's a real first name.").bold().foregroundColor(ColorManager.white)
                    }
                    .frame(width: screenWidth * 3/4, height: screenWidth * 3/4 * 1/3)
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.15)))
                }
                Spacer()
                if goodFirstName {
                    NavigationLink(destination: GiveLastName()) {
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
                if self.user.firstName != "" {
                    self.verifyFirstName()
                }
        }
    }
    
    func verifyFirstName() {
        self.firstTime = false
        user.firstName = user.firstName.trimmingCharacters(in: .whitespacesAndNewlines)
        let firstName = user.firstName
        let regex = try! NSRegularExpression(pattern: "^([a-zA-Z .']{1,30})$")
        let range = NSRange(location: 0, length: firstName.utf16.count)
        self.goodFirstName = regex.firstMatch(in: firstName, options: [], range: range) != nil
    }
}

struct GiveFirstName_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GiveFirstName()
                .environmentObject(User(email: "", firstName: "", lastName: "", password: ""))
                .environmentObject(UserStatus())
        }
    }
}
