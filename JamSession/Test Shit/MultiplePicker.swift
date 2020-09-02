import Combine
import SwiftUI

struct MultiplePicker: View {
    @State private var showLanguageSheet = false

    @State private var x = 0

    @ObservedObject var preferedLanguages = PreferedLanguages()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Language").font(.caption)) {
                        Button(action: {
                            self.showLanguageSheet.toggle()
                        }) {
                            HStack {
                                Text("Choose languages").foregroundColor(Color.black)
                                Spacer()
                                Text("\(preferedLanguages.languages.count)")
                                    .foregroundColor(Color(UIColor.systemGray))
                                    .font(.body)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(UIColor.systemGray4))
                                    .font(Font.body.weight(.medium))

                            }
                        }
                        .sheet(isPresented: $showLanguageSheet) {
                            SettingsLanguagePickerView(self.preferedLanguages)
                        }

                        Picker(selection: $x, label: Text("One item Picker")) {
                           ForEach(0..<10) { x in
                              Text("\(x)")
                           }
                        }

                        NavigationLink(destination: self) {
                            Text("Default navigation link")
                        }
                    }
                }
            }
            .navigationBarTitle("Content")
        }
    }
}


struct SettingsLanguagePickerView: View {
    @State private var selections = [Language]()
    
    @ObservedObject var preferedLanguages: PreferedLanguages
    
    init(_ preferedLanguages: PreferedLanguages) {
        self.preferedLanguages = preferedLanguages
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Choose prefered languages")) {
                    ForEach(Language.allCases) { item in
                        MultipleSelectionRow(title: item.literal, isSelected: self.selections.contains(item)) {
                            if self.selections.contains(item) {
                                self.selections.removeAll(where: { $0 == item })
                            }
                            else {
                                self.selections.append(item)
                            }
                        }
                    }
                    
                }
            }
            .onAppear(perform: { self.selections = self.preferedLanguages.languages })
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Languages", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.preferedLanguages.languages = self.selections
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("OK")
                }
            )
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark").foregroundColor(.blue)
                }
            }
        }.foregroundColor(Color.black)
    }
}


struct MultiplePicker_Previews: PreviewProvider {
    static var previews: some View {
        MultiplePicker()
    }
}
