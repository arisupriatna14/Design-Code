//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Ari Supriatna on 18/12/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
  @Published var updates: [Update] = updateData
}
