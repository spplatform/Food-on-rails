//
// OrderStatusResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct OrderStatusResponse: Codable {

    public var _id: String?
    public var status: String
    public var _description: String

    public init(_id: String?, status: String, _description: String) {
        self._id = _id
        self.status = status
        self._description = _description
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case status
        case _description = "description"
    }


}

