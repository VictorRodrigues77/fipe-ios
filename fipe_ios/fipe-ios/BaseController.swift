//
//  BaseController.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import UIKit

class BaseController: UIViewController {
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        return loadingIndicator
    }()
    
    open func initView() {}
    open func bindViewModel() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        bindViewModel()
    }
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: "Aguarde...", preferredStyle: .alert)
            alert.view.addSubview(self.loadingIndicator)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.dismiss(animated: false, completion: nil)
        }
    }

}
