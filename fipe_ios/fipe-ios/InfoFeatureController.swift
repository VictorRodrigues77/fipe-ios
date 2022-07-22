//
//  InfoFeatureController.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 17/07/22.
//

import UIKit

class InfoFeatureController: BaseController {
    
    // MARK: - Outlets
    @IBOutlet private weak var infoValue: UILabel!
    @IBOutlet private weak var infoBrand: UILabel!
    @IBOutlet private weak var infoModel: UILabel!
    @IBOutlet private weak var infoYear: UILabel!
    @IBOutlet private weak var infoFuel: UILabel!
    @IBOutlet private weak var infoCode: UILabel!
    @IBOutlet private weak var infoMonth: UILabel!
    
    // MARK: - Properties
    var viewModel: InfoFeatureViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchInfo()
    }
    
    override func initView() {
        super.initView()
        
        initNavigation()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.onShowLoading = { [weak self] () in
            self?.showLoading()
        }
        
        viewModel.onHideLoading = { [weak self] () in
            self?.hideLoading()
        }
        
        viewModel.onSuccessFetch = { [weak self] info in
            self?.display(info: info)
        }
        
        viewModel.onFailureFetch = { [weak self] error in
            self?.showError(error.localizedDescription)
        }
    }
    
    // MARK: - Functions
    private func display(info: ResponseInfo) {
        infoValue.text = info.valor
        infoBrand.text = info.marca
        infoModel.text = info.modelo
        infoYear.text = "\(info.anoModelo)"
        infoFuel.text = info.combustivel
        infoCode.text = info.codigoFipe
        infoMonth.text = info.mesReferencia
    }
    
}

// MARK: - Init
extension InfoFeatureController {
    private func initNavigation() {
        title = "INFO"
        let backButton = UIBarButtonItem()
        backButton.title = " "
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

