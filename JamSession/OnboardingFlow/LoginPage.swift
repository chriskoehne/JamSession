//
//  SignUpButtons.swift
//  JamSession
//
//  Created by Chris Koehne on 7/25/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct LoginPage: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    var width = screenWidth
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [ ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    Rectangle().frame(width: width, height: width * 0.1, alignment: .center).foregroundColor(.clear)
                    
                    Text("JamSession")
                        .font(Font.custom("LemonMilk", size: 60))
                        .foregroundColor(.white)
                    
                    Rectangle().frame(width: width, height: width * 0.4, alignment: .center).foregroundColor(.clear)
                    
                    NavigationLink(destination: GiveEmail()) {
                        ZStack {
                            
                            Capsule(style: .continuous)
                                .stroke(Color.white, lineWidth: 8)
                                //                        .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.nicePink, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                .frame(width: width * 0.8, height: width * 0.15, alignment: .center)
                                .shadow(radius: 25)
                                .onTapGesture {
                                    print("hi")
                            }
                            Text("Sign Up").font(.largeTitle).bold().foregroundColor(.white)
                            
                        }
                    }
                    
                   
                    Text("Spacer").font(.headline).foregroundColor(.clear)
                    
                    
                    Button(action: {
                        // your action here
                    }) {
                        ZStack {
                            
                            Capsule(style: .continuous)
                                .stroke(Color.white, lineWidth: 8)
                                //                            .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.nicePink, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                
                                .foregroundColor(.black)
                                .frame(width: width * 0.8, height: width * 0.15, alignment: .center)
                                .shadow(radius: 25)
                            Text("Log In").font(.largeTitle).bold().foregroundColor(.white)
                            
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
            .environmentObject(User())
            .environmentObject(UserStatus())
    }
}
