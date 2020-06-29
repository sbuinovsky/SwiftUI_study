//
//  UserData.swift
//  Landmarks
//
//  Created by Станислав Буйновский on 29.06.2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
