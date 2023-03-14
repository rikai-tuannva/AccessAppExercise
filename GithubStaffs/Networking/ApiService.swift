//
//  ApiService.swift
//  BaseProject
//
//  Created by TuanNVA on 20/07/2021.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import Alamofire

enum ApiService {
    case getStaffs(since: Int, limit: Int)
    case getDetailStaff(username: String)
}

extension ApiService: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL {
        return URL(string: Configs.Network.apiBaseUrl)!
    }
    
    var path: String {
        switch self {
        case .getStaffs:
            return "/users"
        case .getDetailStaff(let username):
            return "/users/\(username)"
        }
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String : Any] {
        var params: [String: Any] = [:]
        switch self {
        case .getStaffs(let since, let limit):
            params["per_page"] = limit
            params["since"] = since
        default:
            break
        }
        
        return params
    }
    
    var task: Task {
        switch self {
        case .getStaffs:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        default:
            return .requestPlain
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var authorizationType: AuthorizationType? {
        return .custom("")
    }
}
