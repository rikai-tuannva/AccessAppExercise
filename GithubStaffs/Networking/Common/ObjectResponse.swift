//
//  ObjectResponse.swift
//  BaseProject
//
//  Created by TuanNVA on 20/07/2021.
//

import Foundation

class ObjectResponse<T: Codable>: Codable {
    let status: Bool
    let mess: String?
    let data: T?

    init(status: Bool, mess: String, data: T) {
        self.status = status
        self.mess = mess
        self.data = data
    }
}
