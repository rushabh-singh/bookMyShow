//
//  HttpUtil.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import Foundation

struct HttpUtil {
    
    static let shared = HttpUtil()
    
    private init(){
    }
    
    func getData<T: Decodable>(urlString: String, responseType: T.Type, completionHandler:@escaping(_ data : T?) -> Void){
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            let statusCode = (httpUrlResponse as? HTTPURLResponse)?.statusCode
            //store 200 into constant
            if(error == nil && data != nil && statusCode == 200) {
                let response = self.decodeJsonResponse(data: data!, responseType: responseType)
                completionHandler(response ?? nil)
            }
            else {
                completionHandler(nil)
            }
        }.resume()
    }
    
    private func decodeJsonResponse<T: Decodable>(data: Data, responseType: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(responseType, from: data)
        }catch let error {
            print("deocding error : \(error)")
        }
        return nil
    }
}
