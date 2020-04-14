//
//  NManager.swift
//  GraphQL_Test
//
//  Created by Eyad Heikal on 4/12/20.
//  Copyright © 2020 Eyad Heikal. All rights reserved.
//

import Foundation
import Apollo

class NManager {
    
    static let shared = NManager()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
    //private(set) lazy var apollo = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!)
}
