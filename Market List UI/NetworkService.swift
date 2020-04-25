//
//  NetworkSerive.swift
//  abseil
//
//  Created by Arsalan Iravani on 25/04/2020.
//

import Foundation
import Moya
import FirebaseFirestore

enum NetworkService {
    enum BusinessesPovider: TargetType {
        var baseURL: URL {
            return URL(string:  "asd")!
        }
        
        var path: String {
            switch self {
            case .search(num: let num):
                return "/search"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case .search(num: let num):
                return .requestParameters(parameters: ["latitude":123], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]? {
            //            return ["Authorization": "Bearer \(apiKey)"]
            //            ["Content-type": "application/json"]
            return ["Authorization": "Bearer "]
        }
        case search(num: Int)
    }
    
}
