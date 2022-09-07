//
//  NetworkHandlerTest.swift
//  RydeContactAppTests
//
//  Created by Vaisakh on 7/9/22.
//

import XCTest
@testable import RydeContactApp

class NetworkHandlerTest: XCTestCase {
    var sut:NetworkHandler?
    
    override func setUpWithError() throws {
        sut = NetworkHandler.sharedHandler
        let fileHandler = FileHandler.sharedHandler
        let url = URL(string: "https://reqres.in/api/users?page=1")
        let invalidUrl = URL(string: "https://reqres.in/api/users?page=100")
        NetworkURLSessionMock.testURLs = [url: fileHandler.getDataFromFile(name: "Contact"), invalidUrl:fileHandler.getDataFromFile(name: "Contact_invalid")]
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [NetworkURLSessionMock.self]
        let session = URLSession(configuration: config)
        sut?.defaultSession = session
    }


    
    override func tearDownWithError() throws {
       // sut = nil
    }

    
    func testRequestData() {
        let expectation = XCTestExpectation(description: "expectation that network request will succeed and will decode the response successfully")
        sut?.startNetworkRequest(urlString: "https://reqres.in/api/users?page=1", data: nil, methodType: .MethodTypeGET) { (_ result: Result<ContactList, CONTACTERROR>) in
            switch result {
            case .success(let response):
                if(response.data.count != 0) {
                    expectation.fulfill()
                }
                break
            case .failure(_) :
                break
            }

        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testInvalidRequestData() {
        let expectation = XCTestExpectation(description: "expectation that network request will succeed and will decode the response successfully")
        sut?.startNetworkRequest(urlString: "https://reqres.in/api/users?page=100", data: nil, methodType: .MethodTypeGET) { (_ result: Result<ContactList, CONTACTERROR>) in
            switch result {
            case .success(let response):
                print(response)
                break
            case .failure(let error) :
                switch error {
                case .StatusCode(_, _): break
                case .Decoding:
                    expectation.fulfill()
                    break
                case .InvalidImage: break
                case .InvalidURL: break
                case .NoInternet: break
                case .Other(_): break 
                }
                break
            }

        }
        wait(for: [expectation], timeout: 10.0)
    }


}
