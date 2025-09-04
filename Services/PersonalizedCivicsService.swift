//
//  PersonalizedCivicsService.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import Foundation

struct PersonalizedCivicsService {
    static func getPersonalizedQuestions() -> [CivicsQuestion] {
        let profile = UserProfile.shared
        var questions = CivicsQuestions.questions
        
        // Update Q20: State Senators
        if let index = questions.firstIndex(where: { $0.question.contains("Who is one of your state's U.S. Senators now?") }) {
            questions[index] = CivicsQuestion(
                question: questions[index].question,
                translatedQuestion: questions[index].translatedQuestion,
                answers: profile.senators.isEmpty ? ["Answers will vary"] : [profile.senators[0]],
                translatedAnswers: profile.senators.isEmpty ? ["Las respuestas variarán"] : [profile.senators[0]],
                requiredAnswers: 1
            )
        }
        
        // Update Q23: U.S. Representative
        if let index = questions.firstIndex(where: { $0.question.contains("Name your U.S. Representative.") }) {
            questions[index] = CivicsQuestion(
                question: questions[index].question,
                translatedQuestion: questions[index].translatedQuestion,
                answers: [profile.representative],
                translatedAnswers: [profile.representative],
                requiredAnswers: 1
            )
        }
        
        // Update Q43: State Governor
        if let index = questions.firstIndex(where: { $0.question.contains("Who is the Governor of your state now?") }) {
            questions[index] = CivicsQuestion(
                question: questions[index].question,
                translatedQuestion: questions[index].translatedQuestion,
                answers: [profile.governor],
                translatedAnswers: [profile.governor],
                requiredAnswers: 1
            )
        }
        
        // Update Q44: State Capital
        if let index = questions.firstIndex(where: { $0.question.contains("What is the capital of your state?") }) {
            questions[index] = CivicsQuestion(
                question: questions[index].question,
                translatedQuestion: questions[index].translatedQuestion,
                answers: [profile.stateCapital],
                translatedAnswers: [profile.stateCapital],
                requiredAnswers: 1
            )
        }
        
        return questions
    }
} 