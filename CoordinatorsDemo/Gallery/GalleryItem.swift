//
//  GalleryItem.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import Foundation
import UIKit

struct Item {
    var title: String
    var imageName: String
}

// MARK: - Computed properties
extension Item {
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}


struct GalleryItems {
    var galleryItems: [Item]?
    
    static func getDummyData() -> [Item] {
        return [
            Item(title: "Image 1", imageName: "test1"),
            Item(title: "Image 2", imageName: "test2"),
            Item(title: "Image 3", imageName: "test3"),
            Item(title: "Image 4", imageName: "test4")
        ]
    }
}
