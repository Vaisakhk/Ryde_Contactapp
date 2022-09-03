//
//  ContactList.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

struct ContactList: Codable {
    let page: Int
    let perPage: Int
    let total : Int
    let totalPage : Int
    let data: [ContactResult]

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPage = "total_pages"
        case data = "data"
    }
}

// MARK: - Result
struct ContactResult: Codable {
    let id : Int
    let email, firstName, lastName, avatar: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}

