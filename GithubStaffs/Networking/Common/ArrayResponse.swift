//
//  ArrayResponse.swift
//  BaseProject
//
//  Created by TuanNVA on 26/01/2022.
//

import Foundation

class ArrayResponse<T: Codable>: Codable {
    let status: Bool
    let mess: String?
    let data: [T]?

    init(status: Bool, mess: String, data: [T]) {
        self.status = status
        self.mess = mess
        self.data = data
    }
}
