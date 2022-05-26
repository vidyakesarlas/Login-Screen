//
//  NetworkManager.swift
//  Login Screen
//
//  Created by vidya.k on 19/04/22.
//

import Foundation

class NetworkManager {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
    var statusCodee: Int?
    var status = false
    
    func callAPI(userCompletionHandler: @escaping (Bool) -> ()){
        guard let rUrl = url else { return}
        var request = URLRequest(url: rUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let postStr = "userId=300&title=My urgent task&completed=false"
        request.httpBody = postStr.data(using: String.Encoding.utf8)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request,completionHandler: { data, response, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response\n \(dataString)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200{
                    self.status = true
                    userCompletionHandler(self.status)
                }else if httpResponse.statusCode == 201{
                    self.status = true
                    userCompletionHandler(self.status)
                }
                else{
                    self.status = false
                    userCompletionHandler(self.status)
                }
            }
        })
        task.resume()
    }
}

