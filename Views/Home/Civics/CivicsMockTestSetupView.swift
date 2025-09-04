//
//  MockTestSetupView.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/26/25.
//

import SwiftUI

struct MockTestSetupView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var numQuestions: Double = 10
    @State private var startExam: Int? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("¿Cuántas preguntas quieres en tu examen de práctica?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.top, 32)
                
                Text("\(Int(numQuestions)) preguntas")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 32)
                
                Slider(value: $numQuestions, in: 5...100, step: 5)
                    .accentColor(.blue)
                    .padding(.horizontal, 32)
                
                Button(action: {
                    startExam = Int(numQuestions)
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "list.bullet.rectangle")
                            .font(.title2)
                            .foregroundColor(.white)
                    Text("Comenzar Examen de Práctica")
                        .font(.headline)
                            .fontWeight(.semibold)
                        .foregroundColor(.white)
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                    .background(Color(red: 0.7, green: 0.85, blue: 1.0))
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .shadow(color: Color.blue.opacity(0.08), radius: 2, x: 0, y: 1)
                }
                .padding(.horizontal, 32)
                Spacer()
            }
            .navigationTitle("Examen de Práctica")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(item: $startExam) { num in
                CivicsExamView(numQuestions: num)
            }
        }
    }
}
