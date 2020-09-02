//
//  ShowImage.swift
//  JamSession
//
//  Created by Chris Koehne on 7/23/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

// I know this is horrible and repetitive but spending 2 days with a ForEach again scares me rn

import SwiftUI

struct ShowImage: View {
    @EnvironmentObject var user: User
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var lastRemoved: Int = -1
    
    let width = screenWidth * 1/4
    
    var body: some View {
        
        VStack {
            HStack {
                //pic0
                if (user.pfPics[0] == nil) {
                    PhotoPlaceholder().onTapGesture {
                        self.showingImagePicker = true
                    }
                } else {
                    ZStack {
                        user.pfPics[0]?
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: width, height: width * 3/2, alignment: .center)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        
                        ZStack {
                            if user.pfPics[1] != nil {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            } else {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.lightGray, ColorManager.profileBox]), startPoint: .bottomLeading, endPoint: .topTrailing)).opacity(0.9)
                            }
                            
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.white)
                            
                        }
                        .font(.system(size: width * 2/5))
                        .frame(width: width * 2/5, height: width * 2/5)
                        .padding(.leading, width * 0.75)
                        .padding(.top, width * 1/0.75)
                        
                    }
                    .onTapGesture {
                        //                        self.user.pfPics[0] = nil
                        self.lastRemoved = 0
                        self.deleteImage(0)
                    }
                    
                }
                //pic1
                if (user.pfPics[1] == nil) {
                    PhotoPlaceholder().onTapGesture {
                        self.showingImagePicker = true
                    }
                } else {
                    ZStack {
                        user.pfPics[1]?
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: width, height: width * 3/2, alignment: .center)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.white)
                            
                        }
                        .font(.system(size: width * 2/5))
                        .frame(width: width * 2/5, height: width * 2/5)
                        .padding(.leading, width * 0.75)
                        .padding(.top, width * 1/0.75)
                    }
                    .onTapGesture {
                        //                        self.user.pfPics[1] = nil
                        self.lastRemoved = 1
                        self.deleteImage(1)
                    }
                    
                }
                //pic2
                if (user.pfPics[2] == nil) {
                    PhotoPlaceholder().onTapGesture {
                        self.showingImagePicker = true
                    }
                } else {
                    ZStack {
                        user.pfPics[2]?
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: width, height: width * 3/2, alignment: .center)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.white)
                            
                        }
                        .font(.system(size: width * 2/5))
                        .frame(width: width * 2/5, height: width * 2/5)
                        .padding(.leading, width * 0.75)
                        .padding(.top, width * 1/0.75)
                    }
                    .onTapGesture {
                        //                        self.user.pfPics[2] = nil
                        self.lastRemoved = 2
                        self.deleteImage(2)
                    }
                }
            }
            HStack {
                //pic3
                if (user.pfPics[3] == nil) {
                    PhotoPlaceholder().onTapGesture {
                        self.showingImagePicker = true
                    }
                } else {
                    ZStack {
                        user.pfPics[3]?
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: width, height: width * 3/2, alignment: .center)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.white)
                            
                        }
                        .font(.system(size: width * 2/5))
                        .frame(width: width * 2/5, height: width * 2/5)
                        .padding(.leading, width * 0.75)
                        .padding(.top, width * 1/0.75)
                    }
                    .onTapGesture {
                        //                        self.user.pfPics[3] = nil
                        self.lastRemoved = 3
                        self.deleteImage(3)
                    }
                }
                //pic4
                if (user.pfPics[4] == nil) {
                    PhotoPlaceholder().onTapGesture {
                        self.showingImagePicker = true
                    }
                } else {
                    ZStack {
                        user.pfPics[4]?
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: width, height: width * 3/2, alignment: .center)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.white)
                            
                        }
                        .font(.system(size: width * 2/5))
                        .frame(width: width * 2/5, height: width * 2/5)
                        .padding(.leading, width * 0.75)
                        .padding(.top, width * 1/0.75)
                    }
                    .onTapGesture {
                        //                        self.user.pfPics[4] = nil
                        self.lastRemoved = 4
                        self.deleteImage(4)
                    }
                }
                //pic5
                if (user.pfPics[5] == nil) {
                    PhotoPlaceholder().onTapGesture {
                        self.showingImagePicker = true
                    }
                } else {
                    ZStack {
                        user.pfPics[5]?
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: width, height: width * 3/2, alignment: .center)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.white)
                            
                        }
                        .font(.system(size: width * 2/5))
                        .frame(width: width * 2/5, height: width * 2/5)
                        .padding(.leading, width * 0.75)
                        .padding(.top, width * 1/0.75)
                    }
                    .onTapGesture {
                        //                        self.user.pfPics[5] = nil
                        self.lastRemoved = 5
                        self.deleteImage(5)
                    }
                }
            }
            Text("\(lastRemoved)")
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        for i in 0..<user.pfPics.count {
            if user.pfPics[i] == nil {
                user.pfPics[i] = Image(uiImage: inputImage)
                break
            }
        }
        self.inputImage = nil
    }
    
    func shiftImage() {
        for i in (1..<user.pfPics.count).reversed() {
            if user.pfPics[i] != nil && user.pfPics[i - 1] == nil {
                user.pfPics[i - 1] = user.pfPics[i]
                user.pfPics[i] = nil
            }
        }
    }
    
    func deleteImage(_ pos: Int) {
        //        user.pfPics[pos] = nil
        //        shiftImage()
        //        shiftImage()
        //        shiftImage()
        //        shiftImage()
        //        shiftImage()
        //        shiftImage()
        if !(pos == 0 && user.pfPics[1] == nil) {
            user.pfPics.remove(at: pos)
            user.pfPics.append(nil)
        }
        //        dump(user.pfPics)
    }
}

struct ShowImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowImage().environmentObject(User())
    }
}
