//
//  Comment.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import Foundation

struct Comment: Decodable{
    var postId: Int
    var id    : Int
    var name  : String
    var email : String
    var body  : String
}
