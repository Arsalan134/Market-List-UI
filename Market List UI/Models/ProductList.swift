//
//  LIst.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import Foundation

/// User's list of products
struct ProductList: Codable, Equatable, Hashable {

    var id: String?
    var name: String?
    var products: [Product]? = []

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ProductList, rhs: ProductList) -> Bool {
        return lhs.id == rhs.id ? true : false
    }

    func exportToURL() -> URL? {
        guard let encoded = try? JSONEncoder().encode(self) else { return nil }

        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        guard let path = documents?.appendingPathComponent("/\(name ?? "").productList") else {
            return nil
        }

        do {
            try encoded.write(to: path, options: .atomicWrite)
            return path
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    
}




