//
//  UserModel.swift
//  SQLite SwiftUI
//
//  Created by Danil Bochkarev on 07.03.2023.
//

import Foundation

class UserModel: Identifiable {
    public var id: Int64 = 0
    public var name: String = ""
    public var email: String = ""
    public var age: Int64 = 0
}
