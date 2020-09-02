//
//  GivePassword.swift
//  JamSession
//
//  Created by Chris Koehne on 8/3/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct GivePassword: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    @Environment(\.presentationMode) var presentationMode
    @State var goodPassword: Bool = false
    @State var firstTime: Bool = true
    @State var wrongLength: Bool = false
    @State var wrongCharacter: Bool = false
    @State var hidePassword: Bool = true
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Create a password").font(.system(size: onboardingFontSize())).foregroundColor(ColorManager.white).bold()
                    .frame(width: screenWidth * 0.8, alignment: .leading)
                
                VStack {
                    HStack {
                        if hidePassword {
                            SecureField("hackmeplz123!", text: $user.password, onCommit: {
                                self.verifyPassword()
                            } )
                                .autocapitalization(UITextAutocapitalizationType.none)
                                .foregroundColor(ColorManager.white)
                                .font(.title)
                        } else {
                            TextField("hackmeplz123!", text: $user.password, onCommit: {
                                self.verifyPassword()
                            })
                                .autocapitalization(UITextAutocapitalizationType.none)
                                .foregroundColor(ColorManager.white)
                                .font(.title)
                        }
                        
                        Button(action: {
                            self.hidePassword.toggle()
                        }) {
                            if hidePassword {
                                Image(systemName: "eye.fill").foregroundColor(ColorManager.noPurple)
                            } else {
                                Image(systemName: "eye.slash.fill").foregroundColor(ColorManager.noPurple)
                            }
                        }
                    }
                    LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .leading, endPoint: .trailing).frame(height: 5.0, alignment: .bottom)
                }.frame(width: screenWidth * 0.8, height: screenWidth * 0.15, alignment: .center)
                
                
                
                if goodPassword || firstTime {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.clear)
                        
                        Text("This is a placeholder").bold().foregroundColor(.clear)
                    }
                    .frame(width: screenWidth * 3/4, height: screenWidth * 3/4 * 1/3).opacity(0)
                    
                } else if !firstTime {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.lessCoolCoral]), startPoint: .leading, endPoint: .trailing))
                        
                        if self.wrongLength {
                            Text("Password length should be between 6 and 20 characters").bold().foregroundColor(ColorManager.white)
                        }
                        if self.wrongCharacter {
                            Text("!@#$%^&*(){}_.?'- are the only allowed special characters").bold().foregroundColor(ColorManager.white)
                        }
                    }
                    .frame(width: screenWidth * 3/4, height: screenWidth * 3/4 * 1/3)
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.15)))
                }
                Spacer()
                if goodPassword {
                    NavigationLink(destination: GiveConfirmPassword()) {
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
                    }.frame(width: screenWidth * 0.8, height: screenWidth * 0.18, alignment: .center).opacity(0)
                }
                
                Spacer()
                //                Text("\(screenWidth) | \(onboardingFontSize())")
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.hidePassword = true
                self.presentationMode.wrappedValue.dismiss()
            }) {
                OnboardingBackButton()
            }
        )
        .onAppear {
            self.hidePassword = true
            if self.user.password != "" {
                self.verifyPassword()
            }
        }
    }
    
    func verifyPassword() {
        self.firstTime = false
        self.wrongLength = false
        self.wrongCharacter = false
        let password = user.password
        if password.count < 6 || password.count > 20 {
            self.wrongLength = true
        }
        let regex = try! NSRegularExpression(pattern: "^([a-zA-Z0-9!@#$%^&*(){}_.?'-]{6,20})$")
        let range = NSRange(location: 0, length: password.utf16.count)
        self.goodPassword = regex.firstMatch(in: password, options: [], range: range) != nil
        if !self.goodPassword && (password.count < 6 || password.count > 20) {
            self.wrongLength = true
        }
        else if !self.goodPassword{
            self.wrongCharacter = true
        }
    }
}

struct GivePassword_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GivePassword()
                .environmentObject(User(email: "", firstName: "", lastName: "", password: ""))
                .environmentObject(UserStatus())
        }
    }
}
