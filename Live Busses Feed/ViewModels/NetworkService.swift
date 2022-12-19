//
//  NetworkService.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import Foundation




class NetworkService: NSObject {
    
    static let shared = NetworkService()
    
    func fetchNearbyBusses(device_id: String, lattitude: Double, longitude: Double, completion: @escaping (Result<[Bus], Error>) -> Void) {
        
        //creating post request
        guard let url = URL(string: Constants.get_nearby_busses_url) else {
            print("Failed to create url for /nearby_busses")
            return
        }
        
        //preparing json data
        let json: [String: Any] = ["device_id": device_id, "lat" : lattitude, "lon": longitude]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                
                let res = try JSONDecoder().decode([Bus].self, from: data)
                completion(.success(res))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
}
