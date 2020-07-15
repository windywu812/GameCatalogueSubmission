//
//  ApiService.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 03/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

class ApiService {
    
    func fetchListGames(search: String = "", genre: String = "0", dates: String = "", ordering: String = "", completion: @escaping (Result<GameResponse, Error> ) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        guard var urlComponent = URLComponents(string: K.urlGames) else { return }
        urlComponent.queryItems = [
            URLQueryItem(name: "search", value: search),
            URLQueryItem(name: "dates", value: dates),
            URLQueryItem(name: "ordering", value: ordering)
        ]
        
        guard let urlComponentString = urlComponent.url else { return }
        
        URLSession(configuration: configuration).dataTask(with: urlComponentString) { (data, response, error) in
            
            guard let responseHTTP = response as? HTTPURLResponse else { return }
            
            if responseHTTP.statusCode == 200 {
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(GameResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(response))
                        }
                    } catch let error {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            } else {
                print("Error with code \(responseHTTP.statusCode)")
            }
        }.resume()
        
    }
    
    func fetchGameDetail(id: Int, completion: @escaping (Result<DetailGame, Error>) -> ()) {
        
        guard let url = URL(string: "\(K.urlGames)/\(id)") else { return }
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        URLSession(configuration: configuration).dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(DetailGame.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(responseData))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            } else if let error = error  {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchListGamesWithGenre(id: String, completion: @escaping (Result<ListGameWithGenreResponse, Error>) ->()) {
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        guard var urlComponent = URLComponents(string: K.urlGames) else { return }
        urlComponent.queryItems = [
            URLQueryItem(name: "genres", value: id)
        ]
        
        guard let urlComponentString = urlComponent.url else { return }
        
        URLSession(configuration: configuration).dataTask(with: urlComponentString) { (data, response, error) in
            
            guard let responseHTTP = response as? HTTPURLResponse else { return }
            
            if responseHTTP.statusCode == 200 {
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(ListGameWithGenreResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(response))
                        }
                    } catch let error {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            } else {
                print("Error with code \(responseHTTP.statusCode)")
            }
        }.resume()
        
        
    }
    
    func fetchGenre(completion: @escaping (Result<GenreResponse, Error> ) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        guard let urlString = URL(string: K.urlGenre) else { return }
        
        URLSession(configuration: configuration).dataTask(with: urlString) { (data, response, error) in
            
            guard let responseHTTP = response as? HTTPURLResponse else { return }
            
            if responseHTTP.statusCode == 200 {
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(GenreResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(response))
                        }
                    } catch let error {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            } else {
                print("Error with code \(responseHTTP.statusCode)")
            }
            
        }.resume()
        
    }
    
    func fetchGenreDetail(id: Int, completion: @escaping (Result<GenreDetail, Error>) -> ()) {
        
        guard let urlString = URL(string: "\(K.urlGenre)/\(id)") else { return }
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        URLSession(configuration: configuration).dataTask(with: urlString) { (data, response, error) in
            if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(GenreDetail.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(responseData))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
