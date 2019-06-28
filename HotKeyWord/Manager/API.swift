//
//  API.swift
//  HotKeyWord
//
//  Created by Thinh on 6/28/19.
//  Copyright © 2019 Thinh. All rights reserved.
//

import Foundation
import Alamofire

public enum Result<T, E> {
    case success(T)
    case failed(E)
}

public enum ResponseError : Error {
    case errorStatusCode(Int)
    case errorResponse(String)
}

class API: NSObject {
    static let share = API()
    
    func getKeyWord(complete : @escaping (Result<Keywords, Error>) -> Void) {
        AF.request(APIRUL.getListKeyword).responseDecodable { (response : DataResponse<Keywords>) in
            if let error = response.error {
                complete(.failed(error))
            }else {
                if let result = response.value {
                    complete(.success(result))
                }else {
                    complete(.failed(ResponseError.errorResponse("Response Is Empty!")))
                }
            }
        }
        
    }
}


