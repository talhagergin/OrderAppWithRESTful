//
//  ContentView.swift
//  OrderAppWithRESTful
//
//  Created by Talha Gergin on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: CoffeeModel
    
    private func populateOrders() async {
        do{
            try await model.populateOrders()
        }catch{
            print(error.localizedDescription)
        }
    }
    var body: some View {
        VStack {
            List(model.orders){order in
                Text(order.name)
            }
        }.task {
            await populateOrders()
        }
    }
}

#Preview {
    ContentView().environmentObject(CoffeeModel(webservice: WebService()))
}
