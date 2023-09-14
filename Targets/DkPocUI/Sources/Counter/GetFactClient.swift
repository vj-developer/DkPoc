//
//  GetFactClient.swift
//  DkPoc
//
//  Created by Iyyappan on 14/09/23.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import ComposableArchitecture
import Foundation

struct GetFactClient {
    var fetch: (Int) async throws -> String
}

extension GetFactClient: DependencyKey {
    static let liveValue = Self(
        fetch: { number in
            do {
                let url = URL(string: "https://numbersapi.p.rapidapi.com/\(number)/math?fragment=true&json=true")!
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = [
                    "X-RapidAPI-Key": "16ebbf7356mshbf1fdf333d208afp1b9fd6jsnd1c93f228b31",
                    "X-RapidAPI-Host": "numbersapi.p.rapidapi.com"
                ]
                
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let factResponse = try decoder.decode(FactResponse.self, from: data)
                let formattedFact = "Number: \(factResponse.number)\nFact: \(factResponse.text)"
                return formattedFact
            } catch {
                // Handle the error here
                print("An error occurred during the request: \(error)")
                // You can also notify the caller or take other appropriate actions
                return error.localizedDescription
            }
        }
    )
}

extension DependencyValues {
    var getFact: GetFactClient {
        get { self[GetFactClient.self] }
        set { self[GetFactClient.self] = newValue }
    }
}
