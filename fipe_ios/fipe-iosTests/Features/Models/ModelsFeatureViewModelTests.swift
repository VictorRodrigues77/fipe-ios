//
//  ModelsFeatureViewModelTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class ModelsFeatureViewModelTests: XCTestCase {

    private var viewModel: ModelsFeatureViewModel?
    private var service: FipeAPIManagerMock?

    override func setUp() {
        super.setUp()
        
        service = FipeAPIManagerMock()
        viewModel = ModelsFeatureViewModel(
            service: service!,
            model: Mock.model
        )
    }
    
    func test_fetchModels() {
        let value = Mock.response
        
        service?.isSuccess = true
        viewModel?.fetchModels()
        
        XCTAssertEqual(viewModel?.response, value)
    }
    
    func test_fetchModels_nil() {
        let value: ResponseModels? = nil
        
        service?.isError = true
        viewModel?.fetchModels()
        
        XCTAssertEqual(viewModel?.response, value)
    }
    
    func test_numberOfRowsInSection() {
        let value = Mock.response.modelos.count
        
        service?.isSuccess = true
        viewModel?.fetchModels()
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_numberOfRowsInSection_nil() {
        let value = 0
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_cellForRowAt() {
        let value = Mock.response.modelos[0]
        
        service?.isSuccess = true
        viewModel?.fetchModels()
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_cellForRowAt_nil() {
        let value: ResponseModels.Modelo? = nil
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_didSelectRowAt() {
        let value = FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1")
        
        service?.isSuccess = true
        viewModel?.fetchModels()
        
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

extension ModelsFeatureViewModelTests {
    enum Mock {
        static let model = FipeAPIModel(type: "carros", brandCode: "1")
        static let response = ResponseModels(
            modelos: [
                ResponseModels.Modelo(nome: "1", codigo: 1),
                ResponseModels.Modelo(nome: "2", codigo: 2)
            ],
            anos: [
                ResponseModels.Ano(nome: "1", codigo: "1"),
                ResponseModels.Ano(nome: "2", codigo: "2")
            ]
        )
    }
}
