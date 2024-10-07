//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 15.09.2024.
//

import Foundation

struct QuizQuestion {
    // строка с названием фильма,
    let image: Data
    // строка с вопросом о рейтинге фильма
    let text: String
    // булевое значение (true, false), правильный ответ на вопрос
    let correctAnswer: Bool
}
