import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
}

protocol NetworkClient {
    
    func login(using email: String,
               password: String,
               completionHandler: @escaping (Int) -> Void)
    
}

class HttpClient: NetworkClient {

    func login(using email: String,
               password: String,
               completionHandler: @escaping (Int) -> Void) {
        
        let loginRequest = LoginRequest(username: email, password: password)

        let request = urlRequest(using: loginRequest)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (_, response, _) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(0)
                return
            }
            
            completionHandler(httpResponse.statusCode)
            
        }
        
        task.resume()
    }
}

private extension HttpClient {
    
    func urlRequest(using loginRequest: LoginRequest) -> URLRequest {
        
        let url = URL(string: "http://0.0.0.0:8080/login")!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try! JSONEncoder().encode(loginRequest)
        
        return urlRequest
    }
    
}
