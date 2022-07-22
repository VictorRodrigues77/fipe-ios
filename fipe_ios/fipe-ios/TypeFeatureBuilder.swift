//
//  TypeFeatureBuilder.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import Foundation
import UIKit

class TypeFeatureBuilder: BaseBuilder {
    func build() -> UIViewController {
        let router = TypeFeatureRouter(
            builder: BrandsFeatureBuilder()
        )
        let viewModel = TypeFeatureViewModel()
        let storyboard = UIStoryboard(name: "TypeFeature", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TypeFeatureController") as! TypeFeatureController
        controller.viewModel = viewModel
        controller.router = router
        isBuilding = true
        return controller
    }
}
