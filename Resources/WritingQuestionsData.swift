import Foundation

struct WritingQuestion {
    let text: String
    let translatedText: String
}

struct WritingQuestionsData {
    static let questions: [WritingQuestion] = [
        // PEOPLE (unique)
        WritingQuestion(
            text: "Adams was the second president",
            translatedText: "Adams fue el segundo presidente"
        ),
        WritingQuestion(
            text: "Lincoln freed the slaves",
            translatedText: "Lincoln liberó a los esclavos"
        ),
        WritingQuestion(
            text: "Washington is the Father of Our Country",
            translatedText: "Washington es el Padre de Nuestro País"
        ),
        
        // CIVICS (unique)
        WritingQuestion(
            text: "Congress makes laws",
            translatedText: "El Congreso hace leyes"
        ),
        WritingQuestion(
            text: "The flag has thirteen stripes",
            translatedText: "La bandera tiene trece franjas"
        ),
        WritingQuestion(
            text: "The White House is in the capital",
            translatedText: "La Casa Blanca está en la capital"
        ),
        WritingQuestion(
            text: "We pay taxes every year",
            translatedText: "Pagamos impuestos cada año"
        ),
        WritingQuestion(
            text: "Senators meet in Washington DC",
            translatedText: "Los senadores se reúnen en Washington DC"
        ),
        WritingQuestion(
            text: "Freedom of speech is a right",
            translatedText: "La libertad de expresión es un derecho"
        ),
        WritingQuestion(
            text: "Citizens can vote for Congress",
            translatedText: "Los ciudadanos pueden votar por el Congreso"
        ),
        
        // HOLIDAYS (unique)
        WritingQuestion(
            text: "Labor Day is in September",
            translatedText: "El Día del Trabajo es en septiembre"
        ),
        WritingQuestion(
            text: "Columbus Day is in October",
            translatedText: "El Día de Colón es en octubre"
        ),
        WritingQuestion(
            text: "Presidents’ Day is in February",
            translatedText: "El Día de los Presidentes es en febrero"
        ),
        
        // PLACES (unique)
        WritingQuestion(
            text: "Alaska is the largest state in America",
            translatedText: "Alaska es el estado más grande de América"
        ),
        WritingQuestion(
            text: "Delaware was the first state",
            translatedText: "Delaware fue el primer estado"
        ),
        WritingQuestion(
            text: "New York City has many people",
            translatedText: "La ciudad de Nueva York tiene mucha gente"
        ),
        WritingQuestion(
            text: "Canada is north of the United States",
            translatedText: "Canadá está al norte de los Estados Unidos"
        ),
        WritingQuestion(
            text: "Mexico is south of the United States",
            translatedText: "México está al sur de los Estados Unidos"
        ),
        
        // SIMPLE ACTION SENTENCES (unique)
        WritingQuestion(
            text: "We vote in November",
            translatedText: "Votamos en noviembre"
        ),
        WritingQuestion(
            text: "I want to be an American citizen",
            translatedText: "Quiero ser ciudadano estadounidense"
        ),
        WritingQuestion(
            text: "The people elect the President every four years",
            translatedText: "El pueblo elige al presidente cada cuatro años"
        ),
        WritingQuestion(
            text: "We have fifty states in our country",
            translatedText: "Tenemos cincuenta estados en nuestro país"
        ),
        WritingQuestion(
            text: "Our flag is red, white, and blue.",
            translatedText: "Nuestra bandera es roja, blanca y azul"
        )
    ]
}
