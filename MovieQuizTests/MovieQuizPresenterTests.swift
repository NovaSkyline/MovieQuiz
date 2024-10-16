//
//  Untitled.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 14.10.2024.
//

import Foundation
import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
   
    var isAnswerButtonsEnabled: Bool = true
    var didShowQuizStep: QuizStepViewModel?
    var didShowQuizResults: QuizResultsViewModel?
    var didHighlightImageBorder: Bool?
    var didShowLoading: Bool = false
    var didHideLoading: Bool = false
    var didShowNetworkError: String?
    
    func show(quiz step: QuizStepViewModel) {
        didShowQuizStep = step
    }
    
    func show(quiz result: QuizResultsViewModel) {
        didShowQuizResults = result
    }
    
    func showAlert(alert: UIAlertController) {
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        didHighlightImageBorder = isCorrectAnswer
    }
    
    func showLoadingIndicator() {
        didShowLoading = true
    }
    
    func hideLoadingIndicator() {
        didHideLoading = true
    }
    
    func showNetworkError(message: String) {
        didShowNetworkError = message
    }
    
    func makeButtons(isEnabled: Bool) {
        isAnswerButtonsEnabled = true
        isAnswerButtonsEnabled = false
        }
}


final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
