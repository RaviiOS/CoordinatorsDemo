//
//  NSObject+Feature.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 20/04/21.
//

import Foundation

extension NSObject {
  
  class var nameOfClass: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}
