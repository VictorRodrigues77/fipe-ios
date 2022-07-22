//
//  TypeFeatureRouter.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation

class TypeFeatureRouter: Routing {
    
    private let builder: BrandsFeatureBuilder
    
    init(builder: BrandsFeatureBuilder) {
        self.builder = BrandsFeatureBuilder()
    }
    
    func showBrands(model: FipeAPIModel) {
        let brandsBuilder = builder.build(model: model)
        guard let controller = topNavController else { return }
        controller.pushViewController(brandsBuilder, animated: true)
        isRouting = true
    }
    
}
