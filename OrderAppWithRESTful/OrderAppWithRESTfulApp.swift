//
//  OrderAppWithRESTfulApp.swift
//  OrderAppWithRESTful
//
//  Created by Talha Gergin on 14.12.2024.
//

import SwiftUI

@main
struct OrderAppWithRESTfulApp: App {
    @StateObject private var model: CoffeeModel
    init() {
        let webservice = WebService()
        _model = StateObject(wrappedValue: CoffeeModel(webservice: webservice))
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
