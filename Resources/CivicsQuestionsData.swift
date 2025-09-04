//
//  CivicsQuestionsData.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import Foundation

struct CivicsQuestion {
    let question: String
    let translatedQuestion: String
    let answers: [String]
    let translatedAnswers: [String]
    let requiredAnswers: Int
}

struct CivicsQuestions {
    static let questions = [
        // Q1
        CivicsQuestion(
            question: "What is the supreme law of the land?",
            translatedQuestion: "¿Qué es la ley suprema del país?",
            answers: ["the Constitution"],
            translatedAnswers: ["la Constitución"],
            requiredAnswers: 1
        ),
        // Q2
        CivicsQuestion(
            question: "What does the Constitution do?",
            translatedQuestion: "¿Qué hace la Constitución?",
            answers: [
                "sets up the government",
                "defines the government",
                "protects basic rights of Americans"
            ],
            translatedAnswers: [
                "establece el gobierno",
                "define el gobierno",
                "protege los derechos básicos de los americanos"
            ],
            requiredAnswers: 3
        ),
        // Q3
        CivicsQuestion(
            question: "The idea of self-government is in the first three words of the Constitution. What are these words?",
            translatedQuestion: "La idea de autogobierno está en las tres primeras palabras de la Constitución. ¿Cuáles son estas palabras?",
            answers: ["We the People"],
            translatedAnswers: ["Nosotros el Pueblo"],
            requiredAnswers: 1
        ),
        // Q4
        CivicsQuestion(
            question: "What is an amendment?",
            translatedQuestion: "¿Qué es una enmienda?",
            answers: [
                "a change (to the Constitution)",
                "an addition (to the Constitution)"
            ],
            translatedAnswers: [
                "un cambio (a la Constitución)",
                "una adición (a la Constitución)"
            ],
            requiredAnswers: 1
        ),
        // Q5
        CivicsQuestion(
            question: "What do we call the first ten amendments to the Constitution?",
            translatedQuestion: "¿Cómo llamamos a las diez primeras enmiendas a la Constitución?",
            answers: ["the Bill of Rights"],
            translatedAnswers: ["la declaración de derechos"],
            requiredAnswers: 1
        ),
        // Q6
        CivicsQuestion(
            question: "What is one right or freedom from the First Amendment?",
            translatedQuestion: "¿Cuál es un derecho o libertad de la Primera Enmienda?",
            answers: [
                "speech",
                "religion",
                "assembly",
                "press",
                "petition the government"
            ],
            translatedAnswers: [
                "discurso",
                "religión",
                "asamblea",
                "prensa",
                "petición al gobierno"
            ],
            requiredAnswers: 1
        ),
        // Q7
        CivicsQuestion(
            question: "How many amendments does the Constitution have?",
            translatedQuestion: "¿Cuántas enmiendas tiene la Constitución?",
            answers: ["twenty-seven (27)"],
            translatedAnswers: ["veintisiete (27)"],
            requiredAnswers: 1
        ),
        // Q8
        CivicsQuestion(
            question: "What did the Declaration of Independence do?",
            translatedQuestion: "¿Qué hizo la Declaración de Independencia?",
            answers: [
                "announced our independence (from Great Britain)",
                "declared our independence (from Great Britain)",
                "said that the United States is free (from Great Britain)"
            ],
            translatedAnswers: [
                "anunciamos nuestra independencia (de Gran Bretaña)",
                "declaramos nuestra independencia (de Gran Bretaña)",
                "dijo que Estados Unidos está libre (de Gran Bretaña)"
            ],
            requiredAnswers: 1
        ),
        // Q9
        CivicsQuestion(
            question: "What are two rights in the Declaration of Independence?",
            translatedQuestion: "¿Cuáles son dos derechos en la Declaración de Independencia?",
            answers: [
                "life",
                "liberty",
                "pursuit of happiness"
            ],
            translatedAnswers: [
                "vida",
                "libertad",
                "búsqueda de la felicidad",
            ],
            requiredAnswers: 2
        ),
        // Q10
        CivicsQuestion(
            question: "What is freedom of religion?",
            translatedQuestion: "¿Qué es la libertad de religión?",
            answers: ["You can practice any religion, or not practice a religion"],
            translatedAnswers: ["Puedes practicar cualquier religión, o no practicar una religión"],
            requiredAnswers: 1
        ),
        // Q11
        CivicsQuestion(
            question: "What is the economic system in the United States?",
            translatedQuestion: "¿Cuál es el sistema económico en Estados Unidos?",
            answers: [
                "capitalist economy",
                "market economy"
            ],
            translatedAnswers: [
                "economía capitalista",
                "economía de mercado"
            ],
            requiredAnswers: 1
        ),
        // Q12
        CivicsQuestion(
            question: "What is the \"rule of law\"?",
            translatedQuestion: "¿Qué es el \"estado de derecho\"?",
            answers: [
                "Everyone must follow the law",
                "Leaders must obey the law",
                "Government must obey the law",
                "No one is above the law"
            ],
            translatedAnswers: [
                "Todos deben respetar la ley",
                "Los líderes deben obedecer la ley",
                "El gobierno debe obedecer la ley",
                "Nadie está por encima de la ley"
            ],
            requiredAnswers: 4
        ),
        // Q13
        CivicsQuestion(
            question: "Name one branch or part of the government",
            translatedQuestion: "Nombre una rama o parte del gobierno",
            answers: [
                "Congress",
                "legislative",
                "President",
                "executive",
                "the courts",
                "judicial"
            ],
            translatedAnswers: [
                "Congreso",
                "legislativo",
                "Presidente",
                "ejecutivo",
                "los tribunales",
                "judicial"
            ],
            requiredAnswers: 1
        ),
        // Q14
        CivicsQuestion(
            question: "What stops one branch of government from becoming too powerful?",
            translatedQuestion: "¿Qué impide que una rama del gobierno se vuelva demasiado poderosa?",
            answers: [
                "checks and balances",
                "separation of powers"
            ],
            translatedAnswers: [
                "controles y contrapesos",
                "separación de poderes"
            ],
            requiredAnswers: 2
        ),
        // Q15
        CivicsQuestion(
            question: "Who is in charge of the executive branch?",
            translatedQuestion: "¿Quién está a cargo del poder ejecutivo?",
            answers: [" the President"],
            translatedAnswers: ["el Presidente"],
            requiredAnswers: 1
        ),
        // Q16
        CivicsQuestion(
            question: "Who makes federal laws?",
            translatedQuestion: "¿Quién hace las leyes federales?",
            answers: [
                "Congress",
                "Senate and House (of Representatives)",
                "(U.S. or national) legislature"
            ],
            translatedAnswers: [
                "Congreso",
                "Senado y Cámara (de Representantes)",
                "legislatura (estadounidense o nacional)"
            ],
            requiredAnswers: 1
        ),
        // Q17
        CivicsQuestion(
            question: "What are the two parts of the U.S. Congress?",
            translatedQuestion: "¿Cuáles son las dos partes del Congreso de los Estados Unidos?",
            answers: ["the Senate and House (of Representatives)"],
            translatedAnswers: ["el Senado y la Cámara (de Representantes)"],
            requiredAnswers: 1
        ),
        // Q18
        CivicsQuestion(
            question: "How many U.S. Senators are there?",
            translatedQuestion: "¿Cuántos senadores estadounidenses hay?",
            answers: ["one hundred (100)"],
            translatedAnswers: ["cien (100)"],
            requiredAnswers: 1
        ),
        // Q19
        CivicsQuestion(
            question: "We elect a U.S. Senator for how many years?",
            translatedQuestion: "¿Elegimos un senador de los Estados Unidos por cuántos años?",
            answers: ["six (6)"],
            translatedAnswers: ["seis (6)"],
            requiredAnswers: 1
        ),
        // Q20
        CivicsQuestion(
            question: "Who is one of your state's U.S. Senators now?",
            translatedQuestion: "¿Quién es uno de los senadores estadounidenses de su estado ahora?",
            answers: ["Answers will vary"],
            translatedAnswers: ["Las respuestas variarán"],
            requiredAnswers: 1
        ),
        // Q21
        CivicsQuestion(
            question: "The House of Representatives has how many voting members? ",
            translatedQuestion: "¿Cuántos miembros votantes tiene la Cámara de Representantes?",
            answers: ["four hundred thirty-five (435)"],
            translatedAnswers: ["cuatrocientos treinta y cinco (435)"],
            requiredAnswers: 1
        ),
        // Q22
        CivicsQuestion(
            question: "We elect a U.S. Representative for how many years?",
            translatedQuestion: "¿Elegimos un representante de los Estados Unidos por cuántos años?",
            answers: ["two (2)"],
            translatedAnswers: ["dos (2)"],
            requiredAnswers: 1
        ),
        // Q23
        CivicsQuestion(
            question: "Name your U.S. Representative.",
            translatedQuestion: "Nombre a su representante de EE. UU.",
            answers: ["Answers will vary"],
            translatedAnswers: ["Las respuestas variarán"],
            requiredAnswers: 1
        ),
        // Q24
        CivicsQuestion(
            question: "Who does a U.S. Senator represent?",
            translatedQuestion: "¿A quién representa un senador estadounidense?",
            answers: ["all people of the state"],
            translatedAnswers: ["todas las personas del estado"],
            requiredAnswers: 1
        ),
        // Q25
        CivicsQuestion(
            question: "Why do some states have more Representatives than other states?",
            translatedQuestion: "¿Por qué algunos estados tienen más representantes que otros estados?",
            answers: [
                "(because of) the state's population",
                "(because) they have more people",
                "(because) some states have more people"
            ],
            translatedAnswers: [
                "(debido a) la población del estado",
                "(porque) tienen más gente",
                "(porque) algunos estados tienen más gente"
            ],
            requiredAnswers: 1
        ),
        // Q26
        CivicsQuestion(
            question: "We elect a President for how many years?",
            translatedQuestion: "¿Elegimos un presidente por cuántos años?",
            answers: ["four (4)"],
            translatedAnswers: ["cuatro (4)"],
            requiredAnswers: 1
        ),
        // Q27
        CivicsQuestion(
            question: "In what month do we vote for President?",
            translatedQuestion: "¿En qué mes votamos por el presidente?",
            answers: ["November"],
            translatedAnswers: ["Noviembre"],
            requiredAnswers: 1
        ),
        // Q28
        CivicsQuestion(
            question: "What is the name of the President of the United States now?",
            translatedQuestion: "¿Cómo se llama ahora el presidente de los Estados Unidos?",
            answers: ["Donald Trump"],
            translatedAnswers: ["Donald Trump"],
            requiredAnswers: 1
        ),
        // Q29
        CivicsQuestion(
            question: "What is the name of the Vice President of the United States now?",
            translatedQuestion: "¿Cómo se llama ahora el vicepresidente de Estados Unidos?",
            answers: ["JD Vance"],
            translatedAnswers: ["JD Vance"],
            requiredAnswers: 1
        ),
        // Q30
        CivicsQuestion(
            question: "If the President can no longer serve, who becomes President?",
            translatedQuestion: "Si el presidente ya no puede seguir en el cargo, ¿quién se convierte en presidente?",
            answers: ["the Vice President"],
            translatedAnswers: ["el Vicepresidente"],
            requiredAnswers: 1
        ),
        // Q31
        CivicsQuestion(
            question: "If both the President and the Vice President can no longer serve, who becomes President?",
            translatedQuestion: "Si tanto el presidente como el vicepresidente ya no pueden ejercer sus funciones, ¿quién pasa a ser presidente?",
            answers: ["the Speaker of the House"],
            translatedAnswers: ["El Presidente de la Cámara"],
            requiredAnswers: 1
        ),
        // Q32
        CivicsQuestion(
            question: "Who is the Commander in Chief of the military?",
            translatedQuestion: "¿Quién es el comandante en jefe del ejército?",
            answers: ["the President"],
            translatedAnswers: ["el Presidente"],
            requiredAnswers: 1
        ),
        // Q33
        CivicsQuestion(
            question: "Who signs bills to become laws?",
            translatedQuestion: "¿Quién firma los proyectos de ley para que se conviertan en leyes?",
            answers: ["the President"],
            translatedAnswers: ["el Presidente"],
            requiredAnswers: 1
        ),
        // Q34
        CivicsQuestion(
            question: "Who vetoes bills?",
            translatedQuestion: "¿Quién veta los proyectos de ley?",
            answers: ["the President"],
            translatedAnswers: ["el Presidente"],
            requiredAnswers: 1
        ),
        // Q35
        CivicsQuestion(
            question: "What does the President's Cabinet do?",
            translatedQuestion: "¿Qué hace el Gabinete del Presidente?",
            answers: ["advises the President"],
            translatedAnswers: ["asesora al presidente"],
            requiredAnswers: 1
        ),
        // Q36
        CivicsQuestion(
            question: "What are two Cabinet-level positions?",
            translatedQuestion: "¿Cuáles son dos puestos a nivel de gabinete?",
            answers: [
                "Secretary of Agriculture",
                "Secretary of Commerce",
                "Secretary of Defense",
                "Secretary of Education",
                "Secretary of Energy",
                "Secretary of Health and Human Services",
                "Secretary of Homeland Security",
                "Secretary of Housing and Urban Development",
                "Secretary of the Interior",
                "Secretary of Labor",
                "Secretary of State",
                "Secretary of Transportation",
                "Secretary of the Treasury",
                "Secretary of Veterans Affairs",
                "Attorney General",
                "Vice President"
            ],
            translatedAnswers: [
                "Secretario de Agricultura",
                "Secretario de Comercio",
                "Secretario de Defensa",
                "Secretario de Educación",
                "Secretario de Energía",
                "Secretaria de Salud y Servicios Humanos",
                "Secretario de Seguridad Nacional",
                "Secretaria de Vivienda y Desarrollo Urbano",
                "Secretario del Interior",
                "Secretario de Trabajo",
                "Secretario de estado",
                "Secretario de Transporte",
                "Secretario del Tesoro",
                "Secretario de Asuntos de Veteranos",
                "Ministro de justicia",
                "Vicepresidente"
            ],
            requiredAnswers: 2
        ),
        // Q37
        CivicsQuestion(
            question: "What does the judicial branch do?",
            translatedQuestion: "¿Qué hace el poder judicial?",
            answers: [
                "reviews laws",
                "explains laws",
                "resolves disputes (disagreements)",
                "decides if a law goes against the Constitution"
            ],
            translatedAnswers: [
                "revisa las leyes",
                "explica las leyes",
                "resuelve disputas (desacuerdos)",
                "decide si una ley va contra la Constitución"
            ],
            requiredAnswers: 4
        ),
        // Q38
        CivicsQuestion(
            question: "What is the highest court in the United States?",
            translatedQuestion: "¿Cuál es el tribunal más alto de los Estados Unidos?",
            answers: ["the Supreme Court"],
            translatedAnswers: ["la Corte Suprema"],
            requiredAnswers: 1
        ),
        // Q39
        CivicsQuestion(
            question: "How many justices are on the Supreme Court?",
            translatedQuestion: "¿Cuántos jueces hay en la Corte Suprema?",
            answers: ["nine (9)"],
            translatedAnswers: ["nueve (9)"],
            requiredAnswers: 1
        ),
        // Q40
        CivicsQuestion(
            question: "Who is the Chief Justice of the United States now?",
            translatedQuestion: "¿Quién es ahora el presidente del Tribunal Supremo de los Estados Unidos?",
            answers: ["John Roberts"],
            translatedAnswers: ["John Roberts"],
            requiredAnswers: 1
        ),
        // Q41
        CivicsQuestion(
            question: "Under our Constitution, some powers belong to the federal government. What is one power of the federal government?",
            translatedQuestion: "Según nuestra Constitución, algunos poderes pertenecen al gobierno federal. ¿Cuál es un poder del gobierno federal?",
            answers: [
                "to print money",
                "to declare war",
                "to create an army",
                "to make treaties"
            ],
            translatedAnswers: [
                "imprimir dinero",
                "declarar la guerra",
                "crear un ejército",
                "hacer tratados"
            ],
            requiredAnswers: 1
        ),
        // Q42
        CivicsQuestion(
            question: "Under our Constitution, some powers belong to the states. What is one power of the states?",
            translatedQuestion: "Según nuestra Constitución, algunos poderes pertenecen a los estados. ¿Cuál es un poder de los estados?",
            answers: [
                "provide schooling and education",
                "provide protection (police)",
                "provide safety (fire departments)",
                "give a driver's license",
                "approve zoning and land use"
            ],
            translatedAnswers: [
                "proporcionar escolarización y educación",
                "brindar protección (policía)",
                "brindar seguridad (departamentos de bomberos)",
                "dar una licencia de conducir",
                "aprobar zonificación y uso del suelo"
            ],
            requiredAnswers: 1
        ),
        // Q43
        CivicsQuestion(
            question: "Who is the Governor of your state now?",
            translatedQuestion: "¿Quién es el gobernador de tu estado ahora?",
            answers: ["Answers will vary"],
            translatedAnswers: ["Las respuestas variarán"],
            requiredAnswers: 1
        ),
        // Q44
        CivicsQuestion(
            question: "What is the capital of your state?",
            translatedQuestion: "¿Cuál es la capital de tu estado?",
            answers: ["Answers will vary"],
            translatedAnswers: ["Las respuestas variarán"],
            requiredAnswers: 1
        ),
        // Q45
        CivicsQuestion(
            question: "What are the two major political parties in the United States?",
            translatedQuestion: "¿Cuáles son los dos principales partidos políticos de Estados Unidos?",
            answers: ["Democratic and Republican"],
            translatedAnswers: ["Democrático y republicano"],
            requiredAnswers: 1
        ),
        // Q46
        CivicsQuestion(
            question: "What is the political party of the President now?",
            translatedQuestion: "¿Cuál es el partido político del presidente ahora?",
            answers: ["Republican"],
            translatedAnswers: ["Republicano"],
            requiredAnswers: 1
        ),
        // Q47
        CivicsQuestion(
            question: "What is the name of the Speaker of the House of Representatives now?",
            translatedQuestion: "¿Cómo se llama ahora el presidente de la Cámara de Representantes?",
            answers: ["Mike Johnson"],
            translatedAnswers: ["Mike Johnson"],
            requiredAnswers: 1
        ),
        // Q48
        CivicsQuestion(
            question: "There are four amendments to the Constitution about who can vote. Describe one of them.",
            translatedQuestion: "Hay cuatro enmiendas a la Constitución sobre quién puede votar. Describe una de ellas.",
            answers: [
                "Citizens eighteen (18) and older (can vote)",
                "You don't have to pay (a poll tax) to vote",
                "Any citizen can vote. (Women and men can vote)",
                "A male citizen of any race (can vote)"
            ],
            translatedAnswers: [
                "Los ciudadanos de dieciocho (18) años y mayores (pueden votar)",
                "No hay que pagar (un impuesto de capitación) para votar",
                "Cualquier ciudadano puede votar. (Mujeres y hombres pueden votar)",
                "Un ciudadano varón de cualquier raza (puede votar)"
            ],
            requiredAnswers: 1
        ),
        // Q49
        CivicsQuestion(
            question: "What is one responsibility that is only for United States citizens?",
            translatedQuestion: "¿Cuál es una responsabilidad que es sólo de los ciudadanos estadounidenses?",
            answers: [
                "serve on a jury",
                "vote in a federal election"
            ],
            translatedAnswers: [
                "formar parte de un jurado",
                "votar en una elección federal"
            ],
            requiredAnswers: 1
        ),
        // Q50
        CivicsQuestion(
            question: "Name one right only for United States citizens.",
            translatedQuestion: "Nombra un derecho sólo para los ciudadanos de los Estados Unidos.",
            answers: [
                "vote in a federal election",
                "run for federal office"
            ],
            translatedAnswers: [
                "votar en una elección federal",
                "postularse para un cargo federal"
            ],
            requiredAnswers: 1
        ),
        // Q51
        CivicsQuestion(
            question: "What are two rights of everyone living in the United States?",
            translatedQuestion: "¿Cuáles son dos derechos de todas las personas que viven en los Estados Unidos?",
            answers: [
                "freedom of expression",
                "freedom of speech",
                "freedom of assembly",
                "freedom to petition the government",
                "freedom of religion",
                "the right to bear arms"
            ],
            translatedAnswers: [
                "libertad de expresión",
                "libertad de interlocución",
                "libertad de reunión",
                "libertad de presentar peticiones al gobierno",
                "libertad de religión",
                "el derecho a portar armas"
            ],
            requiredAnswers: 2
        ),
        // Q52
        CivicsQuestion(
            question: "What do we show loyalty to when we say the Pledge of Allegiance?",
            translatedQuestion: "¿A qué mostramos lealtad cuando decimos el juramento a la bandera?",
            answers: [
                "the United States",
                "the flag"
            ],
            translatedAnswers: [
                "Estados Unidos",
                "la bandera"
            ],
            requiredAnswers: 2
        ),
        // Q53
        CivicsQuestion(
            question: "What is one promise you make when you become a United States citizen?",
            translatedQuestion: "¿Cuál es una promesa que hace cuando se convierte en ciudadano de los Estados Unidos?",
            answers: [
                "give up loyalty to other countries",
                "defend the Constitution and laws of the United States",
                "obey the laws of the United States",
                "serve in the U.S. military (if needed)",
                "serve (do important work for) the nation (if needed)",
                "be loyal to the United States"
            ],
            translatedAnswers: [
                "renunciar a la lealtad a otros países",
                "defender la Constitución y las leyes de los Estados Unidos",
                "obedecer las leyes de los Estados Unidos",
                "servir en el ejército de los EE. UU. (si es necesario)",
                "servir (hacer un trabajo importante para) la nación (si es necesario)",
                "ser leal a los Estados Unidos"
            ],
            requiredAnswers: 1
        ),
        // Q54
        CivicsQuestion(
            question: "How old do citizens have to be to vote for President?",
            translatedQuestion: "¿Qué edad deben tener los ciudadanos para votar por el presidente?",
            answers: ["eighteen (18) and older"],
            translatedAnswers: ["dieciocho (18) y mayores"],
            requiredAnswers: 1
        ),
        // Q55
        CivicsQuestion(
            question: "What are two ways that Americans can participate in their democracy?",
            translatedQuestion: "¿Cuáles son dos formas en que los estadounidenses pueden participar en su democracia?",
            answers: [
                "vote",
                "join a political party",
                "help with a campaign",
                "join a civic group",
                "join a community group",
                "give an elected official your opinion on an issue",
                "call Senators and Representatives",
                "publicly support or oppose an issue or policy",
                "run for office",
                "write to a newspaper"
            ],
            translatedAnswers: [
                "votar",
                "unirse a un partido político",
                "ayuda con una campaña",
                "únete a un grupo cívico",
                "únete a un grupo comunitario",
                "darle a un funcionario electo su opinión sobre un tema",
                "llamar a Senadores y Representantes",
                "apoyar o oponerse públicamente a un tema o política",
                "postularse para un cargo",
                "escribir a un periódico"
            ],
            requiredAnswers: 2
        ),
        // Q56
        CivicsQuestion(
            question: "When is the last day you can send in federal income tax forms?",
            translatedQuestion: "¿Cuándo es el último día que puede enviar los formularios de impuestos federales sobre la renta?",
            answers: ["April 15"],
            translatedAnswers: ["15 de abril"],
            requiredAnswers: 1
        ),
        // Q57
        CivicsQuestion(
            question: "When must all men register for the Selective Service?",
            translatedQuestion: "¿Cuándo deben registrarse todos los hombres para el Servicio Selectivo?",
            answers: [
                "at age eighteen (18)",
                "between eighteen (18) and twenty-six (26)"
            ],
            translatedAnswers: [
                "a los dieciocho (18) años",
                "entre dieciocho (18) y veintiséis (26)"
            ],
            requiredAnswers: 1
        ),
        // Q58
        CivicsQuestion(
            question: "What is one reason colonists came to America?",
            translatedQuestion: "¿Cuál es una de las razones por las que los colonos vinieron a Estados Unidos?",
            answers: [
                "freedom",
                "political liberty",
                "religious freedom",
                "economic opportunity",
                "practice their religion",
                "escape persecution"
            ],
            translatedAnswers: [
                "libertad",
                "libertad política",
                "libertad religiosa",
                "oportunidad económica",
                "practicar su religión",
                "escapar de la persecución"
            ],
            requiredAnswers: 1
        ),
        // Q59
        CivicsQuestion(
            question: "Who lived in America before the Europeans arrived?",
            translatedQuestion: "¿Quiénes vivían en América antes de que llegaran los europeos?",
            answers: [
                "American Indians",
                "Native Americans"
            ],
            translatedAnswers: [
                "indios americanos",
                "Nativos americanos"
            ],
            requiredAnswers: 1
        ),
        // Q60
        CivicsQuestion(
            question: "What group of people was taken to America and sold as slaves?",
            translatedQuestion: "¿Qué grupo de personas fueron llevadas a Estados Unidos y vendidas como esclavas?",
            answers: [
                "Africans",
                "People from Africa"
            ],
            translatedAnswers: [
                "africanos",
                "Gente de África"
            ],
            requiredAnswers: 1
        ),
        // Q61
        CivicsQuestion(
            question: "Why did the colonists fight the British?",
            translatedQuestion: "¿Por qué los colonos lucharon contra los británicos?",
            answers: [
                "because of high taxes (taxation without representation)",
                "because the British army stayed in their houses (boarding, quartering)",
                "because they didn't have self-government"
            ],
            translatedAnswers: [
                "debido a los altos impuestos (impuestos sin representación)",
                "porque el ejército británico se quedó en sus casas (alojamiento, acuartelamiento)",
                "porque no tenían autogobierno"
            ],
            requiredAnswers: 3
        ),
        // Q62
        CivicsQuestion(
            question: "Who wrote the Declaration of Independence?",
            translatedQuestion: "¿Quién escribió la Declaración de Independencia?",
            answers: ["(Thomas) Jefferson"],
            translatedAnswers: ["(Thomas) Jefferson"],
            requiredAnswers: 1
        ),
        // Q63
        CivicsQuestion(
            question: "When was the Declaration of Independence adopted?",
            translatedQuestion: "¿Cuándo se adoptó la Declaración de Independencia?",
            answers: ["July 4, 1776"],
            translatedAnswers: ["4 de Julio de 1776"],
            requiredAnswers: 1
        ),
        // Q64
        CivicsQuestion(
            question: "There were 13 original states. Name three.",
            translatedQuestion: "Había 13 estados originales. Nombra tres.",
            answers: [
                "New Hampshire",
                "Massachusetts",
                "Rhode Island",
                "Connecticut",
                "New York",
                "New Jersey",
                "Pennsylvania",
                "Delaware",
                "Maryland",
                "Virginia",
                "North Carolina",
                "South Carolina",
                "Georgia"
            ],
            translatedAnswers: [
                "Nueva Hampshire",
                "Massachusetts",
                "Rhode Island",
                "Connecticut",
                "Nueva York",
                "Nueva Jersey",
                "Pensilvania",
                "Delaware",
                "Maryland",
                "Virginia",
                "Carolina del Norte",
                "Carolina del Sur",
                "Georgia"
            ],
            requiredAnswers: 3
        ),
        // Q65
        CivicsQuestion(
            question: "What happened at the Constitutional Convention?",
            translatedQuestion: "¿Qué pasó en la Convención Constitucional?",
            answers: [
                "The Constitution was written",
                "The Founding Fathers wrote the Constitution"
            ],
            translatedAnswers: [
                "La Constitución fue escrita",
                "Los Padres Fundadores escribieron la Constitución"
            ],
            requiredAnswers: 1
        ),
        // Q66
        CivicsQuestion(
            question: "When was the Constitution written?",
            translatedQuestion: "¿Cuándo se redactó la Constitución?",
            answers: ["1787"],
            translatedAnswers: ["1787"],
            requiredAnswers: 1
        ),
        // Q67
        CivicsQuestion(
            question: "The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers.",
            translatedQuestion: "Los Federalist Papers apoyaron la aprobación de la Constitución de los Estados Unidos. Nombra a uno de los escritores.",
            answers: [
                "(James) Madison",
                "(Alexander) Hamilton",
                "(John) Jay",
                "Publius"
            ],
            translatedAnswers: [
                "(James) Madison",
                "(Alejandro) Hamilton",
                "(Juan) Jay",
                "Publio"
            ],
            requiredAnswers: 1
        ),
        // Q68
        CivicsQuestion(
            question: "What is one thing Benjamin Franklin is famous for?",
            translatedQuestion: "¿Por qué es famoso Benjamín Franklin?",
            answers: [
                "U.S. diplomat",
                "oldest member of the Constitutional Convention",
                "first Postmaster General of the United States",
                "writer of \"Poor Richard's Almanac\"",
                "started the first free libraries",
            ],
            translatedAnswers: [
                "diplomático estadounidense",
                "miembro de mayor edad de la Convención Constitucional",
                "primer Director General de Correos de los Estados Unidos",
                "escritor de \"Almanaque del pobre Richard\"",
                "iniciaron las primeras bibliotecas gratuitas",
            ],
            requiredAnswers: 1
        ),
        // Q69
        CivicsQuestion(
            question: "Who is the \"Father of Our Country\"?",
            translatedQuestion: "¿Quién es el \"padre de nuestra patria\"?",
            answers: ["(George) Washington"],
            translatedAnswers: ["(George) Washington"],
            requiredAnswers: 1
        ),
        // Q70
        CivicsQuestion(
            question: "Who was the first President?",
            translatedQuestion: "¿Quién fue el primer presidente?",
            answers: ["(George) Washington"],
            translatedAnswers: ["(George) Washington"],
            requiredAnswers: 1
        ),
        // Q71
        CivicsQuestion(
            question: "What territory did the United States buy from France in 1803?",
            translatedQuestion: "¿Qué territorio compró Estados Unidos a Francia en 1803?",
            answers: [
                "The Louisiana Territory",
                "Louisiana"
            ],
            translatedAnswers: [
                "El territorio de Luisiana",
                "Luisiana"
            ],
            requiredAnswers: 1
        ),
        // Q72
        CivicsQuestion(
            question: "Name one war fought by the United States in the 1800s.",
            translatedQuestion: "Nombra una guerra que Estados Unidos peleó en los 1800s",
            answers: [
                "War of 1812",
                "Mexican-American War",
                "Civil War",
                "Spanish-American War"
            ],
            translatedAnswers: [
                "Guerra de 1812",
                "Guerra México-Americana",
                "Guerra civil",
                "Guerra hispanoamericana"
            ],
            requiredAnswers: 1
        ),
        // Q73
        CivicsQuestion(
            question: "Name the U.S. war between the North and the South.",
            translatedQuestion: "Nombra la guerra de Estados Unidos entre el Norte y el Sur.",
            answers: [
                "the Civil War",
                "the War between the States"
            ],
            translatedAnswers: [
                "la Guerra Civil",
                "la guerra entre los estados"
            ],
            requiredAnswers: 1
        ),
        // Q74
        CivicsQuestion(
            question: "Name one problem that led to the Civil War.",
            translatedQuestion: "Nombra un problema que condujo a la Guerra Civil.",
            answers: [
                "slavery",
                "economic reasons",
                "states' rights"
            ],
            translatedAnswers: [
                "esclavitud",
                "razones económicas",
                "derechos de los estados"
            ],
            requiredAnswers: 1
        ),
        // Q75
        CivicsQuestion(
            question: "What was one important thing that Abraham Lincoln did?",
            translatedQuestion: "¿Qué fue una cosa importante que hizo Abraham Lincoln?",
            answers: [
                "freed the slaves (Emancipation Proclamation)",
                "saved (or preserved) the Union",
                "led the United States during the Civil War"
            ],
            translatedAnswers: [
                "liberó a los esclavos (Proclamación de Emancipación)",
                "salvó (o preservó) la Unión",
                "lideró a los Estados Unidos durante la Guerra Civil"
            ],
            requiredAnswers: 1
        ),
        // Q76
        CivicsQuestion(
            question: "What did the Emancipation Proclamation do?",
            translatedQuestion: "¿Qué hizo la Proclamación de Emancipación?",
            answers: [
                "freed the slaves",
                "freed slaves in the Confederacy",
                "freed slaves in the Confederate states",
                "freed slaves in most Southern states"
            ],
            translatedAnswers: [
                "liberó a los esclavos",
                "esclavos liberados en la Confederación",
                "esclavos liberados en los estados confederados",
                "esclavos liberados en la mayoría de los estados del sur"
            ],
            requiredAnswers: 1
        ),
        // Q77
        CivicsQuestion(
            question: "What did Susan B. Anthony do?",
            translatedQuestion: "¿Qué hizo Susan B. Anthony?",
            answers: [
                "fought for women's rights",
                "fought for civil rights"
            ],
            translatedAnswers: [
                "luchó por los derechos de las mujeres",
                "luchó por los derechos civiles"
            ],
            requiredAnswers: 1
        ),
        // Q78
        CivicsQuestion(
            question: "Name one war fought by the United States in the 1900s.",
            translatedQuestion: "Mencione una guerra que libró Estados Unidos en los 1900s",
            answers: [
                "World War I",
                "World War II",
                "Korean War",
                "Vietnam War",
                "(Persian) Gulf War"
            ],
            translatedAnswers: [
                "Primera Guerra Mundial",
                "Segunda Guerra Mundial",
                "Guerra de Corea",
                "Guerra de Vietnam",
                "Guerra del Golfo (Pérsico)"
            ],
            requiredAnswers: 1
        ),
        // Q79
        CivicsQuestion(
            question: "Who was President during World War I?",
            translatedQuestion: "¿Quién fue presidente durante la Primera Guerra Mundial?",
            answers: ["(Woodrow) Wilson"],
            translatedAnswers: ["(Woodrow) Wilson"],
            requiredAnswers: 1
        ),
        // Q80
        CivicsQuestion(
            question: "Who was President during the Great Depression and World War II?",
            translatedQuestion: "¿Quién fue presidente durante la Gran Depresión y la Segunda Guerra Mundial?",
            answers: ["(Franklin) Roosevelt"],
            translatedAnswers: ["(Franklin) Roosevelt"],
            requiredAnswers: 1
        ),
        // Q81
        CivicsQuestion(
            question: "Who did the United States fight in World War II?",
            translatedQuestion: "¿Contra quién luchó Estados Unidos en la Segunda Guerra Mundial?",
            answers: ["Japan, Germany, and Italy"],
            translatedAnswers: ["Japón, Alemania e Italia"],
            requiredAnswers: 1
        ),
        // Q82
        CivicsQuestion(
            question: "Before he was President, Eisenhower was a general. What war was he in?",
            translatedQuestion: "Antes de ser presidente, Eisenhower fue general. ¿En qué guerra estuvo?",
            answers: ["World War II"],
            translatedAnswers: ["Segunda Guerra Mundial"],
            requiredAnswers: 1
        ),
        // Q83
        CivicsQuestion(
            question: "During the Cold War, what was the main concern of the United States?",
            translatedQuestion: "Durante la Guerra Fría, ¿cuál fue la principal preocupación de Estados Unidos?",
            answers: ["Communism"],
            translatedAnswers: ["Comunismo"],
            requiredAnswers: 1
        ),
        // Q84
        CivicsQuestion(
            question: "What movement tried to end racial discrimination?",
            translatedQuestion: "¿Qué movimiento intentó acabar con la discriminación racial?",
            answers: ["civil rights (movement)"],
            translatedAnswers: ["derechos civiles (movimiento)"],
            requiredAnswers: 1
        ),
        // Q85
        CivicsQuestion(
            question: "What did Martin Luther King, Jr. do?",
            translatedQuestion: "¿Qué hizo Martin Luther King, Jr.?",
            answers: [
                "fought for civil rights",
                "worked for equality for all Americans"
            ],
            translatedAnswers: [
                "luchó por los derechos civiles",
                "trabajó por la igualdad para todos los estadounidenses"
            ],
            requiredAnswers: 1
        ),
        // Q86
        CivicsQuestion(
            question: "What major event happened on September 11, 2001, in the United States?",
            translatedQuestion: "¿Qué acontecimiento importante ocurrió el 11 de septiembre de 2001 en Estados Unidos?",
            answers: ["Terrorists attacked the United States"],
            translatedAnswers: ["Los terroristas atacaron a los Estados Unidos"],
            requiredAnswers: 1
        ),
        // Q87
        CivicsQuestion(
            question: "Name one American Indian tribe in the United States.",
            translatedQuestion: "Nombra una tribu de indios americanos en los Estados Unidos.",
            answers: [
                "Cherokee",
                "Navajo",
                "Sioux",
                "Chippewa",
                "Choctaw",
                "Pueblo",
                "Apache",
                "Iroquois",
                "Creek",
                "Blackfeet",
                "Seminole",
                "Cheyenne",
                "Arawak",
                "Shawnee",
                "Mohegan",
                "Huron",
                "Oneida",
                "Lakota",
                "Crow",
                "Teton",
                "Hopi",
                "Inuit"
            ],
            translatedAnswers: [
                "Cherokee",
                "Navajo",
                "Sioux",
                "Chippewa",
                "Choctaw",
                "Pueblo",
                "Apache",
                "Iroquois",
                "Creek",
                "Blackfeet",
                "Seminole",
                "Cheyenne",
                "Arawak",
                "Shawnee",
                "Mohegan",
                "Huron",
                "Oneida",
                "Lakota",
                "Crow",
                "Teton",
                "Hopi",
                "Inuit"
            ],
            requiredAnswers: 1
        ),
        // Q88
        CivicsQuestion(
            question: "Name one of the two longest rivers in the United States.",
            translatedQuestion: "Nombra uno de los dos ríos más largos de los Estados Unidos.",
            answers: [
                "Missouri (River)",
                "Mississippi (River)"
            ],
            translatedAnswers: [
                "Misuri (río)",
                "Mississippi (río)"
            ],
            requiredAnswers: 1
        ),
        // Q89
        CivicsQuestion(
            question: "What ocean is on the West Coast of the United States?",
            translatedQuestion: "¿Qué océano hay en la costa oeste de los Estados Unidos?",
            answers: ["Pacific (Ocean)"],
            translatedAnswers: ["Océano Pacífico"],
            requiredAnswers: 1
        ),
        // Q90
        CivicsQuestion(
            question: "What ocean is on the East Coast of the United States?",
            translatedQuestion: "¿Qué océano hay en la costa este de los Estados Unidos?",
            answers: ["Atlantic (Ocean)"],
            translatedAnswers: ["Océano Atlántico"],
            requiredAnswers: 1
        ),
        // Q91
        CivicsQuestion(
            question: "Name one U.S. territory.",
            translatedQuestion: "Nombra un territorio de los EE. UU.",
            answers: [
                "Puerto Rico",
                "U.S. Virgin Islands",
                "American Samoa",
                "Northern Mariana Islands",
                "Guam"
            ],
            translatedAnswers: [
                "Puerto Rico",
                "Islas Vírgenes de los Estados Unidos",
                "Samoa Americana",
                "Islas Marianas del Norte",
                "Guam"
            ],
            requiredAnswers: 1
        ),
        // Q92
        CivicsQuestion(
            question: "Name one state that borders Canada.",
            translatedQuestion: "Nombra un estado que tenga frontera con Canadá.",
            answers: [
                "Maine",
                "New Hampshire",
                "Vermont",
                "New York",
                "Pennsylvania",
                "Ohio",
                "Michigan",
                "Minnesota",
                "North Dakota",
                "Montana",
                "Idaho",
                "Washington",
                "Alaska"
            ],
            translatedAnswers: [
                "Maine",
                "Nueva Hampshire",
                "Vermont",
                "Nueva York",
                "Pensilvania",
                "Ohio",
                "Michigan",
                "Minnesota",
                "Dakota del Norte",
                "Montana",
                "Idaho",
                "Washington",
                "Alaska"
            ],
            requiredAnswers: 1
        ),
        // Q93
        CivicsQuestion(
            question: "Name one state that borders Mexico.",
            translatedQuestion: "Nombra un estado que tenga frontera con México.",
            answers: [
                "California",
                "Arizona",
                "New Mexico",
                "Texas"
            ],
            translatedAnswers: [
                "California",
                "Arizona",
                "Nuevo Méjico",
                "Texas"
            ],
            requiredAnswers: 1
        ),
        // Q94
        CivicsQuestion(
            question: "What is the capital of the United States?",
            translatedQuestion: "¿Cuál es la capital de los Estados Unidos?",
            answers: ["Washington, D.C."],
            translatedAnswers: ["Washington, D.C."],
            requiredAnswers: 1
        ),
        // Q95
        CivicsQuestion(
            question: "Where is the Statue of Liberty?",
            translatedQuestion: "¿Dónde está la Estatua de la Libertad?",
            answers: [
                "New York (Harbor)",
                "Liberty Island"
            ],
            translatedAnswers: [
                "Nueva York (Puerto)",
                "Isla de la Libertad"
            ],
            requiredAnswers: 1
        ),
        // Q96
        CivicsQuestion(
            question: "Why does the flag have 13 stripes?",
            translatedQuestion: "¿Por qué la bandera tiene 13 franjas?",
            answers: [
                "because there were 13 original colonies",
                "because the stripes represent the original colonies"
            ],
            translatedAnswers: [
                "porque había 13 colonias originales",
                "porque las rayas representan las colonias originales"
            ],
            requiredAnswers: 1
        ),
        // Q97
        CivicsQuestion(
            question: "Why does the flag have 50 stars?",
            translatedQuestion: "¿Por qué la bandera tiene 50 estrellas?",
            answers: [
                "because there is one star for each state",
                "because each star represents a state",
                "because there are 50 states"
            ],
            translatedAnswers: [
                "porque hay una estrella para cada estado",
                "porque cada estrella representa un estado",
                "porque hay 50 estados"
            ],
            requiredAnswers: 1
        ),
        // Q98
        CivicsQuestion(
            question: "What is the name of the national anthem?",
            translatedQuestion: "¿Cómo se llama el himno nacional?",
            answers: ["The Star-Spangled Banner"],
            translatedAnswers: ["El estandarte estrellado"],
            requiredAnswers: 1
        ),
        // Q99
        CivicsQuestion(
            question: "When do we celebrate Independence Day?",
            translatedQuestion: "¿Cuándo celebramos el Día de la Independencia?",
            answers: ["July 4"],
            translatedAnswers: ["4 de Julio"],
            requiredAnswers: 1
        ),
        // Q100
        CivicsQuestion(
            question: "Name two national U.S. holidays.",
            translatedQuestion: "Nombra dos días festivos nacionales de Estados Unidos.",
            answers: [
                "Christmas",
                "Martin Luther King Jr. Day",
                "Presidents' Day",
                "Memorial Day",
                "Independence Day",
                "Labor Day",
                "Columbus Day",
                "Veterans Day",
                "Thanksgiving",
                "New Year's Day"
            ],
            translatedAnswers: [
                "Navidad",
                "Día de Martin Luther King Jr.",
                "Día de los Presidentes",
                "Día de los Caídos",
                "Día de la Independencia",
                "Día laboral",
                "Día de la Raza",
                "Día de los Veteranos",
                "Acción de gracias",
                "Día de Año Nuevo"
            ],
            requiredAnswers: 2
        ),
    ]
}
