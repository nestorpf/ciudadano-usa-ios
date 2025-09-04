import SwiftUI

struct SpeakingView: View {
    var prompts: [ConversationPrompt] = ConversationPromptsData.prompts
    
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
                    Text("Debe demostrar que puede hablar y entender inglés durante la entrevista de naturalización. Las siguientes son preguntas de práctica basadas en la sección de expresión oral")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(prompts.indices, id: \.self) { idx in
                        NavigationLink(destination: ConversationPromptView(prompt: prompts[idx])) {
                            HStack {
                                Text("\(idx + 1).")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                Text(prompts[idx].question)
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
        .navigationTitle("Conversación")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        SpeakingView()
    }
}
