//
//  CivicsView.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import SwiftUI
import Foundation

struct CivicsView: View {
    @State private var showMockTestSetup = false
    
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
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 16) {
                        // Description aligned to leading edge
                        Text("Debe responder correctamente 6 de 10 preguntas orales del banco oficial de 100 preguntas")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(PersonalizedCivicsService.getPersonalizedQuestions().indices, id: \.self) { idx in
                            NavigationLink(destination: CivicsQuestionView(question: PersonalizedCivicsService.getPersonalizedQuestions()[idx])) {
                                HStack {
                                    Text("\(idx + 1).")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                    Text(PersonalizedCivicsService.getPersonalizedQuestions()[idx].question)
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
                                        .stroke(Color.red.opacity(0.25), lineWidth: 2)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .shadow(color: .red.opacity(0.08), radius: 3, x: 0, y: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
                
                // Softer Practice Exam Button at the bottom
                VStack {
                    Button(action: { showMockTestSetup = true }) {
                        HStack(spacing: 10) {
                            Image(systemName: "list.bullet.rectangle")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Tomar un Examen de Práctica")
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
                    .padding([.horizontal, .bottom])
                    .sheet(isPresented: $showMockTestSetup) {
                        MockTestSetupView()
                    }
                }
            }
        }
        .navigationTitle("Preguntas de Cívica")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        CivicsView()
    }
} 
