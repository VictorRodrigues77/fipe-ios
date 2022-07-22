//
//  InfoFeatureBuilderTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class InfoFeatureBuilderTests: XCTestCase {

    private var builder: InfoFeatureBuilder?

    override func setUp() {
        super.setUp()
        
        builder = InfoFeatureBuilder()
    }
    
    func test_isBuilding_true() {
        let _ = builder?.build(model: FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1", yearCode: "1"))
        
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
