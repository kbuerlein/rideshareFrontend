//
//  NetworkManager.swift
//  RideShare
//
//  Created by L20-US-KBuerlein23-MBA on 4/28/24.
//

import Alamofire
import Foundation

class NetworkManager {
    
    /// Shared singleton instance
    static let shared = NetworkManager()
    
    let decoder: JSONDecoder = JSONDecoder()
    
    private init() { }
    
    /// Endpoint for dev server
    private let getRidesEndpoint: String = "rideshareX/src/app.py/rideshare/authenticate/"
    private let postAuthenticationEndpoint: String = ""
    
    
    // MARK: - Requests
    func getAvailableRides(completion: @escaping ([Ride]) -> Void) {
        AF.request(getRidesEndpoint, method: .get)
            .validate()
            .responseDecodable(of: [Ride].self, decoder: decoder) { response in
                switch response.result {
                case .success(let rides):
                    completion(rides)
                case .failure(let error):
                    print("Error in NetworkManager.getAvailableRides: \(error.localizedDescription)")
                    completion([])
                }
            }
    }
    
    
    func postAuthentication(username: String, password: String, completion: @escaping (Ride) -> Void) {
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        AF.request(postAuthenticationEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Ride.self, decoder: decoder) { response in
                switch response.result {
                case .success(let ride):
                    completion(ride)
                case .failure(let error) :
                    print("Error in NetworkManager.postAuthentication: \(error.localizedDescription)")
                }
            }
    }
}
