//
//  CoffeeModel.swift
//  OrderAppWithRESTful
//
//  Created by Talha Gergin on 14.12.2024.
//

import Foundation

@MainActor
class CoffeeModel: ObservableObject{
    let webservice: WebService
    @Published private(set) var orders: [Order] = []
    
    init(webservice: WebService){
        self.webservice = webservice
    }
    
    func populateOrders() async throws {
        orders = try await webservice.getOrders()
    }
}
