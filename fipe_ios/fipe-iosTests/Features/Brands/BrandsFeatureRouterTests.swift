//
//  BrandsFeatureRouterTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class BrandsFeatureRouterTests: XCTestCase {

    private var builder: ModelsFeatureBuilder?
    private var router: BrandsFeatureRouter?

    override func setUp() {
        super.setUp()
        
        builder = ModelsFeatureBuilder()
        router = BrandsFeatureRouter(
            builder: builder!
        )
    }
    
    func test_isRouting_true() {
        let model = FipeAPIModel(type: "carros", brandCode: "1")
        
        router?.showModels(model: model)
        
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
