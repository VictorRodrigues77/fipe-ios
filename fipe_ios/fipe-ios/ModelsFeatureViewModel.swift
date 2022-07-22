//
//  ModelsFeatureViewModel.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation

class ModelsFeatureViewModel {
    
    var response: ResponseModels?
    private let service: FipeAPIManagerProtocol
    private let model: FipeAPIModel
    
    var onShowLoading: (() -> Void)?
    var onHideLoading: (() -> Void)?
    var onSuccessFetch: (() -> Void)?
    var onFailureFetch: ((Error) -> Void)?
    
    init(service: FipeAPIManagerProtocol,
         model: FipeAPIModel) {
        
        self.service = service
        self.model = model
    }
    
    func fetchModels() {
        self.onShowLoading?()
        self.service.fetchCarByModel(model: model) { [weak self] result in
            switch result {
            case .success(let response):
                self?.response = response
                self?.onSuccessFetch?()
                self?.onHideLoading?()
            case .failure(let error):
                self?.onFailureFetch?(error)
                self?.onHideLoading?()
            }
        }
    }
    
    var numberOfRowsInSection: Int {
        return response?.modelos.count ?? 0
    }
    
    func cellForRowAt(at index: Int) -> ResponseModels.Modelo? {
        guard let model = response?.modelos[index] else { return nil }
        return model
    }
    
    func didSelectRowAt(at index: Int) -> FipeAPIModel? {
        guard let modelResponse = response?.modelos[index] else { return nil }
        return FipeAPIModel(type: model.type, brandCode: model.brandCode, modelCode: "\(modelResponse.codigo)")
    }
    
}
