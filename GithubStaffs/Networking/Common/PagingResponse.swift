//
//  PagingResponse.swift
//  BaseProject
//
//  Created by TuanNVA on 26/01/2022.
//

import Foundation

class PagingResponse<T: Codable>: Codable {
    let status: Bool
    let mess: String?
    let data: Paging<T>?

    init(status: Bool, mess: String, data: Paging<T>) {
        self.status = status
        self.mess = mess
        self.data = data
    }
}

class Paging<T: Codable>: Codable {
    let currentPage: Int
    let pageSize: Int
    let totalRecord: Int
    let results: [T]?

    init(currentPage: Int, pageSize: Int, totalRecord: Int, results: [T]) {
        self.currentPage = currentPage
        self.pageSize = pageSize
        self.totalRecord = totalRecord
        self.results = results
    }
}
