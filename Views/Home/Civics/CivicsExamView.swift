import SwiftUI
import AVFoundation

struct CivicsExamView: View {
    let numQuestions: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var questions: [CivicsQuestion] = []
    @State private var currentIndex: Int = 0
    @State private var selectedAnswer: String? = nil
    @State private var isCorrect: Bool? = nil
    @State private var showFeedback = false
    @State private var score = 0
    @State private var showSummary = false
    @State private var answered = false
    @State private var answerChoices: [String] = []
    @State private var requiredAnswers: Int = 1
    @State private var multiAnswerMode = false
    @State private var selectedMultiAnswers: Set<String> = []
    @State private var showCorrectAnswers = false
    @State private var startExam: Int? = nil
    let speechSynth = SpeechSynthesizer.shared
    
    var body: some View {
        ZStack {
            // Gradient background
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
            
            if showSummary {
                VStack(spacing: 24) {
                    Text("Resumen del Examen")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Respondiste correctamente \(score) de \(questions.count) preguntas.")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.seal")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Terminar")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color(red: 0.7, green: 0.85, blue: 1.0))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .shadow(color: Color.blue.opacity(0.08), radius: 2, x: 0, y: 1)
                    }
                    .padding(.horizontal)
                }
            } else if !questions.isEmpty && currentIndex < questions.count {
                let q = questions[currentIndex]
                VStack(spacing: 32) {
                    // Question card
                    VStack(spacing: 12) {
                        Text("Pregunta \(currentIndex + 1) de \(questions.count)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.top, 18)
                        Text(q.question)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .lineLimit(nil)
                            .padding(.bottom, 6)
                        HStack {
                            Spacer()
                            Button(action: {
                                speechSynth.speakQuestion(text: q.question, language: "en-US")
                            }) {
                                Label("Leer pregunta", systemImage: "speaker.wave.2.fill")
                                    .labelStyle(TitleAndIconLabelStyle())
                                    .foregroundColor(.blue)
                                    .font(.subheadline)
                            }
                            .accessibilityLabel("Leer pregunta en voz alta")
                            Spacer()
                        }
                        .padding(.bottom, 12)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemBackground).opacity(0.95))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(color: .black.opacity(0.07), radius: 3, x: 0, y: 2)
                    .padding(.horizontal)
                    
                    // Answer choices
                    VStack(spacing: 16) {
                        ForEach(answerChoices, id: \ .self) { choice in
                            HStack {
                                Button(action: {
                                    if !answered {
                                        handleAnswer(choice: choice)
                                    }
                                }) {
                                    Text(choice)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .disabled(answered)
                                Button(action: {
                                    speechSynth.speakAnswer(text: choice, language: "en-US")
                                }) {
                                    Label("Leer opción", systemImage: "speaker.wave.2.fill")
                                        .labelStyle(TitleAndIconLabelStyle())
                                        .foregroundColor(.green)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .accessibilityLabel("Leer opción en voz alta")
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(buttonColor(for: choice))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.blue.opacity(0.15), lineWidth: 1)
                            )
                            .shadow(color: .black.opacity(0.04), radius: 1, x: 0, y: 1)
                            .animation(.easeInOut(duration: 0.2), value: selectedAnswer)
                        }
                    }
                    .padding(.horizontal)
                    
                    if answered {
                        if isCorrect == true {
                            Text("¡Correcto!")
                                .font(.headline)
                                .foregroundColor(.green)
                                .transition(.opacity)
                        } else {
                            VStack(spacing: 4) {
                                Text("Incorrecto")
                                    .font(.headline)
                                    .foregroundColor(.red)
                                    .transition(.opacity)
                                Text("Respuesta correcta: \(correctAnswerText(q: q))")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                            }
                        }
                        Button("Siguiente") {
                            nextQuestion()
                        }
                        .font(.headline)
                        .padding(.top, 12)
                    }
                }
                .padding(.vertical)
            } else {
                ProgressView()
                    .onAppear {
                        setupExam()
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(for: Int.self) { num in
            CivicsExamView(numQuestions: num)
        }
    }
    
    func setupExam() {
        // Filter questions by requiredAnswers for multi-answer logic
        let allQs = PersonalizedCivicsService.getPersonalizedQuestions().shuffled()
        var selected: [CivicsQuestion] = []
        var usedIndices: Set<Int> = []
        var i = 0
        while selected.count < numQuestions && i < allQs.count {
            let q = allQs[i]
            if !usedIndices.contains(i) {
                selected.append(q)
                usedIndices.insert(i)
            }
            i += 1
        }
        questions = selected
        currentIndex = 0
        prepareChoices()
    }
    
    func prepareChoices() {
        guard !questions.isEmpty, currentIndex < questions.count else { return }
        let q = questions[currentIndex]
        requiredAnswers = q.requiredAnswers
        multiAnswerMode = requiredAnswers > 1
        // Pool logic: for 3 or 4 required, pool from all with 3 or 4; for 1 or 2, exact match
        let pool: [CivicsQuestion]
        if requiredAnswers == 3 || requiredAnswers == 4 {
            pool = CivicsQuestions.questions.filter { $0.requiredAnswers == 3 || $0.requiredAnswers == 4 }
        } else {
            pool = CivicsQuestions.questions.filter { $0.requiredAnswers == requiredAnswers }
        }
        var choices: [String] = []
        if requiredAnswers == 1 {
            // Single answer: use correct + 3 random wrong answers
            let correct = q.answers.first ?? ""
            choices.append(correct)
            let wrongs = pool.flatMap { $0.answers }.filter { $0 != correct }.shuffled().prefix(3)
            choices.append(contentsOf: wrongs)
        } else {
            // Multi-answer: use correct + 3 random wrong (comma separated)
            let correct = q.answers.prefix(requiredAnswers).joined(separator: ", ")
            choices.append(correct)
            let wrongs = pool.filter { $0.question != q.question }.shuffled().prefix(3).map { $0.answers.prefix(requiredAnswers).joined(separator: ", ") }
            choices.append(contentsOf: wrongs)
        }
        answerChoices = choices.shuffled()
        selectedAnswer = nil
        isCorrect = nil
        answered = false
        showCorrectAnswers = false
        selectedMultiAnswers = []
    }
    
    func handleAnswer(choice: String) {
        guard !answered else { return }
        let q = questions[currentIndex]
        let correct: String
        if requiredAnswers == 1 {
            correct = q.answers.first ?? ""
        } else {
            correct = q.answers.prefix(requiredAnswers).joined(separator: ", ")
        }
        selectedAnswer = choice
        answered = true
        if choice == correct {
            isCorrect = true
            score += 1
        } else {
            isCorrect = false
        }
        // Show feedback, then allow next
    }
    
    func nextQuestion() {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
            prepareChoices()
        } else {
            showSummary = true
        }
    }
    
    func buttonColor(for choice: String) -> Color {
        if !answered { return Color(.systemBackground).opacity(0.95) }
        if choice == selectedAnswer {
            return isCorrect == true ? Color.green.opacity(0.7) : Color.red.opacity(0.7)
        }
        if isCorrect == false {
            let q = questions[currentIndex]
            let correct: String
            if requiredAnswers == 1 {
                correct = q.answers.first ?? ""
            } else {
                correct = q.answers.prefix(requiredAnswers).joined(separator: ", ")
            }
            if choice == correct {
                return Color.green.opacity(0.5)
            }
        }
        return Color(.systemBackground).opacity(0.95)
    }
    
    func correctAnswerText(q: CivicsQuestion) -> String {
        if requiredAnswers == 1 {
            return q.answers.first ?? ""
        } else {
            return q.answers.prefix(requiredAnswers).joined(separator: ", ")
        }
    }
} 