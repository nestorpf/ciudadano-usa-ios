import Foundation

struct SpeechSettings: Codable {
    var rate: Float = 0.5 // Default speech rate
    var pitch: Float = 1.0 // Default pitch multiplier
    var language: String = "en-US" // Default language
    // Add more settings as needed
    
    static var `default`: SpeechSettings {
        SpeechSettings()
    }
} 