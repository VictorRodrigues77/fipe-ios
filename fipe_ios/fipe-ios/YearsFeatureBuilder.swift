//
//  YearsFeatureBuilder.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 17/07/22.
//

import Foundation
import UIKit

class YearsFeatureBuilder: BaseBuilder {
    func build(model: FipeAPIModel) -> UIViewController {
        let router = YearsFeatureRouter(
            builder: InfoFeatureBuilder()
        )
        let service = FipeAPIManager()
        let viewModel = YearsFeatureViewModel(
            service: service,
            model: model
        )
        let storyboard = UIStoryboard(name: "YearsFeature", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "YearsFeatureController") as! YearsFeatureController
        controller.viewModel = viewModel
        controller.router = router
        isBuilding = true
        return controller
    }
}
