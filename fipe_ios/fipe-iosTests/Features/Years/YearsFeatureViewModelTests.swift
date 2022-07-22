//
//  YearsFeatureViewModelTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class YearsFeatureViewModelTests: XCTestCase {

    private var viewModel: YearsFeatureViewModel?
    private var service: FipeAPIManagerMock?

    override func setUp() {
        super.setUp()
        
        service = FipeAPIManagerMock()
        viewModel = YearsFeatureViewModel(
            service: service!,
            model: Mock.model
        )
    }
    
    func test_fetchModels() {
        let value = Mock.years
        
        service?.isSuccess = true
        viewModel?.fetchYears()
        
        XCTAssertEqual(viewModel?.response, value)
    }
    
    func test_fetchModels_nil() {
        let value: [Ano]? = nil
        
        service?.isError = true
        viewModel?.fetchYears()
        
        XCTAssertEqual(viewModel?.response, value)
    }
    
    func test_numberOfRowsInSection() {
        let value = Mock.years.count
        
        service?.isSuccess = true
        viewModel?.fetchYears()
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_numberOfRowsInSection_nil() {
        let value = 0
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_cellForRowAt() {
        let value = Mock.years[0]
        
        service?.isSuccess = true
        viewModel?.fetchYears()
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_cellForRowAt_nil() {
        let value: Ano? = nil
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_didSelectRowAt() {
        let value = FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1", yearCode: "1")
        
        service?.isSuccess = true
        viewModel?.fetchYears()
        
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

extension YearsFeatureViewModelTests {
    enum Mock {
        static let model = FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1")
        static let years = [
            Ano(nome: "1", codigo: "1"),
            Ano(nome: "2", codigo: "2")
        ]
    }
}
