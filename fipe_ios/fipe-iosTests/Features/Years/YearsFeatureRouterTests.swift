//
//  YearsFeatureRouterTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class YearsFeatureRouterTests: XCTestCase {

    private var builder: InfoFeatureBuilder?
    private var router: YearsFeatureRouter?

    override func setUp() {
        super.setUp()
        
        builder = InfoFeatureBuilder()
        router = YearsFeatureRouter(
            builder: builder!
        )
    }
    
    func test_isRouting_true() {
        let model = FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1", yearCode: "1")
        
        router?.showInfo(model: model)
        
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
