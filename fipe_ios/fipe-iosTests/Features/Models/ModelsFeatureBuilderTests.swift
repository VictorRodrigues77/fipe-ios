//
//  ModelsFeatureBuilderTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class ModelsFeatureBuilderTests: XCTestCase {

    private var builder: ModelsFeatureBuilder?

    override func setUp() {
        super.setUp()
        
        builder = ModelsFeatureBuilder()
    }
    
    func test_isBuilding_true() {
        let _ = builder?.build(model: FipeAPIModel(type: "carros", brandCode: "1"))
        
        XCTAssertEqual(builder?.isBuilding, true)
    }
    
    func test_isBuilding_false() {
        XCTAssertEqual(builder?.isBuilding, false)
    }
    
    override func tearDown() {
        builder = nil
        super.tearDown()
    }

}
