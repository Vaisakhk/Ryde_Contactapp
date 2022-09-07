//
//  NetworkURLSessionMock.swift
//  RydeContactAppTests
//
//  Created by Vaisakh on 7/9/22.
//

import Foundation

class NetworkURLSessionMock : URLProtocol {
    static var testURLs = [URL?: Data]()
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        // if we have a valid URL…
        if let url = request.url {
            // …and if we have test data for that URL…
            if let data = NetworkURLSessionMock.testURLs[url] {
                // …load it immediately.
                self.client?.urlProtocol(self, didLoad: data)
            }
        }
        
        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
