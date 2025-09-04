//
//  SettingsView.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import SwiftUI

struct SettingsProfile {
    var state: String
    var stateCapital: String
    var governor: String
    var senators: [String]
    var representative: String
}

struct SettingsView: View {
    @State private var editingProfile: SettingsProfile = {
        let profile = UserProfile.shared
        return SettingsProfile(
            state: profile.state,
            stateCapital: profile.stateCapital,
            governor: profile.governor,
            senators: profile.senators,
            representative: profile.representative
        )
    }()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Patriotic Gradient Background (consistent with app)
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
                        // Header Section
                        VStack(spacing: 12) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.blue)
                            
                            Text("Configuración Personal")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Personaliza las preguntas de cívica con tu información local")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 20)
                        
                        // State Selection Section
                        VStack(spacing: 16) {
                            HStack {
                                Image(systemName: "mappin.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.title2)
                                Text("Tu Estado")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            
                            Picker("Estado", selection: $editingProfile.state) {
                                ForEach(StateData.states, id: \.name) { state in
                                    Text(state.name).tag(state.name)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: editingProfile.state) { oldValue, newValue in
                                if let stateData = StateData.getStateData(for: newValue) {
                                    editingProfile.stateCapital = stateData.capital
                                    editingProfile.governor = stateData.governor
                                    editingProfile.senators = stateData.senators
                                    // Save immediately
                                    let profile = UserProfile.shared
                                    profile.state = stateData.name
                                    profile.stateCapital = stateData.capital
                                    profile.governor = stateData.governor
                                    profile.senators = stateData.senators
                                    profile.hasCompletedOnboarding = true
                                    profile.saveProfile()
                                }
                            }
                        }
                        .padding()
                        .background(Color(.systemBackground).opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                        
                        // State Information Section
                        VStack(spacing: 16) {
                            HStack {
                                Image(systemName: "building.columns.fill")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                Text("Información del Estado")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            
                            VStack(spacing: 12) {
                                // Capital
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Capital")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(editingProfile.stateCapital)
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
                                
                                // Governor
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Gobernador")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(editingProfile.governor)
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
                                
                                // Senators
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Senadores")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(editingProfile.senators.joined(separator: ", "))
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
                        
                        // Representative Section
                        VStack(spacing: 16) {
                            HStack {
                                Image(systemName: "person.text.rectangle.fill")
                                    .foregroundColor(.orange)
                                    .font(.title2)
                                Text("Tu Representante")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Representante en el Congreso")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                TextField("Nombre de tu representante", text: $editingProfile.representative)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .onChange(of: editingProfile.representative) { oldValue, newValue in
                                        let profile = UserProfile.shared
                                        profile.representative = newValue
                                        profile.hasCompletedOnboarding = true
                                        profile.saveProfile()
                                    }
                                
                                Text("Puedes encontrar esta información en house.gov")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color(.systemBackground).opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                        
                        // Info Section
                        VStack(spacing: 12) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                Text("¿Por qué necesitamos esta información?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            
                            Text("Las preguntas del examen de ciudadanía incluyen información específica sobre tu estado, como el nombre de tu gobernador y senadores. Con esta información, podemos personalizar tu experiencia de estudio.")
                                .font(.body)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                        .background(Color(.systemBackground).opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                        
                        Spacer(minLength: 30)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationTitle("Configuración")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SettingsView()
} 
