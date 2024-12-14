//
//  WebService.swift
//  OrderAppWithRESTful
//
//  Created by Talha Gergin on 14.12.2024.
//

import Foundation

class WebService{
    enum NetworkError: Error{
        case badRequest
        case decodingError
        case badUrl
    }
    
    func getOrders() async throws -> [Order]{
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else{
            throw NetworkError.badUrl
        }
        let(data,response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else{
                throw NetworkError.badRequest
            }
        guard let orders = try?JSONDecoder().decode([Order].self, from: data) else{
            throw NetworkError.decodingError
        }
        return orders
    }
}
/*
 Get all orders:

 method: GET

 https://island-bramble.glitch.me/test/orders

 Create a new order:

 method: POST

 https://island-bramble.glitch.me/test/orders

 Body:

 {
 "name": "John Doe",
 "coffeeName": "Hot Coffee",
 "total": 4.50,
 "size": "Medium"
 }
 Delete an order:

 method: DELETE

 https://island-bramble.glitch.me/test/orders/:id

 Update an order:

 method: PUT

 https://island-bramble.glitch.me/test/orders/:id

 Body:

 {
 "name": "John Doe Edit",
 "coffeeName": "Hot Coffee Edit",
 "total": 2.50,
 "size": "Small"
 }

 */
