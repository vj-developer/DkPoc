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
  }
  enum Action: Equatable {
      case decrementButtonTapped
      case incrementButtonTapped
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .decrementButtonTapped:
      state.count -= 1
      return .none

    case .incrementButtonTapped:
      state.count += 1
      return .none
    }
  }
}
