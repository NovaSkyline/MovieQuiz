//
//  AlertPresenter 2.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 21.09.2024.
//

import UIKit

class AlertPresenter {
    func showAlert(in vc: UIViewController, model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: model.buttonText, style: .default) { _ in
            model.completion?()
        }
        
        alert.addAction(action)
        alert.view.accessibilityIdentifier = "Alert"
        
        vc.present(alert, animated: true, completion: nil)
    }
}

