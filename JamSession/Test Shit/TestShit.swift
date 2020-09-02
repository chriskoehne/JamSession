//
//  TestShit.swift
//  JamSession
//
//  Created by Chris Koehne on 8/7/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct TestShit: View {
    @State private var showActionSheet = false
    @State var count: Int = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.showActionSheet = true
            }) {
                Text("Show Sheet")
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Are you sure?"), message: Text("I'll miss you"), buttons: [.destructive(Text("Logout")) {
                        //
                    }, .cancel()])
                
            }
            
            Text("\(count)")
            
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [ColorManager.brightCoral, ColorManager.noPurple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                Image(systemName: "xmark.circle")
                .foregroundColor(.white)
            }
            .font(.system(size: screenWidth * 2/5))
            .frame(width: screenWidth * 2/5, height: screenWidth * 2/5)
        }
    }
}

struct TestShit_Previews: PreviewProvider {
    static var previews: some View {
        TestShit()
    }
}
