//
//  OnboardingView.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    @State private var selectedState = ""
    @State private var representative = ""
    @State private var showHomeView = false
    
    var body: some View {
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
            
            VStack(spacing: 0) {
                // Progress indicator
                VStack(spacing: 16) {
                    HStack {
                        ForEach(0..<4, id: \.self) { step in
                            Circle()
                                .fill(step <= currentStep ? Color.blue : Color.gray.opacity(0.3))
                                .frame(width: 12, height: 12)
                                .scaleEffect(step == currentStep ? 1.2 : 1.0)
                                .animation(.easeInOut(duration: 0.3), value: currentStep)
                        }
                    }
                    .padding(.top, 20)
                    
                    Text("Paso \(currentStep + 1) de 4")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                ScrollView {
                    VStack(spacing: 32) {
                        // Content based on current step
                        switch currentStep {
                        case 0:
                            welcomeStep
                        case 1:
                            stateSelectionStep
                        case 2:
                            representativeStep
                        case 3:
                            tutorialStep
                        default:
                            welcomeStep
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 40)
                }
                
                // Navigation buttons
                VStack(spacing: 16) {
                    HStack {
                        if currentStep > 0 {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    currentStep -= 1
                                }
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "chevron.left")
                                        .font(.body)
                                    Text("Atrás")
                                        .font(.body)
                                        .fontWeight(.medium)
                                }
                                .foregroundColor(.blue)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(Color.blue.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            if currentStep == 3 {
                                completeOnboarding()
                            } else {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    currentStep += 1
                                }
                            }
                        }) {
                            HStack(spacing: 8) {
                                Text(currentStep == 3 ? "Completar" : "Siguiente")
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                if currentStep != 3 {
                                    Image(systemName: "chevron.right")
                                        .font(.body)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 32)
                            .padding(.vertical, 16)
                            .background(currentStep == 1 && selectedState.isEmpty ? Color.gray : Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color.blue.opacity(0.3), radius: 4, x: 0, y: 2)
                        }
                        .disabled(currentStep == 1 && selectedState.isEmpty)
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.bottom, 30)
            }
        }
        .fullScreenCover(isPresented: $showHomeView) {
            HomeView()
        }
    }
    
    // Welcome Step
    private var welcomeStep: some View {
        VStack(spacing: 32) {
            VStack(spacing: 24) {
                Image(systemName: "flag.filled.and.flag.crossed")
                    .font(.system(size: 80))
                    .foregroundColor(.red)
                    .shadow(color: .red.opacity(0.3), radius: 8, x: 0, y: 4)
                
                VStack(spacing: 16) {
                    Text("¡Bienvenido a Ciudadano!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    
                    Text("Tu compañero de preparación para el examen de ciudadanía estadounidense")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "person.2.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .frame(width: 24, height: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Perfecto para Hispanohablantes")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Diseñado específicamente para aprender el inglés necesario")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.title2)
                            .frame(width: 24, height: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Preguntas Personalizadas")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Respuestas específicas para tu estado")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "graduationcap.fill")
                            .foregroundColor(.purple)
                            .font(.title2)
                            .frame(width: 24, height: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Preparación Completa")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Exámenes de práctica y recursos")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.95))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
            }
        }
    }
    
    // State Selection Step
    private var stateSelectionStep: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.red)
                
                VStack(spacing: 12) {
                    Text("¿En qué estado vives?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    
                    Text("Selecciona tu estado para personalizar las preguntas del examen")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                    Text("Selecciona tu estado")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(StateData.states, id: \.name) { state in
                            Button(action: {
                                selectedState = state.name
                            }) {
                                HStack {
                                    Text(state.name)
                                        .foregroundColor(.primary)
                                        .font(.body)
                                        .fontWeight(.medium)
                                    
                                    Spacer()
                                    
                                    if selectedState == state.name {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                            .font(.title3)
                                    }
                                }
                                .padding()
                                .background(selectedState == state.name ? Color.blue.opacity(0.1) : Color(.systemBackground).opacity(0.95))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedState == state.name ? Color.blue : Color.clear, lineWidth: 2)
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .frame(maxHeight: 300)
            }
            .padding()
            .background(Color(.systemBackground).opacity(0.95))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
    }
    
    // Representative Step
    private var representativeStep: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                Image(systemName: "person.text.rectangle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.orange)
                
                VStack(spacing: 12) {
                    Text("Tu Representante")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    
                    Text("¿Quién es tu representante en el Congreso?")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            
            VStack(spacing: 20) {
                // Representative Input
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "person.badge.plus")
                            .foregroundColor(.blue)
                            .font(.title2)
                        Text("Representante en el Congreso")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    TextField("Nombre de tu representante", text: $representative)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.body)
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.95))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                
                // Help Section
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                        Text("¿No sabes quién es tu representante?")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 12) {
                            Image(systemName: "globe")
                                .foregroundColor(.green)
                                .font(.title3)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Busca en house.gov")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("Ingresa tu código postal para encontrar tu representante")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Link(destination: URL(string: "https://www.house.gov/representatives/find-your-representative")!) {
                            HStack {
                                Image(systemName: "arrow.up.right.square")
                                    .font(.body)
                                Text("Abrir house.gov")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: "external-link")
                                    .font(.caption)
                            }
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Text("También puedes dejarlo en blanco y agregarlo después en Configuración.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.top, 8)
                    }
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.95))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                
                // State Information Preview
                if let stateData = StateData.getStateData(for: selectedState) {
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "building.columns.fill")
                                .foregroundColor(.blue)
                                .font(.title2)
                            Text("Información de tu estado")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        
                        VStack(spacing: 12) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Capital")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text(stateData.capital)
                                        .font(.body)
                                        .fontWeight(.medium)
                                }
                                Spacer()
                                Image(systemName: "building.2.fill")
                                    .foregroundColor(.gray)
                                    .font(.title3)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Gobernador")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text(stateData.governor)
                                        .font(.body)
                                        .fontWeight(.medium)
                                }
                                Spacer()
                                Image(systemName: "person.badge.shield.checkmark.fill")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Senadores")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text(stateData.senators.joined(separator: ", "))
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .lineLimit(2)
                                }
                                Spacer()
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.purple)
                                    .font(.title3)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground).opacity(0.95))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                }
            }
        }
    }
    
    // Tutorial Step (Now Step 4)
    private var tutorialStep: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                Image(systemName: "lightbulb.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.yellow)
                
                VStack(spacing: 12) {
                    Text("Consejos de Uso")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    
                    Text("Aprende a usar las funciones principales")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            
            VStack(spacing: 20) {
                // Language Toggle Tutorial
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                            .font(.title2)
                        Text("Botón de Idioma")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    Text("Busca el botón 🌐 en la esquina superior derecha. Cambia entre Español y Inglés.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.95))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                
                // Audio Tutorial
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(.purple)
                            .font(.title2)
                        Text("Botones de Audio")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    Text("Busca los botones 🔊 junto a preguntas y respuestas. Escucha la pronunciación en inglés.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.95))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
            }
        }
    }
    
    private func completeOnboarding() {
        guard let stateData = StateData.getStateData(for: selectedState) else { return }
        
        let profile = UserProfile.shared
        profile.updateProfile(
            state: selectedState,
            stateCapital: stateData.capital,
            governor: stateData.governor,
            senators: stateData.senators,
            representative: representative.isEmpty ? "Tu representante local" : representative
        )
        
        showHomeView = true
    }
}

#Preview {
    OnboardingView()
} 
