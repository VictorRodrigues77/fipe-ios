//
//  InfoFeatureViewModel.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 17/07/22.
//

import Foundation

class InfoFeatureViewModel {
    
    var response: ResponseInfo?
    private let service: FipeAPIManagerProtocol
    private let model: FipeAPIModel
    
    var onShowLoading: (() -> Void)?
    var onHideLoading: (() -> Void)?
    var onSuccessFetch: ((ResponseInfo) -> Void)?
    var onFailureFetch: ((Error) -> Void)?
    
    init(service: FipeAPIManagerProtocol,
         model: FipeAPIModel) {
        
        self.service = service
        self.model = model
    }
    
    func fetchInfo() {
        self.onShowLoading?()
        self.service.fetchCarInfo(model: model) { [weak self] result in
            switch result {
            case .success(let response):
                self?.response = response
                self?.onSuccessFetch?(response)
                self?.onHideLoading?()
            case .failure(let error):
                self?.onFailureFetch?(error)
                self?.onHideLoading?()
            }
        }
    }
    
}

