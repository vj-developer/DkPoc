//
//  CounterView.swift
//  DkPoc
//
//  Created by Iyyappan on 14/09/23.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    
    let store: StoreOf<Counter>
    
    var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            
            VStack {
                HStack(){
                    Button("-") {
                        viewStore.send(.decrementButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    
                    Text("\(viewStore.count)")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    
                    Button("+") {
                        viewStore.send(.incrementButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(
            store:Store(
                initialState: Counter.State(),
                reducer: {Counter() ._printChanges()}
            )
        )
    }
}
