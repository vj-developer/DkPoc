//
//  FactResponse.swift
//  DkPoc
//
//  Created by Iyyappan on 14/09/23.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

struct FactResponse: Codable {
    let text: String
    let number: Int
    let found: Bool
    let type: String
}
