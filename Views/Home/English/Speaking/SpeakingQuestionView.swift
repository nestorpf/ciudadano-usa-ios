import SwiftUI

struct ConversationPromptView: View {
    let prompt: ConversationPrompt
    @State private var showSpanish = false
    let speechSynth = SpeechSynthesizer.shared
    
    var body: some View {
        ZStack {
            // Patriotic Gradient Background
                    LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.75, green: 0.88, blue: 1.0),
                Color.white,
                Color(red: 1.0, green: 0.75, blue: 0.75)
            ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 28) {
                // Question
                VStack(alignment: .leading, spacing: 10) {
                    Text(showSpanish ? prompt.translatedQuestion : prompt.question)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    HStack {
                        Spacer()
                        Button(action: {
                            speechSynth.speakQuestion(text: showSpanish ? prompt.translatedQuestion : prompt.question, language: showSpanish ? "es-ES" : "en-US")
                        }) {
                            Label("Leer pregunta", systemImage: "speaker.wave.2.fill")
                                .labelStyle(TitleAndIconLabelStyle())
                                .foregroundColor(.blue)
                        }
                        .accessibilityLabel("Leer pregunta en voz alta")
                        Spacer()
                    }
                }
                
                // Possible answers
                let answers = showSpanish ? prompt.translatedAnswers : prompt.answers
                if !answers.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Respuestas de ejemplo")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        ForEach(answers, id: \.self) { answer in
                            HStack {
                                Text("• " + answer)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Button(action: {
                                    speechSynth.speakAnswer(text: answer, language: showSpanish ? "es-ES" : "en-US")
                                }) {
                                    Image(systemName: "speaker.wave.2.fill")
                                        .foregroundColor(.green)
                                }
                                .accessibilityLabel(showSpanish ? "Leer esta respuesta en voz alta" : "Read this answer aloud")
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                
                // Disclaimer
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title3)
                        Text("Nota importante")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    
                    Text("La respuesta dependerá de ti y tu vida. Usa estos ejemplos como guía, pero adapta la respuesta a tu situación personal.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.95))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 6) {
                    Image(systemName: "globe")
                        .foregroundColor(.blue)
                        .imageScale(.medium)
                    Button(action: { showSpanish.toggle() }) {
                        Text(showSpanish ? "ES" : "EN")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(.systemGray6))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct TitleAndIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            configuration.icon
            configuration.title
        }
    }
} 