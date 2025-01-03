//
//  Errors.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 03/01/25.
//

import Foundation


public enum BezetKitError: LocalizedError {
  case custom(String)
  case responseError(String)
  case unauthorized           //Status code 401
  case forbidden              //Status code 403
  case notFound               //Status code 404
  case internalServerError    //Status code 500
  case connectionProblem
  case unknownError
  case badRequest
  case parsingError
  case emptyResult
  case invalidUrl(String)
}


extension BezetKitError {

  public var description: String {
    switch self {
    case let .custom(msg):
      return msg
    case .unauthorized:
      return "Ups! Your session has been expired. You'll be logged out."
    case let .responseError(message):
      return message
    case .notFound:
      return "Sorry not found"
    case .internalServerError:
      return "Internal Server Error"
    case .unknownError, .parsingError, .forbidden, .badRequest:
      return "Something went wrong. Please try again later."
    case .connectionProblem:
      return "Please check your network connection"
    case .emptyResult:
      return "Data not found"
    case .invalidUrl(let url):
      return "Invalid URL format: \(url)"
    }
  }

}


extension BezetKitError {

  public static func makeErrorMessage(_ error: any Error) -> String {
    guard let error = error as? BezetKitError else {
      return defaultErrorMessage
    }
    return error.description
  }

}


extension BezetKitError: Equatable {

  public static func ==(lhs: BezetKitError, rhs: BezetKitError) -> Bool {
    switch (lhs, rhs){
    case (unauthorized, unauthorized):
      return true
    case (internalServerError, internalServerError):
      return true
    case (badRequest, badRequest):
      return true
    case (forbidden, forbidden):
      return true
    case (notFound, notFound):
      return true
    case (connectionProblem, connectionProblem):
      return true
    case (unknownError, unknownError):
      return true
    case (emptyResult, emptyResult):
      return true
    case (parsingError, parsingError):
      return true
    case (responseError, responseError):
      return true
    case (invalidUrl, invalidUrl):
      return true
    default:
      return false
    }
  }
}


public let defaultErrorMessage = "Ups... something went wrong! Please try again later."
