//
//  UserDetail.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//
import Foundation

struct UserDetail: Codable {
    let userId: Int
    let name: String
    let email: String
    let phone: String
    let address: String
    let city: String
}
