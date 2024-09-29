//
//  AlertPresenter 2.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 21.09.2024.
//


import UIKit

final class AlertPresenter: AlertPresenterProtocol {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func showAlert(alertModel: AlertModel) {
        let alert = UIAlertController(
            title: alertModel.title,
            message: alertModel.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.completion?()
        }
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
}
