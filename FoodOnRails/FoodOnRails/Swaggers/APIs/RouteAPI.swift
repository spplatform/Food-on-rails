//
// RouteAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



public class RouteAPI {
    /**
     get route by ticket number
     
     - parameter id: (path) The ticket ID 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func ticketIdRouteGet(id: String, completion: @escaping ((_ data: RouteResponse?,_ error: Error?) -> Void)) {
        ticketIdRouteGetWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     get route by ticket number
     - GET /ticket/{id}/route
     - examples: [{contentType=application/json, example={
  "train_number" : "train_number",
  "stops" : [ {
    "duration" : 0,
    "date_time" : "2000-01-23T04:56:07.000+00:00",
    "cafes" : [ {
      "name" : "name",
      "positions" : [ {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      }, {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      } ],
      "id" : "id",
      "city_id" : "city_id"
    }, {
      "name" : "name",
      "positions" : [ {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      }, {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      } ],
      "id" : "id",
      "city_id" : "city_id"
    } ],
    "name" : "name",
    "city_id" : "city_id"
  }, {
    "duration" : 0,
    "date_time" : "2000-01-23T04:56:07.000+00:00",
    "cafes" : [ {
      "name" : "name",
      "positions" : [ {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      }, {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      } ],
      "id" : "id",
      "city_id" : "city_id"
    }, {
      "name" : "name",
      "positions" : [ {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      }, {
        "price" : 6,
        "image_url" : "image_url",
        "name" : "name",
        "id" : "id"
      } ],
      "id" : "id",
      "city_id" : "city_id"
    } ],
    "name" : "name",
    "city_id" : "city_id"
  } ]
}}]
     
     - parameter id: (path) The ticket ID 

     - returns: RequestBuilder<RouteResponse> 
     */
    public class func ticketIdRouteGetWithRequestBuilder(id: String) -> RequestBuilder<RouteResponse> {
        var path = "/ticket/{id}/route"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<RouteResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
