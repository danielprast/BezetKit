//
//  KeychainHelper.swift
//  BezetKit
//
//  Created by Daniel Prastiwa on 31/08/23.
//

import Foundation


final class KeychainHelper {

  static let standard = KeychainHelper()

  private init() {}

  func save(
    _ data: Data,
    service: String,
    itemService: String
  ) {
    let query = [
      kSecValueData: data,
      kSecAttrService: service,
      kSecAttrAccount: itemService,
      kSecClass: kSecClassGenericPassword
    ] as CFDictionary

    let status = SecItemAdd(query, nil)

    if status == errSecDuplicateItem {
      let query = [
        kSecAttrService: service,
        kSecAttrAccount: itemService,
        kSecClass: kSecClassGenericPassword,
      ] as CFDictionary

      let attributesToUpdate = [kSecValueData: data] as CFDictionary

      SecItemUpdate(query, attributesToUpdate)
    }
  }

  func read(
    service: String,
    account: String
  ) -> Data? {
    let query = [
      kSecAttrService: service,
      kSecAttrAccount: account,
      kSecClass: kSecClassGenericPassword,
      kSecReturnData: true
    ] as CFDictionary

    var result: AnyObject?
    SecItemCopyMatching(query, &result)

    return (result as? Data)
  }

  func delete(
    service: String,
    account: String
  ) {
    let query = [
      kSecAttrService: service,
      kSecAttrAccount: account,
      kSecClass: kSecClassGenericPassword,
    ] as CFDictionary

    SecItemDelete(query)
  }

  // MARK: - •

  func save<T>(
    item: T,
    service: String,
    account: String
  ) where T : Codable {
    do {
      let data = try JSONEncoder().encode(item)
      save(
        data,
        service: service,
        itemService: account
      )
    } catch {
      assertionFailure("Fail to encode item for keychain: \(error)")
    }
  }

  func read<T>(
    service: String,
    account: String,
    type: T.Type
  ) -> T? where T : Codable {
    guard let data = read(service: service, account: account) else {
      return nil
    }
    do {
      let item = try JSONDecoder().decode(type, from: data)
      return item
    } catch {
      assertionFailure("Fail to decode item for keychain: \(error)")
      return nil
    }
  }

}
