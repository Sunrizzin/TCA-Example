//
//  TCAExampleApp.swift
//  TCAExample
//
//  Created by Sunrizz on 18.10.2023.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCAExampleApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: Store(initialState: CounterFeature.State()) {
                    CounterFeature()
                }
            )
        }
    }
}
