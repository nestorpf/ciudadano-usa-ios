import Foundation

struct ReadingQuestion {
    let text: String
    let translatedText: String
}

struct ReadingQuestionsData {
    static let questions: [ReadingQuestion] = [
        // PEOPLE
        ReadingQuestion(
            text: "George Washington was the first president.",
            translatedText: "George Washington fue el primer presidente."
        ),
        ReadingQuestion(
            text: "Abraham Lincoln was President during the Civil War.",
            translatedText: "Abraham Lincoln fue presidente durante la Guerra Civil."
        ),
        
        // CIVICS
        ReadingQuestion(
            text: "Citizens can vote in elections.",
            translatedText: "Los ciudadanos pueden votar en las elecciones."
        ),
        ReadingQuestion(
            text: "The White House is in Washington, D.C.",
            translatedText: "La Casa Blanca está en Washington D. C."
        ),
        ReadingQuestion(
            text: "Congress meets in the U.S. Capitol.",
            translatedText: "El Congreso se reúne en el Capitolio de los Estados Unidos."
        ),
        ReadingQuestion(
            text: "The President lives in the White House.",
            translatedText: "El presidente vive en la Casa Blanca."
        ),
        ReadingQuestion(
            text: "We pay taxes to the government.",
            translatedText: "Pagamos impuestos al gobierno."
        ),
        
        // HOLIDAYS
        ReadingQuestion(
            text: "Independence Day is in July.",
            translatedText: "El Día de la Independencia es en julio."
        ),
        ReadingQuestion(
            text: "Thanksgiving is in November.",
            translatedText: "El Día de Acción de Gracias es en noviembre."
        ),
        ReadingQuestion(
            text: "We celebrate Flag Day in June.",
            translatedText: "Celebramos el Día de la Bandera en junio."
        ),
        
        // SIMPLE ACTION SENTENCES
        ReadingQuestion(
            text: "I want to be a U.S. citizen.",
            translatedText: "Quiero ser ciudadano estadounidense."
        ),
        ReadingQuestion(
            text: "We have a big country.",
            translatedText: "Tenemos un país grande."
        ),
        ReadingQuestion(
            text: "People have many rights.",
            translatedText: "Las personas tienen muchos derechos."
        ),
        ReadingQuestion(
            text: "The United States has fifty states.",
            translatedText: "Los Estados Unidos tienen cincuenta estados."
        ),
        ReadingQuestion(
            text: "The flag is red, white, and blue.",
            translatedText: "La bandera es roja, blanca y azul."
        ),
        ReadingQuestion(
            text: "We vote for the President.",
            translatedText: "Votamos por el presidente."
        ),
        ReadingQuestion(
            text: "The people elect Congress.",
            translatedText: "El pueblo elige al Congreso."
        ),
        ReadingQuestion(
            text: "The President meets with Congress.",
            translatedText: "El presidente se reúne con el Congreso."
        ),
        ReadingQuestion(
            text: "The country has a capital city.",
            translatedText: "El país tiene una ciudad capital."
        ),
        ReadingQuestion(
            text: "The American flag has stars and stripes.",
            translatedText: "La bandera estadounidense tiene estrellas y franjas."
        )
    ]
}
