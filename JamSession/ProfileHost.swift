//
//  ProfileHost.swift
//  JamSession
//
//  Created by Chris Koehne on 7/12/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @State var user: User
    
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ColorManager.nicePink, ColorManager.jamSessionDefault]), center: .topLeading, startRadius: 0, endRadius: 1300)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                Text("user.name")
                    .font(.system(size: 30))
                Text("@user.username")
                    //                    .font(.custom("TrebuchetMS", size: 20))
                    .italic()
                //            Spacer()
                //                .frame(height: 50)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width - 25, height: 50)
                    HStack {
                        Text("Instrument: ")
                            .font(.system(size: 20))
                            .bold()
                        Text("Guitar")
                            .font(.system(size: 20))
                        
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width - 25, height: 50)
                    HStack {
                        Text("Proficiency: ")
                            .font(.system(size: 20))
                            .bold()
                        
                        Text("Intermediate")
                            .font(.system(size: 20))
                        
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width - 25, height: 50)
                    HStack {
                        Text("Genre: ")
                            .font(.system(size: 20))
                            .bold()
                        Text("Alternative")
                            .font(.system(size: 20))
                        
                    }
                }
                
            }
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.white)
//                    .frame(width: UIScreen.main.bounds.width - 25, height: 105)
//                Text(x UIScreen.main.bounds.width - 25 UIScreen.main.bounds.width - 25 UIScreen.main.bounds.width - 25")
//                    .font(.system(size: 20))
//                    .frame(width: UIScreen.main.bounds.width - 50, height: 90, alignment: .topLeading)
//
//
//                //                    TextField("Say something snappy", text: $user.bio)
//                //                        .frame(width: UIScreen.main.bounds.width - 25, height: 90, alignment: .top)
//                //                        .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            }
            
            
            
            
            //                            Slider(value: $user.instrumentData.proficiency, in: 0...4, step: 1)
            //                                .accentColor(Color.init(red: 55 / 255, green: 250 / 255, blue: 195 / 255))
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 15.0)
            //                                    .stroke(lineWidth: 3.0)
            //                                    .foregroundColor(Color.init(red: 55 / 255, green: 250 / 255, blue: 195 / 255)))
            //                                .padding(.horizontal)
        }
    }
}


struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost(user: User())
    }
}
