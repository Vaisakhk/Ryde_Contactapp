//
//  NetworkHandler.swift
//  RydeContactApp
//
//  Created by Vaisakh on 4/9/22.
//

import Foundation

class NetworkHandler {
    var defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    static let sharedHandler = NetworkHandler()
    
    private init (){
        
    }
    /**
     *  Inorder to start network service request
     *
     *  @Return  success block : Success block contains ResponseObject along with status code
     *           failure block : Failure block contains error,statuscode along with errorResponseObject
     */
    
    public func startNetworkRequest<T: Codable>(urlString:String,data:[String:String]?, methodType:MethodType, completion: @escaping (Result<T, CONTACTERROR>) -> Void)  {
        debugPrint("*******  WORK START ****** ")
        debugPrint(urlString, "")
        debugPrint("*******  WORK END ****** ")
        
        guard let requestUrl = URL(string: urlString) else {
            completion(.failure(.InvalidURL))
            return
        }
        var urlRequest:URLRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = methodType.httpMethodForRequest()
        urlRequest.allHTTPHeaderFields = getHeaderBody()

        if let tempBodyData = data {
            urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: tempBodyData, options: JSONSerialization.WritingOptions.prettyPrinted) as Data
        }
        urlRequest.timeoutInterval = 80
        urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        defaultSession.configuration.httpMaximumConnectionsPerHost = 10
        dataTask = defaultSession.dataTask(with: urlRequest, completionHandler: { data, response, error in
            defer {
                self.dataTask = nil
            }
            if let error = error {
                completion(.failure(.Other(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.StatusCode(response, error)))
                return
            }
            
            if let data = data, let decodedResponse = try? JSONDecoder().decode(T.self, from: data)
            {
                completion(.success(decodedResponse))
            }else {
                completion( .failure(.Decoding))
            }
        })
        dataTask?.resume()
    }

    //MARK: Request Header Generator
    func getHeaderBody() -> [String:String] {
        return ["Content-Type": "application/json",
                            "Cache-Control": "no-cache"]
    }
    
    
    public enum MethodType:Int {
        case MethodTypeGET
        case MethodTypePOST
        case MethodTypeDELETE
        case MethodTypePUT
        
        func httpMethodForRequest()-> String{
            switch  self {
            case .MethodTypeGET:
                return "GET"
            case .MethodTypePOST :
                return "POST"
            case .MethodTypeDELETE :
                return "DELETE"
            case .MethodTypePUT :
                return "PUT"
            }
        }
    }
}

enum CONTACTERROR: Error {
  case StatusCode(URLResponse?, Error?)
  case Decoding
  case InvalidImage
  case InvalidURL
  case NoInternet
  case Other(Error)

  static func map(_ error: Error) -> CONTACTERROR {
    return (error as? CONTACTERROR) ?? .Other(error)
  }

    func errorMessage() -> String {
        var message = ""
        switch self {
        case .StatusCode(let response, let errors ):
            message = "Error with the response, unexpected result. \n response: \(String(describing: response))\n error : \(String(describing: errors?.localizedDescription))"
            break
        case .Decoding:
            message = ""
            break
        case .InvalidImage:
            message = ""
            break
        case .NoInternet:
            message = ""
            break
        case .InvalidURL:
            message = ""
            break
        case .Other(let errors):
            message = "Error with fetching films: \(errors.localizedDescription)"
            break
        }
        return message
    }
}
