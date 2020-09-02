//
//  PhotoPlaceholderTest.swift
//  JamSession
//
//  Created by Chris Koehne on 8/12/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct PhotoPlaceholderTest: View {
    
    let length = screenWidth * 0.3
    let buttonSize = screenWidth * 1/4
    
    var body: some View {
        return ZStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [8], dashPhase: 6))
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(ColorManager.lightGray)
            }.frame(width: length, height: length, alignment: .center)
            
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.jamSessionDefault, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                
                Image(systemName: "plus.circle")
                    .foregroundColor(.white)
                
            }
            .font(.system(size: buttonSize * 2/5))
            .frame(width: buttonSize * 2/5, height: buttonSize * 2/5)
            .padding(.leading, length * 0.75)
            .padding(.top, length * 1/0.75)
            
            //to check that it's centered
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .frame(width: 1, height: 10000, alignment: .center)
        }
    }
}

struct PhotoPlaceholdersTest: View {
    
    var body: some View {
        VStack {
            HStack {
                PhotoPlaceholderTest()
                PhotoPlaceholderTest()
                PhotoPlaceholderTest()
            }
            HStack {
                PhotoPlaceholderTest()
                PhotoPlaceholderTest()
                PhotoPlaceholderTest()
            }
        }
    }
}


struct PhotoPlaceholderTest_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPlaceholdersTest()
    }
}
