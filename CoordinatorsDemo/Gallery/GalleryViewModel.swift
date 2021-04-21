//
//  GalleryViewModel.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import Foundation

struct GalleryViewModel {
    var items: [Item]!
    
    init(galleryItems: [Item]) {
        self.items = galleryItems
    }
    
    var numberOfItems: Int {
        items.count
    }
    
    func getItemAt(_ index: Int ) -> Item {
        items[index]
    }
}
