//
//  shop.swift
//  Aoun
//
//  Created by Nujud Alotaibi on 14/06/1446 AH.
//

import Foundation

class ShoppingViewModel: ObservableObject {
    @Published var items: [ShoppingItem] = [] // قائمة العناصر
    
    // تهيئة العناصر
    init() {
        loadSampleItems()
    }
    
    // تحميل بيانات افتراضية
    func loadSampleItems() {
        items = [
            ShoppingItem(name: "", isCompleted: false),
            ShoppingItem(name: "", isCompleted: true),
            ShoppingItem(name: "", isCompleted: false)
        ]
    }
    
    // إضافة عنصر جديد للقائمة
    func addItem(name: String) {
        let newItem = ShoppingItem(name: name, isCompleted: false)
        items.append(newItem)
    }
    
    // حذف عنصر من القائمة
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
