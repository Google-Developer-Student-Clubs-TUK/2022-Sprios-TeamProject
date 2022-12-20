//
//  PostNetManager.swift
//  sprios_ios
//
//  Created by 이정동 on 2022/12/19.
//

import Foundation
import UIKit

class PostNetManager {
    static let shared = PostNetManager()
    private init() {}
    
    func createPost(post: Post, completion: @escaping (Int)->()) {
        
        guard let url = URL(string: "") else {
            print("Error: cannot create URL")
            return
        }
        
        // 모델을 JSON data 형태로 변환
        guard let jsonData = try? JSONEncoder().encode(post) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        // URL요청 생성
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 요청타입 JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // 응답타입 JSON
        request.httpBody = jsonData
        
        // 요청을 가지고 세션 작업시작
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 에러가 없어야 넘어감
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            // 옵셔널 바인딩
            guard let safeData = data else {
                print("Error: Did not receive data")
                return
            }
            
            // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
            print(String(decoding: safeData, as: UTF8.self))
            
            guard let response = response as? HTTPURLResponse else { return }
            
            completion(response.statusCode)
        }.resume()
    }
    
    func getLoginUserPosts() {
        
    }
    
    func getPosts() {
        
    }
}