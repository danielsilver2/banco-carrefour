//
//  UIImage+Extension.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import UIKit
    
extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
