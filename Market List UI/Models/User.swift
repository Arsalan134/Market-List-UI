//
//  User.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    @Published var name: String = ""
    @Published var lastname: String = ""
    @Published var email: String = ""
    @Published var imageURL: String = ""

}

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
}
