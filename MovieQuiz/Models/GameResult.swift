//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 21.09.2024.
//

import Foundation

struct GameResult: Codable {
    var correct: Int
    var total: Int
    var date: Date
    
    func isBetterThan(_ another: GameResult) -> Bool {
        return correct > another.correct
    }
}
