//
//  InfoFeatureViewModelTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class InfoFeatureViewModelTests: XCTestCase {
    
    private var viewModel: InfoFeatureViewModel?
    private var service: FipeAPIManagerMock?

    override func setUp() {
        super.setUp()
        
        service = FipeAPIManagerMock()
        viewModel = InfoFeatureViewModel(
            service: service!,
            model: Mock.model
        )
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_fetchInfo() {
        let value = Mock.info
        
        service?.isSuccess = true
        viewModel?.fetchInfo()
        
        XCTAssertEqual(viewModel?.response, value)
    }
    
    func test_fetchInfo_nil() {
        let value: ResponseInfo? = nil
        
        service?.isError = true
        viewModel?.fetchInfo()
        
        XCTAssertEqual(viewModel?.response, value)
    }

}

extension InfoFeatureViewModelTests {
    enum Mock {
        static let model = FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1", yearCode: "1")
        static let info = ResponseInfo(
            valor: "R$ 64.000,00",
            marca: "VW",
            modelo: "UP",
            anoModelo: 2019,
            combustivel: "Flex",
            codigoFipe: "12345",
            mesReferencia: "julho de 2022",
            tipoVeiculo: 1,
            siglaCombustivel: ""
        )
    }
}
