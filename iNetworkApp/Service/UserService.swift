//
//  UserService.swift
//  iNetworkApp
//
//  Created by Saravanakumar Selladurai on 19/07/25.
//

import SwiftyNetworkClient
import Foundation

struct User: Decodable {
    let id: UUID
    let name: String
    let dob: Date
}

struct GetUserRequestEndpoint: NetworkRequest {
    typealias ResponseType = User
    
    var path: String
    
    var method: HTTPMethod
    
    var headers: [String : String]?
    
    var queryParameters: [String : String]?
    
    var body: Data?
    
    var requiresAuth: Bool
    
}


func makeUserRequest() async {
    let request = GetUserRequestEndpoint(path: "/users", method: .get, requiresAuth: true)
    let config = NetworkConfiguration(baseUrl: URL(string: "https://testuserapp.com")!)
    let service = NetworkService(config: config)
    do {
        let user = try await service.execute(request)
        print("User details: \(user.name) -- \(user.dob)")
    } catch NetworkError.invalidResponse {
        print("invalid response")
    } catch NetworkError.custom(let message) {
        print("invalid response: \(message)")
    } catch {
        print("generic error message")
    }
}
