//
//  WritingView.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import SwiftUI

struct WritingView: View {
    var questions: [WritingQuestion] = WritingQuestionsData.questions
    
    var body: some View {
        ZStack {
            // Patriotic Gradient Background (same as HomeView)
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.75, green: 0.88, blue: 1.0), // Light blue
                    Color.white,
                    Color(red: 1.0, green: 0.75, blue: 0.75)   // Soft red
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    // Description aligned to leading edge
                    Text("Debe escribir correctamente 1 de 3 oraciones en inglés dictadas por el oficial. Las siguientes son oraciones de práctica")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(questions.indices, id: \.self) { idx in
                        NavigationLink(destination: WritingQuestionView(question: questions[idx], questionNumber: idx + 1)) {
                            HStack {
                                Text("\(idx + 1).")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                Text("Oración \(idx + 1)")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .background(Color(.systemBackground).opacity(0.95))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.blue.opacity(0.25), lineWidth: 2)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .shadow(color: .blue.opacity(0.08), radius: 3, x: 0, y: 2)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Escritura")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        WritingView()
    }
} 
