//
//  APIManager.swift
//  DealsApp
//
//  Created by Varun Channi on 22/06/17.
//  Copyright © 2017 Nagarro. All rights reserved.
//

import Foundation

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}

class APIManager {
    
    static let shared = APIManager()

    private var sessionManager = URLSession(configuration: URLSessionConfiguration.default)
    
    func requestWithURL(_ urlString: String,
                        ofType type: RequestType,
                        withParameters parameters: [String : Any]?,
                        handler: @escaping (_ success: Bool, _ data: [String : Any]?, _ error: AppError?) -> Void) {
        
        
        
        guard let url = URL(string: ServiceAPI.baseURL + urlString) else {
            print("url is not right")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let params = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            } catch let error {
                print("Failed to add parameters with error \(error.description))")
            }
        }
        
        let task = sessionManager.dataTask(with: request) { (data, response, error) in
            
            var apiError: AppError?
            var jsonData: [String : Any]?
            var responseStatus: Bool = false
            
            if let err = error {
                apiError = AppError(withType: .apiError, withError: err)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String : Any] {
                        jsonData = json
                        responseStatus = true
                    } else {
                        apiError = AppError(withType: .jsonSerializationFailed, withCode: "0", withDescription: "JSON is not right")
                    }
                } catch {
                    apiError = AppError(withType: .jsonSerializationFailed, withCode: "0", withDescription: "JSON serialization failed, check response")
                }
            }
            //Sending the final response in completion
            DispatchQueue.main.async {
                handler(responseStatus, jsonData, apiError)
            }
        }
        task.resume()
    }
    
}
