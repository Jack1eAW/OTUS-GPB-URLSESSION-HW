//
//  Model.swift
//  OTUS-GPB-URLSESSION-HW
//
//  Created by Aleksandr Chebotarev on 12/22/22.
//

import Foundation

// MARK: - Companies
struct Model: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let name, number: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name, skills
        case number = "phone_number"
    }
}
