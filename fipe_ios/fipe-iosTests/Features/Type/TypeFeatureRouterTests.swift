//
//  TypeFeatureRouterTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class TypeFeatureRouterTests: XCTestCase {

    private var builder: BrandsFeatureBuilder?
    private var router: TypeFeatureRouter?

    override func setUp() {
        super.setUp()
        
        builder = BrandsFeatureBuilder()
        router = TypeFeatureRouter(
            builder: builder!
        )
    }
    
    func test_isRouting_true() {
        let model = FipeAPIModel(type: "carros")
        
        router?.showBrands(model: model)
        
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
