//
//  ProfileForm.swift
//  JamSession
//
//  Created by Chris Koehne on 7/18/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI


struct ProfileForm: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userStatus: UserStatus
    @State private var showActionSheet = false
    let buttonSize = screenWidth * 0.15
    
    
    var body: some View {
        //                UITableView.appearance().backgroundColor = .clear
        //        UISegmentedControl.appearance().setTitleTextAttributes(
        //            [
        //                .font: UIFont.boldSystemFont(ofSize: 16),
        //                .foregroundColor: UIColor.black
        //        ], for: .normal)
        return NavigationView {
            ZStack {
                //                RadialGradient(gradient: Gradient(colors: [ColorManager.nicePink, ColorManager.jamSessionDefault]), center: .topLeading, startRadius: 1, endRadius: 1200)
                //                //                    .edgesIgnoringSafeArea(.all)
                Form {
                    
                    Section(header: ShowImage()) {
                        EmptyView()
                        
                    }.padding(.top, screenWidth * 1/50)
                    
                    Section() {
                        HStack{
                            Text("Name")
                                .foregroundColor(.gray)
                            Spacer()
                            Text(user.firstName + " " + user.lastName)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Email")
                                .foregroundColor(.gray)
                            Spacer()
                            Text(user.email)
                                .foregroundColor(.gray)
                            
                        }
                    }
                    Section(header: Text("INSTRUMENT(s)"), footer:
                        HStack(alignment: .center) {
                            Spacer()
                            Button(action: {
                                if self.user.info2.instrument == Instrument.none {
                                    if self.user.info1.instrument == Instrument.none {
                                        self.user.info1 = InstrumentInfo(instrument: self.user.defaultInstrument(), proficiency: 2.0)
                                    } else {
                                        self.user.info2 = InstrumentInfo(instrument: self.user.defaultInstrument(), proficiency: 2.0)
                                    }
                                }
                                
                            }) {
                                //                            Text("Add Instrument (\(3 - user.getNumInstruments()) Remaining)")
                                //                                .frame(maxWidth: .infinity, alignment: .center)
                                if (user.info2.instrument == Instrument.none) {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "plus.circle.fill").font(.system(size: buttonSize)).frame(width: buttonSize, height: buttonSize).foregroundColor(ColorManager.jamSessionDefault)
                                    }
                                } else {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "plus.circle.fill").font(.system(size: buttonSize)).frame(width: buttonSize, height: buttonSize).foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            
                            Button(action: {
                                if self.user.info1.instrument != Instrument.none {
                                    if self.user.info2.instrument != Instrument.none {
                                        self.user.info2 = InstrumentInfo(instrument: Instrument.none, proficiency: 2.0)
                                    } else {
                                        self.user.info1 = InstrumentInfo(instrument: Instrument.none, proficiency: 2.0)
                                    }
                                }
                                
                            }) {
                                //                            Text("Remove Instrument")
                                //                                .frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.red)
                                if (user.info1.instrument != Instrument.none) {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "minus.circle.fill").font(.system(size: buttonSize)).frame(width: buttonSize, height: buttonSize).foregroundColor(ColorManager.nicePink)
                                    }
                                } else {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "minus.circle.fill").font(.system(size: buttonSize)).frame(width: buttonSize, height: buttonSize).foregroundColor(.gray)
                                    }
                                }
                                
                            }
                            Spacer()
                        }
                    ) {
                        InstrumentPicker(user: user)
                        
                        
                    }
                    Section(header: Text("GENRE(s)"), footer:
                        HStack(alignment: .center) {
                            Spacer()
                            Button(action: {
                                if self.user.genre2 == Genre.none {
                                    if self.user.genre1 == Genre.none {
                                        self.user.genre1 = self.user.defaultGenre()
                                    } else {
                                        self.user.genre2 = self.user.defaultGenre()
                                    }
                                }
                                
                            }) {
                                
                                if (user.genre2 == Genre.none) {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "plus.circle.fill").font(.system(size: 60)).frame(width: 60, height: 60).foregroundColor(ColorManager.jamSessionDefault)
                                    }
                                } else {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "plus.circle.fill").font(.system(size: 60)).frame(width: 60, height: 60).foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            
                            Button(action: {
                                if self.user.genre1 != Genre.none {
                                    if self.user.genre2 != Genre.none {
                                        self.user.genre2 = Genre.none
                                    } else {
                                        self.user.genre1 = Genre.none
                                    }
                                }
                                
                            }) {
                                
                                if (user.genre1 != Genre.none) {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "minus.circle.fill").font(.system(size: 60)).frame(width: 60, height: 60).foregroundColor(ColorManager.nicePink)
                                    }
                                } else {
                                    ZStack {
                                        Image(systemName: "circle.fill").font(.system(size: buttonSize)).foregroundColor(.white)
                                        Image(systemName: "minus.circle.fill").font(.system(size: 60)).frame(width: 60, height: 60).foregroundColor(.gray)
                                    }
                                }
                                
                            }
                            Spacer()
                        }
                    ) {
                        GenrePicker(user: user)
                        
                    }
                    
                    
                    Button(action: {
                        self.showActionSheet = true
                    }) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Logout").foregroundColor(ColorManager.lessCoolCoral)
                            Spacer()
                        }
                    }
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(title: Text("Are you sure?"), message: Text("I'll miss you"), buttons: [.destructive(Text("Logout")) {
                            self.userStatus.loggedIn = false
                            }, .cancel()])
                        
                    }
                
                
                
                
                Section() {
                    EmptyView()
                }
                Section(header: Text("Bios coming in iOS 14 I don't wanna learn UIKit rn")) {
                    EmptyView()
                }
            }
            
        }
        .navigationBarTitle("Edit Profile", displayMode: .inline)
        .buttonStyle(BorderlessButtonStyle())
        //            .background(ColorManager.jamSessionDefault)
    } //bracket for zstack
}
}


struct ProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        ProfileForm()
            .environmentObject(User(
                info0: InstrumentInfo(instrument: Instrument.guitarLead,proficiency: 2.0),
                info1: InstrumentInfo(instrument: Instrument.drums, proficiency: 2.0),
                info2: InstrumentInfo(instrument: Instrument.none, proficiency: 2.0),
                genre0: Genre.alt,genre1: Genre.none, genre2: Genre.none))
            .environmentObject(UserStatus())
    }
}

