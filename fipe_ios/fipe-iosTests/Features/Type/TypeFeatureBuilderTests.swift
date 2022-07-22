//
//  TypeFeatureBuilderTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class TypeFeatureBuilderTests: XCTestCase {

    private var builder: TypeFeatureBuilder?

    override func setUp() {
        super.setUp()
        
        builder = TypeFeatureBuilder()
    }
    
    func test_isBuilding_true() {
        let _ = builder?.build()
        
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
