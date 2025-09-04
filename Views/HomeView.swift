//
//  HomeView.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Patriotic Gradient Background
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
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 8) {
                            Text("Ciudadano")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("¡Prepárate para ser ciudadano estadounidense!")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 20)
                        
                        // Main Sections
                        VStack(spacing: 24) {
                            // Section 1: English
                            VStack(spacing: 16) {
                                // Section Header
                                HStack {
                                    Text("1")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Examen de Inglés")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.primary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                // English Subsections
                                VStack(spacing: 8) {
                                    NavigationLink(destination: SpeakingView()) {
                                        SubsectionCard(
                                            title: "Conversación",
                                            subtitle: "Preguntas y respuestas durante la entrevista",
                                            icon: "mic.fill",
                                            color: .purple,
                                            order: "1.1"
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    NavigationLink(destination: ReadingView()) {
                                        SubsectionCard(
                                            title: "Lectura",
                                            subtitle: "Leer oraciones en inglés en voz alta",
                                            icon: "book.fill",
                                            color: .green,
                                            order: "1.2"
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    NavigationLink(destination: WritingView()) {
                                        SubsectionCard(
                                            title: "Escritura",
                                            subtitle: "Escribir oraciones dictadas en inglés",
                                            icon: "pencil.and.outline",
                                            color: .orange,
                                            order: "1.3"
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            
                            // Section 2: Civics
                            VStack(spacing: 16) {
                                // Section Header
                                HStack {
                                    Text("2")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Examen Cívico")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.primary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                // Civics Section
                                NavigationLink(destination: CivicsView()) {
                                    SectionCard(
                                        title: "Historia y Gobierno de EE.UU.",
                                        subtitle: "Preguntas sobre civismo y gobierno estadounidense",
                                        icon: "building.columns.fill",
                                        color: .red
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 30)
                }
                
                // Settings Button - Floating in top right
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .foregroundColor(.primary)
                                .frame(width: 44, height: 44)
                                .background(Color(.systemBackground).opacity(0.9))
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Custom Section Card
struct SectionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground).opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

// Custom Subsection Card
struct SubsectionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let order: String
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(spacing: 4) {
                Text(order)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .background(color)
                    .clipShape(Circle())
                
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(color)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground).opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
    }
}

#Preview {
    HomeView()
}
