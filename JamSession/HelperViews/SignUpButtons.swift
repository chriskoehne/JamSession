//
//  SignUpButtons.swift
//  JamSession
//
//  Created by Chris Koehne on 7/25/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct SignUpButtons: View {
    var width = screenWidth
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ ColorManager.jamSessionDefault, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 2300)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Rectangle().frame(width: width, height: width * 0.1, alignment: .center).foregroundColor(.clear)
                
                Text("JamSession")
                                  .font(Font.custom("LemonMilk", size: 60))
                                  .foregroundColor(.white)
                
                Rectangle().frame(width: width, height: width * 0.2, alignment: .center).foregroundColor(.clear)
                ZStack {
                    
                    Capsule(style: .continuous)
                        .stroke(Color.white, lineWidth: 8)
                        .foregroundColor(.black)
                        .frame(width: width * 0.8, height: width * 0.15, alignment: .center)
                        .shadow(radius: 25)
                    Text("Sign Up").font(.largeTitle).bold().foregroundColor(.white)
//                    HStack {
//                        Text("Sign Up").font(.largeTitle).bold().foregroundColor(.white)
//                        ZStack {
//                            Image(systemName: "arrow.right.circle").font(.largeTitle).foregroundColor(.white)
//                        }
//
//                    }
                    
                }
                
                Text("Spacer").font(.headline).foregroundColor(.clear)
               
                ZStack {
                    
                    Capsule(style: .continuous)
                        .stroke(Color.white, lineWidth: 8)
                        .foregroundColor(.black)
                        .frame(width: width * 0.8, height: width * 0.15, alignment: .center)
                    .shadow(radius: 25)
                    Text("Log In").font(.largeTitle).bold().foregroundColor(.white)
//                    HStack {
//                        Text("Log In").font(.largeTitle).bold().foregroundColor(.white)
//                        ZStack {
//                            Image(systemName: "arrow.right.circle").font(.largeTitle).foregroundColor(.white)
//                        }
//
//                    }
                    
                }
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.nicePink, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(width: 300, height: 150, alignment: .center)
                
                
            }
        }
        
    }
}


struct SignUpButtons_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButtons()
    }
}
