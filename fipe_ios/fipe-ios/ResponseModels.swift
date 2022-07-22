//
//  ResponseModels.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 14/07/22.
//

import Foundation

struct ResponseModels: Codable, Equatable {
    let modelos: [Modelo]
    let anos: [Ano]
    
    struct Modelo: Codable, Equatable {
        let nome: String
        let codigo: Int
        
        static func == (lhs: ResponseModels.Modelo, rhs: ResponseModels.Modelo) -> Bool {
            return lhs.codigo == rhs.codigo
        }
    }
    
    struct Ano: Codable, Equatable {
        let nome: String
        let codigo: String
        
        static func == (lhs: ResponseModels.Ano, rhs: ResponseModels.Ano) -> Bool {
            return lhs.codigo == rhs.codigo
        }
    }
}
