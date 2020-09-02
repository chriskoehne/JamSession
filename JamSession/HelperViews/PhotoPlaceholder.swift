//
//  PhotoPlaceholder.swift
//  JamSession
//
//  Created by Chris Koehne on 7/24/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct PhotoPlaceholder: View {
    
    let width = screenWidth * 1/4
    
    var body: some View {
        return ZStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [8], dashPhase: 6))
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(ColorManager.lightGray)
            }.frame(width: width, height: width * 3/2, alignment: .center)
            
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.jamSessionDefault, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                
                Image(systemName: "plus.circle")
                    .foregroundColor(.white)
                
            }
            .font(.system(size: width * 2/5))
            .frame(width: width * 2/5, height: width * 2/5)
            .padding(.leading, width * 0.75)
            .padding(.top, width * 1/0.75)
            
            //to check that it's centered
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .frame(width: 1, height: 10000, alignment: .center)
        }
    }
}

struct PhotoPlaceholders: View {
    
    var body: some View {
        VStack {
            HStack {
                PhotoPlaceholder()
                PhotoPlaceholder()
                PhotoPlaceholder()
            }
            HStack {
                PhotoPlaceholder()
                PhotoPlaceholder()
                PhotoPlaceholder()
            }
        }
    }
}


struct PhotoPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPlaceholders()
    }
}
