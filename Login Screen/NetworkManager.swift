//
//  NetworkManager.swift
//  Login Screen
//
//  Created by vidya.k on 19/04/22.
//

import Foundation
class NetworkManager{
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
    

    func callAPI() -> Bool{
        
       
        guard let rUrl = url else { return false }
       
        var request = URLRequest(url: rUrl)
        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Accept")


        let postStr = "userId=300&title=My urgent task&completed=false"

        request.httpBody = postStr.data(using: String.Encoding.utf8);

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

                if let error = error {
                    print("Error: \(error)")
                    return
                    
                }
        
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response\n \(dataString)")
                }
            
            if let httpResponse = response as? HTTPURLResponse {
                   print("statusCode: \(httpResponse.statusCode)")
               }
        }
        task.resume()
        
     return true
        
    }
 
    
}
