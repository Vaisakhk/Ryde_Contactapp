//
//  EditResponse.swift
//  RydeContactApp
//
//  Created by Vaisakh on 5/9/22.
//

import Foundation

struct EditResponse: Codable {
    let name: String
    let job: String?
    let id : String?
    let createdAt : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case job = "job"
        case id = "id"
        case createdAt = "createdAt"
    }
}
