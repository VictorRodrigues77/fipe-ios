//
//  YearsFeatureRouter.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 17/07/22.
//

import Foundation

class YearsFeatureRouter: Routing {
    
    private let builder: InfoFeatureBuilder
    
    init(builder: InfoFeatureBuilder) {
        self.builder = builder
    }
    
    func showInfo(model: FipeAPIModel) {
        let infoBuilder = builder.build(model: model)
        guard let controller = topNavController else { return }
        controller.pushViewController(infoBuilder, animated: true)
        isRouting = true
    }
    
}
