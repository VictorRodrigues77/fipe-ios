//
//  BrandsFeatureBuilder.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation
import UIKit

class BrandsFeatureBuilder: BaseBuilder {
    func build(model: FipeAPIModel) -> UIViewController {
        let router = BrandsFeatureRouter(
            builder: ModelsFeatureBuilder()
        )
        let service = FipeAPIManager()
        let viewModel = BrandsFeatureViewModel(
            service: service,
            model: model
        )
        let storyboard = UIStoryboard(name: "BrandsFeature", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BrandsFeatureController") as! BrandsFeatureController
        controller.viewModel = viewModel
        controller.router = router
        isBuilding = true
        return controller
    }
}
