//
//  FipeAPIManagerMock.swift
//  fipe-iosTests
//
//  Created by Victor Rodrigues on 18/07/22.
//

import Foundation
@testable import fipe_ios

final class FipeAPIManagerMock: FipeAPIManagerProtocol {
    
    var isError: Bool = false
    var isSuccess: Bool = false
    
    func fetchCarByBrand(model: FipeAPIModel, completion: @escaping (Result<ResponseBrands, Error>) -> ()) {
        if isError {
            let error = NSError(domain: "erro", code: 1, userInfo: nil)
            completion(.failure(error))
            return
        }
        if isSuccess {
            let brands = [
                Marca(nome: "1", codigo: "1"),
                Marca(nome: "2", codigo: "2")
            ]
            completion(.success(brands))
            return
        }
    }
    
    func fetchCarByModel(model: FipeAPIModel, completion: @escaping (Result<ResponseModels, Error>) -> ()) {
        if isError {
            let error = NSError(domain: "erro", code: 1, userInfo: nil)
            completion(.failure(error))
            return
        }
        if isSuccess {
            let models = ResponseModels(
                modelos: [
                    ResponseModels.Modelo(nome: "1", codigo: 1),
                    ResponseModels.Modelo(nome: "2", codigo: 2)
                ],
                anos: [
                    ResponseModels.Ano(nome: "1", codigo: "1"),
                    ResponseModels.Ano(nome: "2", codigo: "2")
                ]
            )
            completion(.success(models))
            return
        }
    }
    
    func fetchCarByYear(model: FipeAPIModel, completion: @escaping (Result<ResponseYears, Error>) -> ()) {
        if isError {
            let error = NSError(domain: "erro", code: 1, userInfo: nil)
            completion(.failure(error))
            return
        }
        if isSuccess {
            let years = [
                Ano(nome: "1", codigo: "1"),
                Ano(nome: "2", codigo: "2")
            ]
            completion(.success(years))
            return
        }
    }
    
    func fetchCarInfo(model: FipeAPIModel, completion: @escaping (Result<ResponseInfo, Error>) -> ()) {
        if isError {
            let error = NSError(domain: "erro", code: 1, userInfo: nil)
            completion(.failure(error))
            return
        }
        if isSuccess {
            let info = ResponseInfo(
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
            completion(.success(info))
            return
        }
    }
    
}
