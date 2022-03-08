//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by BoDim on 13.09.2021.
//  Copyright © 2021 BoDim. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCourses(completion: @escaping(Result<[Course], NetworkError>) -> Void) {
        guard let url = URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(courses))
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func fetchData(completion: @escaping(_ courses: [Course]) -> Void) {
        guard let url = URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(courses)
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func fetchCourses() async throws -> [Course] {
        guard let url = URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses") else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let courses = try? decoder.decode([Course].self, from: data) else {
            throw NetworkError.noData
        }
        
        return courses
    }
    
    func fetchCoursesWithContinuations() async throws -> [Course] {
        try await withCheckedThrowingContinuation { continuation in
            fetchCourses { result in
                switch result {
                case .success(let courses):
                    continuation.resume(returning: courses)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
