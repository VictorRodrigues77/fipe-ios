//
//  ModelsFeatureRouterTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class ModelsFeatureRouterTests: XCTestCase {

    private var builder: YearsFeatureBuilder?
    private var router: ModelsFeatureRouter?

    override func setUp() {
        super.setUp()
        
        builder = YearsFeatureBuilder()
        router = ModelsFeatureRouter(
            builder: builder!
        )
    }
    
    func test_isRouting_true() {
        let model = FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1")
        
        router?.showYears(model: model)
        
        XCTAssertEqual(router?.isRouting, true)
    }
    
    func test_isRouting_false() {
        XCTAssertEqual(router?.isRouting, false)
    }
    
    override func tearDown() {
        builder = nil
        router = nil
        super.tearDown()
    }

}
