import Foundation

struct ConversationPrompt: Identifiable {
    let id = UUID()
    let question: String
    let translatedQuestion: String
    let answers: [String]
    let translatedAnswers: [String]
}

struct ConversationPromptsData {
    static let prompts: [ConversationPrompt] = [
        ConversationPrompt(
            question: "What is your full name?",
            translatedQuestion: "¿Cuál es su nombre completo?",
            answers: ["My full name is Juan Carlos Perez"],
            translatedAnswers: ["Mi nombre completo es Juan Carlos Perez"]
        ),
        ConversationPrompt(
            question: "What is your date of birth?",
            translatedQuestion: "¿Cuál es su fecha de nacimiento?",
            answers: ["I was born on July 10, 1985"],
            translatedAnswers: ["Nací el 10 de julio de 1985"]
        ),
        ConversationPrompt(
            question: "Where do you live?",
            translatedQuestion: "¿Dónde vive?",
            answers: ["I live in Los Angeles, California"],
            translatedAnswers: ["Vivo en Los Ángeles, California"]
        ),
        ConversationPrompt(
            question: "What is your phone number?",
            translatedQuestion: "¿Cuál es su número de teléfono?",
            answers: ["My phone number is 310-555-1234"],
            translatedAnswers: ["Mi número de teléfono es 310-555-1234"]
        ),
        ConversationPrompt(
            question: "What is your current marital status?",
            translatedQuestion: "¿Cuál es su estado civil actual?",
            answers: [
                "I am married",
                "I am single",
                "I am divorced",
                "I am widowed",
                "I am separated"
            ],
            translatedAnswers: [
                "Estoy casado/a",
                "Soy soltero/a",
                "Estoy divorciado/a",
                "Soy viudo/a",
                "Estoy separado/a"
            ]
        ),
        ConversationPrompt(
            question: "Do you have any children?",
            translatedQuestion: "¿Tiene hijos?",
            answers: [
                "Yes, I have two children",
                "Yes, I have one child",
                "No, I don't have any children",
                "Yes, I have three children"
            ],
            translatedAnswers: [
                "Sí, tengo dos hijos",
                "Sí, tengo un hijo",
                "No, no tengo hijos",
                "Sí, tengo tres hijos"
            ]
        ),
        ConversationPrompt(
            question: "Where were you born?",
            translatedQuestion: "¿Dónde nació?",
            answers: ["I was born in Guatemala City, Guatemala"],
            translatedAnswers: ["Nací en Ciudad de Guatemala, Guatemala"]
        ),
        ConversationPrompt(
            question: "Have you traveled outside the U.S. in the last 5 years?",
            translatedQuestion: "¿Ha viajado fuera de los EE. UU. en los últimos 5 años?",
            answers: [
                "Yes, I traveled to El Salvador for two weeks in 2022",
                "No, I haven't traveled outside the U.S. in the last 5 years"
            ],
            translatedAnswers: [
                "Sí, viajé a El Salvador por dos semanas en 2022",
                "No, no he viajado fuera de los EE. UU. en los últimos 5 años"
            ]
        ),
        ConversationPrompt(
            question: "What do you do for a living?",
            translatedQuestion: "¿A qué se dedica?",
            answers: [
                "I work in housekeeping",
                "I am a student",
                "I work in construction",
                "I work in a restaurant",
                "I work in healthcare",
                "I work in retail",
                "I am unemployed",
                "I am retired",
                "I am a homemaker"
            ],
            translatedAnswers: [
                "Trabajo en limpieza",
                "Soy estudiante",
                "Trabajo en construcción",
                "Trabajo en un restaurante",
                "Trabajo en atención médica",
                "Trabajo en ventas al por menor",
                "Estoy desempleado/a",
                "Estoy jubilado/a",
                "Soy ama de casa"
            ]
        ),
        ConversationPrompt(
            question: "How long have you been a permanent resident?",
            translatedQuestion: "¿Cuánto tiempo ha sido residente permanente?",
            answers: ["I have been a permanent resident for six years"],
            translatedAnswers: ["He sido residente permanente por seis años"]
        ),
        ConversationPrompt(
            question: "Why do you want to become a U.S. citizen?",
            translatedQuestion: "¿Por qué quiere hacerse ciudadano estadounidense?",
            answers: ["Because I love this country and want to vote"],
            translatedAnswers: ["Porque amo este país y quiero votar"]
        ),
        ConversationPrompt(
            question: "Do you understand what it means to take the Oath of Allegiance?",
            translatedQuestion: "¿Entiende lo que significa hacer el Juramento de Lealtad?",
            answers: ["Yes, it means I promise to be loyal to the United States"],
            translatedAnswers: ["Sí, significa que prometo ser leal a los Estados Unidos"]
        )
    ]
} 