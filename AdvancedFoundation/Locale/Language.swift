/// Human languages
///
/// - author: Adamas
/// - version: 1.10.0
/// - date: 11/08/2023
/// - Warning: Since iOS 16, a `Language` struct is introduced in `Locale`
public enum Language: String, CaseIterable {

    case mandarin = "zh"
    case english = "en"

    /// Default region of the language
    var defaultRegion: Region {
        switch self {
        case .mandarin:
            return .china
        case .english:
            return .america
        }
    }
}
