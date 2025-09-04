import SwiftUI

struct ReadingQuestionView: View {
    let question: ReadingQuestion
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
                // Text to read
                VStack(alignment: .leading, spacing: 10) {
                    Text(showSpanish ? question.translatedText : question.text)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 20)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            speechSynth.speakAnswer(text: showSpanish ? question.translatedText : question.text, language: showSpanish ? "es-ES" : "en-US")
                        }) {
                            Label("Leer texto", systemImage: "speaker.wave.2.fill")
                                .labelStyle(TitleAndIconLabelStyle())
                                .foregroundColor(.green)
                        }
                        .accessibilityLabel("Leer texto en voz alta")
                        Spacer()
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
                    
                    Text("Practica leyendo el texto de arriba en voz alta. Usa el botón de audio para verificar tu pronunciación.")
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
