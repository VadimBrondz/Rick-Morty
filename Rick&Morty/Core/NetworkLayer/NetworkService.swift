//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import Alamofire

class NetworkService {
    
    func request(urlString: String, completion: @escaping (NetworkResponse?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.sync {
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                do {
                    let results = try JSONDecoder().decode(NetworkResponse.self , from: data)
                    completion(results, nil)
                } catch let jsonError  {
                    print("failed to decode JSON", jsonError)
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    
    func requestImage (urlString: String?, completion: @escaping (UIImage?, Error?) -> Void) {
        if urlString != nil {
            let url = URL(string: urlString!)
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            AF.request(request).responseData { response in
                if response.error == nil {
                    completion(UIImage(data: response.value ?? Data()), nil)
                    
                }
            }
        }
    }
}
