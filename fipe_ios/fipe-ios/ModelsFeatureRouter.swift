//
//  ModelsFeatureRouter.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation

class ModelsFeatureRouter: Routing {
    
    private let builder: YearsFeatureBuilder
    
    init(builder: YearsFeatureBuilder) {
        self.builder = builder
    }
    
    func showYears(model: FipeAPIModel) {
        let yearsBuilder = builder.build(model: model)
        guard let controller = topNavController else { return }
        controller.pushViewController(yearsBuilder, animated: true)
        isRouting = true
    }
    
}
