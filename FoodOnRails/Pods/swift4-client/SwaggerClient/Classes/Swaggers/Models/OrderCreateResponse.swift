//
// OrderCreateResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct OrderCreateResponse: Codable {

    public var _id: String
    public var paymentUrl: String
    public var status: OrderResponse
    public var positions: [OrderItem]

    public init(_id: String, paymentUrl: String, status: OrderResponse, positions: [OrderItem]) {
        self._id = _id
        self.paymentUrl = paymentUrl
        self.status = status
        self.positions = positions
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case paymentUrl = "payment_url"
        case status
        case positions
    }


}

