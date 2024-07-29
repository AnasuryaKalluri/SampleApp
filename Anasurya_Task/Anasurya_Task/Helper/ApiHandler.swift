//
//  ApiHandler.swift
//  Anasurya_Task
//
//  Created by Anasurya on 7/25/24..
//

import Foundation
import UIKit

struct API_Call {
    
    static func getParseApiCall<E:Encodable, D: Decodable >(urlString: String, parameters: E!, completion: @escaping (Result<D, Error>)-> Void){
        guard let url = URL(string: urlString) else{
            print("Error: Cannot create URL from string")
            return
        }
        print("URL", url)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(parameters)
        URLSession.shared.dataTask(with: request){ data, urlResponse, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                print("Error:httpResponse")
                return
            }
            print(httpResponse.statusCode)
            guard let data = data else {
               
                return
            }
            do{
                if let responseJson = try? JSONDecoder().decode(D.self, from: data){
                    completion(.success(responseJson))
                }else{
                    
                }
            }
        }.resume()
    }
}
