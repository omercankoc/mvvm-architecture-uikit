//
//  CountryModel.swift
//  MVVMUIKit
//
//  Created by Ömer Can Koç on 11.01.2023.
//

import Foundation

struct CountryModel : Decodable {
    var code : Int?
    var alphaCode : String?
    var betaCode : String?
    var shortName : String?
    var nationality: String?
    
    init(code: Int, alphaCode: String, betaCode: String, shortName: String, nationality: String) {
        self.code = code
        self.alphaCode = alphaCode
        self.betaCode = betaCode
        self.shortName = shortName
        self.nationality = nationality
    }
    
    enum CodingKeys: String, CodingKey {
        case code = "num_code"
        case alphaCode = "alpha_2_code"
        case betaCode = "alpha_3_code"
        case shortName = "en_short_name"
        case nationality = "nationality"
    }
}
