//
//  TypeFeatureViewModelTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 17/07/22.
//

import XCTest
@testable import fipe_ios

class TypeFeatureViewModelTests: XCTestCase {
    
    private var viewModel: TypeFeatureViewModel?

    override func setUp() {
        super.setUp()
        
        viewModel = TypeFeatureViewModel()
    }
    
    func test_fetchTypes() {
        let value = Mock.types
        
        viewModel?.fetchTypes()
        
        XCTAssertEqual(viewModel?.types, value)
    }
    
    func test_fetchTypes_nil() {
        let value: [TypeModel]? = nil
        
        XCTAssertEqual(viewModel?.types, value)
    }
    
    func test_numberOfRowsInSection() {
        let value = Mock.types.count
        
        viewModel?.fetchTypes()
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_numberOfRowsInSection_nil() {
        let value = 0
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_cellForRowAt() {
        let value = TypeModel(title: "Carros", code: "carros")
        
        viewModel?.fetchTypes()
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_cellForRowAt_nil() {
        let value: TypeModel? = nil
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_didSelectRowAt() {
        let value = FipeAPIModel(type: "carros")
        
        viewModel?.fetchTypes()
        
        XCTAssertEqual(viewModel?.didSelectRowAt(at: 0), value)
    }
    
    func test_didSelectRowAt_nil() {
        let value: FipeAPIModel? = nil
        
        XCTAssertEqual(viewModel?.didSelectRowAt(at: 0), value)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
}

extension TypeFeatureViewModelTests {
    enum Mock {
        static let types = [
            TypeModel(title: "Carros", code: "carros"),
            TypeModel(title: "Motos", code: "motos"),
            TypeModel(title: "Caminhões", code: "caminhoes")
        ]
    }
}
 
