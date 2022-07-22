//
//  InfoFeatureBuilder.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 17/07/22.
//

import Foundation
import UIKit

class InfoFeatureBuilder: BaseBuilder {
    func build(model: FipeAPIModel) -> UIViewController {
        let service = FipeAPIManager()
        let viewModel = InfoFeatureViewModel(
            service: service,
            model: model
        )
        let storyboard = UIStoryboard(name: "InfoFeature", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "InfoFeatureController") as! InfoFeatureController
        controller.viewModel = viewModel
        isBuilding = true
        return controller
    }
}
