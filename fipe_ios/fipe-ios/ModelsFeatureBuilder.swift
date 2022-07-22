//
//  ModelsFeatureBuilder.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation
import UIKit

class ModelsFeatureBuilder: BaseBuilder {
    func build(model: FipeAPIModel) -> UIViewController {
        let router = ModelsFeatureRouter(
            builder: YearsFeatureBuilder()
        )
        let service = FipeAPIManager()
        let viewModel = ModelsFeatureViewModel(
            service: service,
            model: model
        )
        let storyboard = UIStoryboard(name: "ModelsFeature", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ModelsFeatureController") as! ModelsFeatureController
        controller.viewModel = viewModel
        controller.router = router
        isBuilding = true
        return controller
    }
}
