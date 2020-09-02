//
//  GiveConfirmPassword.swift
//  JamSession
//
//  Created by Chris Koehne on 8/3/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct GiveConfirmPassword: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    @Environment(\.presentationMode) var presentationMode
    @State var samePassword: Bool = false
    @State var firstTime: Bool = true
    @State var hidePassword: Bool = true
    @State var check: String = ""
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Confirm your password").font(.system(size: onboardingFontSize())).foregroundColor(ColorManager.white).bold()
                    .frame(width: screenWidth * 0.8, alignment: .leading)
                
                VStack {
                    HStack {
                        if hidePassword {
                            SecureField("hackmeplz123!", text: $check, onCommit: {
                                self.confirmPassword()
                            } )
                                .autocapitalization(UITextAutocapitalizationType.none)
                                .foregroundColor(ColorManager.white)
                                .font(.title)
                        } else {
                            TextField("hackmeplz123!", text: $check, onCommit: {
                                self.confirmPassword()
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
                
                
                
                if samePassword || firstTime {
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
                        
                        Text("Passwords do not match").bold().foregroundColor(ColorManager.white)
                    }
                    .frame(width: screenWidth * 3/4, height: screenWidth * 3/4 * 1/3)
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.15)))
                }
                Spacer()
                if samePassword {
                   NavigationLink(destination: AccountCreated()) {
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
                ZStack {
                    Rectangle()
                        .frame(width: 20, height: 40).foregroundColor(.clear)
                    Image(systemName: "chevron.left").font(.largeTitle)
                        .foregroundColor(ColorManager.noPurple)
                    Image(systemName: "chevron.left").font(.largeTitle)
                        .foregroundColor(ColorManager.noPurple).offset(x: 1, y: 0)
                }
            }
        )
            .onAppear {
                self.hidePassword = true
                if self.check != "" {
                    self.confirmPassword()
                }
        }
    }
    
    func confirmPassword() {
        self.firstTime = false
        self.samePassword = (self.check == self.user.password)
    }
}

struct GiveConfirmPassword_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GiveConfirmPassword()
                .environmentObject(User(email: "", firstName: "", lastName: "", password: "ffffff"))
                .environmentObject(UserStatus())
        }
    }
}
