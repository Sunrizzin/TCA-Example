//
//  CounterFeature.swift
//  TCAExample
//
//  Created by Sunrizz on 18.10.2023.
//

import ComposableArchitecture

struct CounterFeature: Reducer {
    
    struct State: Equatable {
        var count = 0
        var fact: String?
        var isLoading = false
    }
    
    enum Action {
        case decrementButtonTapped
        case factButtonTapped
        case incrementButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.fact = nil
            state.count -= 1
            return .none
        case .incrementButtonTapped:
            state.fact = nil
            state.count += 1
            return .none
        case .factButtonTapped:
            state.fact = nil
            state.isLoading = true
            return .none
            
        }
    }
    
}
