//
//  EditResponse.swift
//  RydeContactApp
//
//  Created by Vaisakh on 5/9/22.
//

import Foundation

struct AddResponse: Codable {
    let name: String
    let first_name: String?
    let last_name: String?
    let id : String?
    let createdAt : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case first_name = "first_name"
        case last_name = "last_name"
        case id = "id"
        case createdAt = "createdAt"
    }
}
