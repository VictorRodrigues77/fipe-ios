// 
//  TypeFeatureViewModel.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation

struct TypeModel: Equatable {
    let title: String
    let code: String
}

class TypeFeatureViewModel {
    
    var types: [TypeModel]?
    
    var onSuccessFetch: (() -> Void)?
    
    func fetchTypes() {
        self.types = [
            TypeModel(title: "Carros", code: "carros"),
            TypeModel(title: "Motos", code: "motos"),
            TypeModel(title: "Caminhões", code: "caminhoes")
        ]
        self.onSuccessFetch?()
    }
    
    var numberOfRowsInSection: Int {
        return types?.count ?? 0
    }
    
    func cellForRowAt(at index: Int) -> TypeModel? {
        guard let type = types?[index] else { return nil }
        return type
    }
    
    func didSelectRowAt(at index: Int) -> FipeAPIModel? {
        guard let type = types?[index] else { return nil }
        return FipeAPIModel(type: type.code)
    }
    
}
