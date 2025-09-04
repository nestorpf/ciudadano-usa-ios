import Foundation
import AVFoundation

class SpeechSynthesizer {
    static let shared = SpeechSynthesizer()
    private let synthesizer = AVSpeechSynthesizer()
    
    private init() {}
    
    private func speak(text: String, language: String = "en-US", rate: Float = 0.4, pitch: Float = 1.2, volume: Float = 0.8) {
        let utterance = AVSpeechUtterance(string: text)
        
        if language == "en-US" {
            let voices = AVSpeechSynthesisVoice.speechVoices()
            if let femaleVoice = voices.first(where: {
                $0.language.starts(with: "en-US") &&
                $0.gender == .female
            }) {
                utterance.voice = femaleVoice
            } else {
                // Fallback to default English voice
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            }
        } else if language == "es-ES" {
            // Try to get a female Spanish voice
            let voices = AVSpeechSynthesisVoice.speechVoices()
            if let femaleVoice = voices.first(where: {
                $0.language.starts(with: "es-ES") &&
                $0.gender == .female
            }) {
                utterance.voice = femaleVoice
            } else {
                // Fallback to default Spanish voice
                utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")
            }
        } else {
            utterance.voice = AVSpeechSynthesisVoice(language: language)
        }
        
        // Make speech more friendly and woman-like
        utterance.rate = rate // Slower rate for better comprehension
        utterance.pitchMultiplier = pitch // Higher pitch for more feminine, friendly tone
        utterance.volume = volume // Balanced volume
        
        synthesizer.speak(utterance)
    }
    
    func speakQuestion(text: String, language: String = "en-US") {
        // Slower and more gentle for questions
        speak(text: text, language: language, rate: 0.35, pitch: 1.25, volume: 0.75)
    }
    
    func speakAnswer(text: String, language: String = "en-US") {
        // Friendly but slightly faster for answers
        speak(text: text, language: language, rate: 0.4, pitch: 1.2, volume: 0.8)
    }
    
    func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
