//
//  Listshow.swift
//  Aoun
//
//  Created by Nujud Alotaibi on 14/06/1446 AH.
//

import Foundation

struct ShoppingItem: Identifiable {
    let id = UUID() // معرف فريد لكل عنصر
    var name: String // اسم العنصر
    var isCompleted: Bool // حالة اكتمال العنصر (تم شراؤه أم لا)
    
    // خاصية لتغيير حالة العنصر (إكمال/عدم الإكمال)
    mutating func toggleCompletion() {
        isCompleted.toggle()
    }
}
