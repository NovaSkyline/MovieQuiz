//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 21.09.2024.
//

import Foundation

protocol StatisticService {
    func store(correct count: Int, total amount: Int)
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
}


final class StatisticServiceImplementation: StatisticService {
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    
    var totalAccuracy: Double {
        get {
            userDefaults.double(forKey: Keys.total.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    
    var gamesCount: Int {
        get {
            return userDefaults.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let record = try? JSONDecoder().decode(GameResult.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return record
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    func store(correct count: Int, total amount: Int) {
        let newRecord = GameResult(correct: count, total: amount, date: Date())
        if newRecord.isBetterThan(bestGame) {
            bestGame = newRecord
        }
        gamesCount += 1
        totalAccuracy = (totalAccuracy + Double(count)) / (Double(amount))
    }
}
