import Combine
import SwiftUI

enum Language: Int, CaseIterable, Identifiable {
    case english = 0
    case polish

    var id: Language {
        self
    }

    var literal: String {
        switch self {
        case .english: return "English"
        case .polish: return "Polish"
        }
    }
}

class PreferedLanguages: ObservableObject {
    @Published var languages = [Language]()

}
