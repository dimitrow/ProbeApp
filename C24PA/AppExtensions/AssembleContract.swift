//
//  AssembleContract.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    
    func instantiateViewController<T>() -> T where T: ReusableView {
        
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }
}

protocol SceneSetupProtocol {
    
    func setUpScene<T>() -> T where T: ReusableView
}

extension UIViewController: ReusableView { }

extension UIViewController {
    
    func setSelfAsRoot() {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = windowScene.delegate as? SceneDelegate {
            
            let window = UIWindow(windowScene: windowScene)
            delegate.window = window
            window.rootViewController = self
            window.makeKeyAndVisible()
        }
    }
}

extension UIViewController {
    
    func showAlertView(_ title: String = "", message: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

