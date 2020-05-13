//
//  UserViewModel.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
    
    private let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"
    
    @Published var messages = "Messages inside observable object"
    
    @Published var courses: [Course] = [
        .init(name: "Course 1"),
        .init(name: "Course 2"),
        .init(name: "Course 3")
    ]
    
    func changeMessage() {
        self.messages = "Blah Blah Blah"
    }
    
    func fetchCourses() {
        // fetch json and decode and update some array property
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                self.courses = try! JSONDecoder().decode([Course].self, from: data!)
            }
        }.resume()
    }
}
