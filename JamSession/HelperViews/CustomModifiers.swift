//
//  CustomModifiers.swift
//  JamSession
//
//  Created by Chris Koehne on 7/30/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct CustomModifiers: View {
    @State var textHere = "Which color do you like best?"
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [ ColorManager.jamSessionDarker, ColorManager.nicePink]), center: .topLeading, startRadius: 0, endRadius: 1800)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
//                TextField("test field", text: $textHere).textFieldStyle(CapsuleStyle())
                
                TextField("test field", text: $textHere).textFieldStyle(PasswordShownUnderlineStyle())
                
                SecureField("test field", text: $textHere).textFieldStyle(PasswordShownUnderlineStyle())
                 SecureField("test field", text: $textHere).textFieldStyle(PasswordHiddenUnderlineStyle())
            }
        }
        
        
    }
}

public struct CapsuleStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            
            .padding()
            .background(
                ZStack {
                    Capsule(style: .continuous)
                        .foregroundColor(.white)
                    Capsule(style: .continuous)
                        .stroke(ColorManager.white, lineWidth: 4)
                }
                //                .shadow(color: .gray, radius: 8, x: 8, y: 8)
        )
            .frame(width: screenWidth * 0.8, height: screenWidth * 0.15, alignment: .center)
    }
    
}

public struct UnderlineStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            configuration
                .foregroundColor(ColorManager.white)
                .font(.title)
            
            LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .leading, endPoint: .trailing).frame(height: 5.0, alignment: .bottom)
            
        }
        .frame(width: screenWidth * 0.8, height: screenWidth * 0.15, alignment: .center)
    }
}

public struct PasswordShownUnderlineStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            HStack {
                
                configuration
                    .foregroundColor(ColorManager.white)
                    .font(.title)
                Image(systemName: "eye.slash.fill").foregroundColor(ColorManager.noPurple)
            }
            
            LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .leading, endPoint: .trailing).frame(height: 5.0, alignment: .bottom)
            
        }
        .frame(width: screenWidth * 0.8, height: screenWidth * 0.15, alignment: .center)
    }
}

public struct PasswordHiddenUnderlineStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            HStack {
                
                configuration
                    .foregroundColor(ColorManager.white)
                    .font(.title)
                Image(systemName: "eye.fill").foregroundColor(ColorManager.noPurple)
            }
            
            LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .leading, endPoint: .trailing).frame(height: 5.0, alignment: .bottom)
            
        }
        .frame(width: screenWidth * 0.8, height: screenWidth * 0.15, alignment: .center)
    }
}



struct CustomModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiers()
    }
}
