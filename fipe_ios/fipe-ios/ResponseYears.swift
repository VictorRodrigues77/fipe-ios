//
//  ResponseYears.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 14/07/22.
//

import Foundation

typealias ResponseYears = [Ano]

struct Ano: Codable, Equatable {
    let nome: String
    let codigo: String
}
