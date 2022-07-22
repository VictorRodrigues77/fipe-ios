//
//  FipeAPI.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 14/07/22.
//

import Foundation
import Moya

enum FipeAPI {
    case fetchCarByBrand(type: String)
    case fetchCarByModel(type: String, brandCode: String)
    case fetchCarByYear(type: String, brandCode: String, modelCode: String)
    case fetchCarInfo(type: String, brandCode: String, modelCode: String, yearCode: String)
}

extension FipeAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://parallelum.com.br/fipe/api/v1")!
    }
    
    var path: String {
        switch self {
        case .fetchCarByBrand(let type):
            return "/\(type)/marcas"
        case .fetchCarByModel(let type, let brandCode):
            return "/\(type)/marcas/\(brandCode)/modelos"
        case .fetchCarByYear(let type, let brandCode, let modelCode):
            return "/\(type)/marcas/\(brandCode)/modelos/\(modelCode)/anos"
        case .fetchCarInfo(let type, let brandCode, let modelCode, let yearCode):
            return "/\(type)/marcas/\(brandCode)/modelos/\(modelCode)/anos/\(yearCode)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
