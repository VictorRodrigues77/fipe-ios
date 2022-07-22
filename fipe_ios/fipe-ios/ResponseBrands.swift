//
//  ResponseBrands.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 14/07/22.
//

import Foundation

typealias ResponseBrands = [Marca]

struct Marca: Codable, Equatable {
    let nome: String
    let codigo: String
}
