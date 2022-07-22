//
//  FipeAPIManagerTests.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import XCTest
@testable import fipe_ios

class FipeAPIManagerTests: XCTestCase {
    
    private var service: FipeAPIManagerMock?
    private var model: FipeAPIModel?

    override func setUp() {
        super.setUp()
        
        model = FipeAPIModel(type: "carros", brandCode: "1", modelCode: "1", yearCode: "1")
        service = FipeAPIManagerMock()
    }
    
    func test_fetchCarByBrand_success() {
        service?.isSuccess = true
        service?.fetchCarByBrand(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response, [
                    Marca(nome: "1", codigo: "1"),
                    Marca(nome: "2", codigo: "2")
                ])
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }
    
    func test_fetchCarByBrand_error() {
        service?.isError = true
        service?.fetchCarByBrand(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertNil(response)
            case .failure(let error):
                XCTAssertEqual(error as NSError, NSError(domain: "erro", code: 1, userInfo: nil))
            }
        })
    }
    
    func test_fetchCarByModel_success() {
        service?.isSuccess = true
        service?.fetchCarByModel(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response, ResponseModels(
                    modelos: [
                        ResponseModels.Modelo(nome: "1", codigo: 1),
                        ResponseModels.Modelo(nome: "2", codigo: 2)
                    ],
                    anos: [
                        ResponseModels.Ano(nome: "1", codigo: "1"),
                        ResponseModels.Ano(nome: "2", codigo: "2")
                    ]
                ))
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }
    
    func test_fetchCarByModel_error() {
        service?.isError = true
        service?.fetchCarByModel(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertNil(response)
            case .failure(let error):
                XCTAssertEqual(error as NSError, NSError(domain: "erro", code: 1, userInfo: nil))
            }
        })
    }
    
    func test_fetchCarByYear_success() {
        service?.isSuccess = true
        service?.fetchCarByYear(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response, [
                    Ano(nome: "1", codigo: "1"),
                    Ano(nome: "2", codigo: "2")
                ])
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }
    
    func test_fetchCarByYear_error() {
        service?.isError = true
        service?.fetchCarByYear(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertNil(response)
            case .failure(let error):
                XCTAssertEqual(error as NSError, NSError(domain: "erro", code: 1, userInfo: nil))
            }
        })
    }
    
    func test_fetchCarInfo_success() {
        service?.isSuccess = true
        service?.fetchCarInfo(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response, ResponseInfo(
                    valor: "R$ 64.000,00",
                    marca: "VW",
                    modelo: "UP",
                    anoModelo: 2019,
                    combustivel: "Flex",
                    codigoFipe: "12345",
                    mesReferencia: "julho de 2022",
                    tipoVeiculo: 1,
                    siglaCombustivel: ""
                ))
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }
    
    func test_fetchCarInfo_error() {
        service?.isError = true
        service?.fetchCarInfo(model: model!, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertNil(response)
            case .failure(let error):
                XCTAssertEqual(error as NSError, NSError(domain: "erro", code: 1, userInfo: nil))
            }
        })
    }
    
    override func tearDown() {
        model = nil
        service = nil
        super.tearDown()
    }

}
