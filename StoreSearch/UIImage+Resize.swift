//
//  UIImage+Resize.swift
//  StoreSearch
//
//  Created by snake on 15/8/7.
//  Copyright (c) 2015年 snakeLib. All rights reserved.
//

import UIKit

extension UIImage {
    func resizedImageWithBounds(bounds: CGSize) -> UIImage {
        let minWidth = min(bounds.width, size.width)
        let minHeight = min(bounds.height, size.height)
        let minLength = min(minWidth, minHeight)
        let newSize = CGSize(width: minLength, height: minLength)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        drawInRect(CGRect(origin: CGPoint.zeroPoint, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
