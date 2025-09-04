//
//  CivicsQuestionView.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/26/25.
//

import SwiftUI
import AVFoundation

struct CivicsQuestionView: View {
    let question: CivicsQuestion
    @State private var showAllAnswers = false
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
                    Text(showSpanish ? question.translatedQuestion : question.question)
                .font(.title2)
                .fontWeight(.bold)
                        .padding(.top, 20)
                    HStack {
                        Spacer()
                        Button(action: {
                            speechSynth.speakQuestion(text: showSpanish ? question.translatedQuestion : question.question, language: showSpanish ? "es-ES" : "en-US")
                        }) {
                            Label("Leer pregunta", systemImage: "speaker.wave.2.fill")
                                .labelStyle(TitleAndIconLabelStyle())
                                .foregroundColor(.blue)
                        }
                        .accessibilityLabel("Leer pregunta en voz alta")
                        Spacer()
                    }
                }
                
                // Default answers
                VStack(alignment: .leading, spacing: 10) {
                    Text(showSpanish ? "Respuesta(s)" : "Answer(s)")
                        .font(.headline)
                        .foregroundColor(.primary)
                if question.requiredAnswers == 1 {
                        if let first = (showSpanish ? question.translatedAnswers.first : question.answers.first) {
                        Text("• " + first)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                } else {
                        ForEach(Array((showSpanish ? question.translatedAnswers : question.answers).prefix(question.requiredAnswers)), id: \ .self) { answer in
                        Text("• " + answer)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                    HStack {
                        Spacer()
                        Button(action: {
                            let answers = showSpanish ? question.translatedAnswers.prefix(question.requiredAnswers) : question.answers.prefix(question.requiredAnswers)
                            speechSynth.speakAnswer(text: answers.joined(separator: ", "), language: showSpanish ? "es-ES" : "en-US")
                        }) {
                            Label("Leer respuesta(s)", systemImage: "speaker.wave.2.fill")
                                .labelStyle(TitleAndIconLabelStyle())
                                .foregroundColor(.green)
                        }
                        .accessibilityLabel("Leer respuesta en voz alta")
                        Spacer()
                    }
                }
            // Only show toggle if there are more possible answers than required
                if (question.answers.count > question.requiredAnswers) {
                Button(action: { showAllAnswers.toggle() }) {
                    Text(showAllAnswers ? "Ocultar todas las respuestas posibles" : "Mostrar todas las respuestas posibles")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                if showAllAnswers {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(showSpanish ? "Todas las respuestas posibles" : "All possible answers")
                                .font(.headline)
                                .foregroundColor(.primary)
                            ForEach(showSpanish ? question.translatedAnswers : question.answers, id: \ .self) { answer in
                            Text("• " + answer)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        Text("(Debe dar \(question.requiredAnswers) respuesta\(question.requiredAnswers == 1 ? "" : "s"))")
                            .font(.caption)
                            .foregroundColor(.orange)
                            HStack {
                                Spacer()
                                Button(action: {
                                    let allAnswers = showSpanish ? question.translatedAnswers : question.answers
                                    speechSynth.speakAnswer(text: allAnswers.joined(separator: ", "), language: showSpanish ? "es-ES" : "en-US")
                                }) {
                                    Label("Leer todas las respuestas", systemImage: "speaker.wave.2.fill")
                                        .labelStyle(TitleAndIconLabelStyle())
                                        .foregroundColor(.orange)
                                }
                                .accessibilityLabel("Leer todas las respuestas en voz alta")
                                Spacer()
                            }
                        }
                }
            }
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
