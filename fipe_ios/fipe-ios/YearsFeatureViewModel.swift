//
//  YearsFeatureViewModel.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 17/07/22.
//

import Foundation

class YearsFeatureViewModel {
    
    var response: ResponseYears?
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
    
    func fetchYears() {
        self.onShowLoading?()
        self.service.fetchCarByYear(model: model) { [weak self] result in
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
        return response?.count ?? 0
    }
    
    func cellForRowAt(at index: Int) -> Ano? {
        guard let year = response?[index] else { return nil }
        return year
    }
    
    func didSelectRowAt(at index: Int) -> FipeAPIModel? {
        guard let yearResponse = response?[index] else { return nil }
        return FipeAPIModel(type: model.type, brandCode: model.brandCode, modelCode: model.modelCode, yearCode: yearResponse.codigo)
    }
    
}

