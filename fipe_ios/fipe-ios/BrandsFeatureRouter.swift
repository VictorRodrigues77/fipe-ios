//
//  BrandsFeatureRouter.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation

class BrandsFeatureRouter: Routing {
    
    private let builder: ModelsFeatureBuilder
    
    init(builder: ModelsFeatureBuilder) {
        self.builder = builder
    }
    
    func showModels(model: FipeAPIModel) {
        let modelsBuilder = builder.build(model: model)
        guard let controller = topNavController else { return }
        controller.pushViewController(modelsBuilder, animated: true)
        isRouting = true
    }
    
}
