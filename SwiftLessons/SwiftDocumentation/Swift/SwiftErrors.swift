//
//  SwiftErrors.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/11/24.
//

import Foundation

class SwiftErrors {
    
    enum FetchError: Error {
        case network, server, authentication(type: String)
    }
    
    static func fetchData() throws -> String {
        let credentials: String? = "Password"
        guard let password = credentials else { throw FetchError.authentication(type: "Password Missing") }
        
        let fetchedData: String? = "Valid Data"
        guard let data = fetchedData else { throw FetchError.server }
        
        return "Success"
    }
    
    // Errors could continue to propagate up the call stack until a do/catch
    static func getData() -> String? {
        do {
            let data = try SwiftErrors.fetchData()
            return data
        } catch FetchError.network {
            print("Network Error")
        } catch FetchError.server {
            print("Server Error")
        } catch FetchError.authentication(let type) {
            print("Authentication Error with type: \(type)")
        } catch {
            print("Unknown Error")
        }
        return nil
    }
}
