//
//  ShowImageTest.swift
//  JamSession
//
//  Created by Chris Koehne on 8/3/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct ShowImageTest: View {
    @ObservedObject var user: User
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
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
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.noPurple, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
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
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.noPurple, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
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
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.noPurple, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
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
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.noPurple, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
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
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.noPurple, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
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
                                .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.noPurple, ColorManager.nicePink]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
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
                        self.deleteImage(5)
                    }
                }
            }
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
        user.pfPics.remove(at: pos)
        user.pfPics.append(nil)
//        dump(user.pfPics)
    }
}

struct ShowImageTest_Previews: PreviewProvider {
    static var previews: some View {
        ShowImageTest(user: User())
    }
}
