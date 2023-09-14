//
//  CounterReducer.swift
//  DkPoc
//
//  Created by Iyyappan on 14/09/23.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct Counter: Reducer {
    
    struct State: Equatable {
        var count = 0
        var fact : String?
        var isLoading = false
    }
    enum Action: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
        case getFactButtonTapped
        case factResponse(String)
    }
    
    @Dependency(\.getFact) var getFact
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            state.fact = ""
            return .none
            
        case .incrementButtonTapped:
            state.count += 1
            state.fact = nil
            return .none
            
        case .getFactButtonTapped:
            state.fact = nil
            state.isLoading = true
            return .run { [count = state.count] send in
                try await send(.factResponse(self.getFact.fetch(count)))
            }
            
        case let .factResponse(fact):
            state.fact = fact
            state.isLoading = false
            return .none
        }
    }
}
