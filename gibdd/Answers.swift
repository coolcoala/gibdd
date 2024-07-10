//
//  Answers.swift
//  gibdd
//
//  Created by Sova on 09.07.2024.
//


import SwiftUI

//MARK: - Answers struct
struct Answers: Codable, Identifiable {
    let title, ticketNumber, ticketCategory, image: String
    let question: String
    let answers: [Answer]
    let correctAnswer, answerTip: String
    let topic: [String]
    let id: String

    enum CodingKeys: String, CodingKey {
        case title
        case ticketNumber = "ticket_number"
        case ticketCategory = "ticket_category"
        case image, question, answers
        case correctAnswer = "correct_answer"
        case answerTip = "answer_tip"
        case topic, id
    }
}

// MARK: - Answer
struct Answer: Codable, Identifiable {
    let id = UUID()
    
    let answerText: String
    let isCorrect: Bool

    enum CodingKeys: String, CodingKey {
        case answerText = "answer_text"
        case isCorrect = "is_correct"
    }
}
