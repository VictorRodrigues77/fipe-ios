// 
//  BrandsFeatureViewModel.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation

class BrandsFeatureViewModel {
    
    var response: ResponseBrands?
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
    
    func fetchBrands() {
        self.onShowLoading?()
        self.service.fetchCarByBrand(model: model) { [weak self] result in
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
    
    func cellForRowAt(at index: Int) -> Marca? {
        guard let brand = response?[index] else { return nil }
        return brand
    }
    
    func didSelectRowAt(at index: Int) -> FipeAPIModel? {
        guard let brandResponse = response?[index] else { return nil }
        return FipeAPIModel(type: model.type, brandCode: brandResponse.codigo)
    }
    
}
