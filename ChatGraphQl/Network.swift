//
//  Network.swift
//  ChatGraphQl
//
//  Created by Azizbek Salimov on 30.05.2022.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://192.168.0.97:4010/graphql")!)
}
