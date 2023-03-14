//
//  Staff.swift
//  GithubStaffs
//
//  Created by TuanNVA on 14/03/2023.
//

import Foundation

struct Staff: Codable {
    var login: String?
    var id: Int?
    var avatarURL: String?
    var siteAdmin: Bool?
    var name: String?
    var blog, location: String?
    var bio: String?

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case siteAdmin = "site_admin"
        case name, blog, location, bio
    }
}
