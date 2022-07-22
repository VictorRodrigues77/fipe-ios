//
//  BrandsFeatureViewModelTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class BrandsFeatureViewModelTests: XCTestCase {

    private var viewModel: BrandsFeatureViewModel?
    private var service: FipeAPIManagerMock?

    override func setUp() {
        super.setUp()
        
        service = FipeAPIManagerMock()
        viewModel = BrandsFeatureViewModel(
            service: service!,
            model: Mock.model
        )
    }
    
    func test_fetchBrands() {
        let value = Mock.brands
        
        service?.isSuccess = true
        viewModel?.fetchBrands()
        
        XCTAssertEqual(viewModel?.response, value)
    }
    
    func test_fetchBrands_nil() {
        let value: [Marca]? = nil
        
        service?.isError = true
        viewModel?.fetchBrands()
        
        XCTAssertEqual(viewModel?.response, value)
    }
    
    func test_numberOfRowsInSection() {
        let value = Mock.brands.count
        
        service?.isSuccess = true
        viewModel?.fetchBrands()
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_numberOfRowsInSection_nil() {
        let value = 0
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_cellForRowAt() {
        let value = Mock.brands[0]
        
        service?.isSuccess = true
        viewModel?.fetchBrands()
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_cellForRowAt_nil() {
        let value: Marca? = nil
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_didSelectRowAt() {
        let value = FipeAPIModel(type: "carros", brandCode: "1")
        
        service?.isSuccess = true
        viewModel?.fetchBrands()
        
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

extension BrandsFeatureViewModelTests {
    enum Mock {
        static let model = FipeAPIModel(type: "carros")
        static let brands = [
            Marca(nome: "1", codigo: "1"),
            Marca(nome: "2", codigo: "2")
        ]
    }
}
