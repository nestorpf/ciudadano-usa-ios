import SwiftUI

struct WritingQuestionView: View {
    let question: WritingQuestion
    let questionNumber: Int
    @State private var showSpanish = false
    @State private var userAnswer = ""
    @State private var showAnswer = false
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
                // Listen button
                Button(action: {
                    speechSynth.speakAnswer(text: showSpanish ? question.translatedText : question.text, language: showSpanish ? "es-ES" : "en-US")
                }) {
                    HStack {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title2)
                        Text("Escuchar oración \(questionNumber) (\(showSpanish ? "Español" : "Inglés"))")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.blue)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                }
                .accessibilityLabel("Escuchar oración \(questionNumber) en voz alta")
                
                // Write section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Escribe lo que escuchaste")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    TextField("Escribe tu respuesta aquí...", text: $userAnswer, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .lineLimit(3...6)
                        .padding()
                        .background(Color(.systemBackground).opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                }
                
                // Reveal answer button
                Button(action: {
                    showAnswer.toggle()
                }) {
                    HStack {
                        Image(systemName: showAnswer ? "eye.slash.fill" : "eye.fill")
                            .font(.body)
                        Text(showAnswer ? "Ocultar respuesta" : "Revelar oración")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .orange.opacity(0.3), radius: 4, x: 0, y: 2)
                }
                
                // Correct answer (when revealed)
                if showAnswer {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Respuesta correcta")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(showSpanish ? question.translatedText : question.text)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(Color(.systemBackground).opacity(0.95))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
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
                    
                    Text("Escucha la oración, practica escribiendo en el cuadro de texto de arriba o en papel, y luego compara con la respuesta correcta.")
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
            // Floating language toggle in fixed top-right position, compact style
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

