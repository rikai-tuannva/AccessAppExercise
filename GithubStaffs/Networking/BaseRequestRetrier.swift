//
//  BaseRequestRetrier.swift
//  BaseProject
//
//  Created by TuanNVA on 20/07/2021.
//

import Alamofire
import RxSwift

//class BaseRequestRetrier: RequestRetrier {
//    private typealias RefreshCompletion = (_ succeeded: Bool, _ token: Token?) -> Void
//
//    private let lock = NSLock()
//    private var requestsToRetry: [(RetryResult) -> Void] = []
//    private var isRefreshing = false
//    private var baseURLString: String
//    private var disposeBag = DisposeBag.init()
//
//
//    init(baseURLString: String) {
//        self.baseURLString = baseURLString
//    }
//
//    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
//
//        // Prevent multiple request access this function
//        lock.lock();
//
//        // Unlock function at the end of function
//        defer {
//            lock.unlock()
//        }
//
//        // Prevent request which is not 401 using this function
//        guard let response = request.task?.response as? HTTPURLResponse,
//            response.statusCode == 401 else {
//                completion(.doNotRetry)
//                return
//        }
//
//        // Add other request which is 401 for further retry
//        requestsToRetry.append(completion)
//
//        // Prevent multiple request call for refresh token
//        if !isRefreshing {
//            isRefreshing = true
//
//            Application.shared.apiProvider
//                .refreshToken(token: "")
//                .asObservable()
//                .subscribe(onNext: { [weak self] token in
//                    guard let self = self else {
//                        return
//                    }
//                    self.isRefreshing = false
//                    AuthManager.shared.token = token
//                    self.requestsToRetry.forEach({ $0(.retryWithDelay(0)) })
//                    self.requestsToRetry.removeAll()
//
//                    }, onError: { [weak self] error in
//                        guard let self = self else {
//                            return
//                        }
//                        self.isRefreshing = false
//                        self.requestsToRetry.removeAll()
//                        Application.shared.resetCurrentUserInformation()
//                        Application.shared.presentInitialScreen(in: appDelegate.window)
//                }).disposed(by: disposeBag)
//
//        }
//    }
//
//}
//
