//
//  ResponseInfo.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 14/07/22.
//

import Foundation

struct ResponseInfo: Codable, Equatable {
    let valor: String
    let marca: String
    let modelo: String
    let anoModelo: Int
    let combustivel: String
    let codigoFipe: String
    let mesReferencia: String
    let tipoVeiculo: Int
    let siglaCombustivel: String

    enum CodingKeys: String, CodingKey {
        case valor = "Valor"
        case marca = "Marca"
        case modelo = "Modelo"
        case anoModelo = "AnoModelo"
        case combustivel = "Combustivel"
        case codigoFipe = "CodigoFipe"
        case mesReferencia = "MesReferencia"
        case tipoVeiculo = "TipoVeiculo"
        case siglaCombustivel = "SiglaCombustivel"
    }
}
