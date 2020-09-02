//
//  InstrumentPicker.swift
//  JamSession
//
//  Created by Chris Koehne on 7/17/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

//import SwiftUI
//
//struct InstrumentPicker: View {
//    @State var user: User
//    @State var editMode: EditMode = .active
//    @State var scale: CGFloat = 1
//
//
//    let maxInstuments = 3
//    
//    let minInstrument = 1
//    let screenWidth = UIScreen.main.bounds.size.width
//    var rowHeight: CGFloat = 50
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(user.instrumentInfos, id: \.self) { instrument in
//                        VStack {
//
//                            Text("hi")
//
//                        }
//
//                    }
//                    .onDelete(perform: onDelete)
//                    .onMove(perform: onMove)
//
//                }
//                .navigationBarTitle("Select Instrument(s)", displayMode: .inline)
//                .environment(\.editMode, $editMode)
//                .listStyle(GroupedListStyle())
//                .frame(width: screenWidth, height: listHeight(numRows: user.instrumentInfos.count))
//                //                .environment(\.defaultMinListRowHeight, rowHeight)
//                //                .frame(height: user.instrumentInfos.reduce(0) { i, _ in i + rowHeight })
//                //                Image(systemName: "plus.circle.fill").foregroundColor(.green)
//
//                List {
//                    ForEach(updateInstruments(userInstrument: user.instrumentInfos), id: \.self) { instrument in
//                        HStack {
//                            if self.user.instrumentInfos.count < 3 {
//                                Button(action: {
//                                    self.user.instrumentInfos.append(InstrumentInfo(instrument: instrument, proficiency: 2.0))
//                                    if self.user.instrumentInfos.count > 1 {
//                                        self.editMode = .active
//                                    }
//
//                                }) {
//                                    Image(systemName: "plus.circle.fill").resizable().frame(width: 23, height: 23)
//                                        .foregroundColor(.green)
//                                }
//                                Text("  \(instrument.rawValue)")
//                            } else {
//                                Image(systemName: "plus.circle.fill").resizable().frame(width: 23, height: 23)
//                                .foregroundColor(.gray)
//                                Text("  \(instrument.rawValue)").foregroundColor(.gray)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    private func onDelete(offsets: IndexSet) {
//        if user.instrumentInfos.count > 1 {
//            user.instrumentInfos.remove(atOffsets: offsets)
//        }
//        if user.instrumentInfos.count == 1 {
//            editMode = .inactive
//        }
//    }
//    private func onMove(source: IndexSet, destination: Int) {
//        user.instrumentInfos.move(fromOffsets: source, toOffset: destination)
//    }
//
//    private func listHeight(numRows: Int) -> CGFloat {
//        return CGFloat(numRows * 75)
//    }
//
//}
//
//struct InstrumentPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        InstrumentPicker(user: User(username: "ckoehne", name: "Chris Koehne", instrumentInfos: [InstrumentInfo(instrument: Instrument.guitar, proficiency: 2.0), InstrumentInfo(instrument: Instrument.bass, proficiency: 1.0), InstrumentInfo(instrument: Instrument.drums, proficiency: 0.0)], genres: [Genre.alt], bio: "hi"))
//    }
//}
