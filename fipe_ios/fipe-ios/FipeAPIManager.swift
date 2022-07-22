//
//  FipeAPIManager.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 14/07/22.
//

import Foundation
import Moya

protocol FipeAPIManagerProtocol {
    func fetchCarByBrand(model: FipeAPIModel, completion: @escaping (Result<ResponseBrands, Error>) -> ())
    func fetchCarByModel(model: FipeAPIModel, completion: @escaping (Result<ResponseModels, Error>) -> ())
    func fetchCarByYear(model: FipeAPIModel, completion: @escaping (Result<ResponseYears, Error>) -> ())
    func fetchCarInfo(model: FipeAPIModel, completion: @escaping (Result<ResponseInfo, Error>) -> ())
}

final class FipeAPIManager: FipeAPIManagerProtocol {
    private let provider = MoyaProvider<FipeAPI>()
    
    func fetchCarByBrand(model: FipeAPIModel, completion: @escaping (Result<ResponseBrands, Error>) -> ()) {
        request(
            target: .fetchCarByBrand(
                type: model.type
            ),
            completion: completion
        )
    }
    
    func fetchCarByModel(model: FipeAPIModel, completion: @escaping (Result<ResponseModels, Error>) -> ()) {
        request(
            target: .fetchCarByModel(
                type: model.type,
                brandCode: model.brandCode
            ),
            completion: completion
        )
    }
    
    func fetchCarByYear(model: FipeAPIModel, completion: @escaping (Result<ResponseYears, Error>) -> ()) {
        request(
            target: .fetchCarByYear(
                type: model.type,
                brandCode: model.brandCode,
                modelCode: model.modelCode
            ),
            completion: completion
        )
    }
    
    func fetchCarInfo(model: FipeAPIModel, completion: @escaping (Result<ResponseInfo, Error>) -> ()) {
        request(
            target: .fetchCarInfo(
                type: model.type,
                brandCode: model.brandCode,
                modelCode: model.modelCode,
                yearCode: model.yearCode
            ),
            completion: completion
        )
    }
}

private extension FipeAPIManager {
    private func request<T: Decodable>(target: FipeAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
