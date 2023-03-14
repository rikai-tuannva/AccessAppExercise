//
//  ApiProvider.swift
//  BaseProject
//
//  Created by TuanNVA on 20/07/2021.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import Alamofire

struct ApiProvider {
    private let provider: MoyaProvider<ApiService>
    private let session: Session = {
        // @TODO: init retrier here
        // let requestRetrier = BaseRequestRetrier.init(baseURLString: "")
        let interceptor = Interceptor(
        // retriers: [requestRetrier]
        )
        
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 60
        
        return Session(
            configuration: configuration,
            startRequestsImmediately: false,
            interceptor: interceptor
        )
    }()
    
    
    
    init() {
        provider = MoyaProvider<ApiService>(
            session: session,
            plugins: [
                NetworkLoggerPlugin.init(
                    configuration: NetworkLoggerPlugin.Configuration.init(
                        formatter: .init(),
                        logOptions:[.verbose]
                    )
                ),
                AccessTokenPlugin { _ -> String in
                    return "Bearer \(Configs.Network.token)"
                }
            ]
        )
    }
    
    func getStaffs(since: Int, limit: Int) -> Single<[Staff]> {
        return provider.rx.request(.getStaffs(since: since, limit: limit))
            .filterSuccessfulStatusCodes()
            .flatMap{
                let decoder =  JSONDecoder()
                return Single.just(try decoder.decode([Staff].self, from: $0.data))
            }
    }
    
    func getDetailStaff(username: String) -> Single<Staff> {
        return provider.rx.request(.getDetailStaff(username: username))
            .filterSuccessfulStatusCodes()
            .flatMap{
                let decoder =  JSONDecoder()
                return Single.just(try decoder.decode(Staff.self, from: $0.data))
            }
    }
}
