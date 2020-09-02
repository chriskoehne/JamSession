//
//  DemoList.swift
//  JamSession
//
//  Created by Chris Koehne on 7/16/20.
//  Copyright © 2020 Chris Koehne. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct DemoList: View {
    // 1.
    @State private var items: [Item] = (0..<5).map { Item(title: "Item #\($0)") }
    @State private var editMode = EditMode.inactive

    // 2.
    var body: some View {
        // 2.
        NavigationView {
            List {
                Section {
                    ForEach(items) { item in
                        Text(item.title)
                    }
                    .onDelete(perform: onDelete)
                    .onMove(perform: onMove)
                }
                
            }
            .navigationBarTitle("List")
            // 3.
                .navigationBarItems(leading: EditButton(), trailing: addButton)
            // 4.
            .environment(\.editMode, $editMode)
        }
    }
    
    
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
        default:
            return AnyView(EmptyView())
        }
    }
    
    func onAdd() {
        // To be implemented in the next section
    }
    
    private func onDelete(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    private func onMove(source: IndexSet, destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}




struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}
