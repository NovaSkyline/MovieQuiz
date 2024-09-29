//
//  AlertPresenter 2.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 21.09.2024.
//

import UIKit

final class AlertPresenter: AlertPresenterProtocol {
    
    weak var delegate: AlertPresenterDelegate?
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showAlert(alertView: AlertModel) {
        let alert = UIAlertController(
            title: alertView.title,
            message: alertView.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: alertView.buttonText, style: .default) { [weak self] _ in
            alertView.completion?()
            self?.delegate?.showAlert()
        }
        
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
