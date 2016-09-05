//
//  ImageUtils.swift
//  PWEditor
//
//  Created by mfuta1971 on 2016/06/22.
//  Copyright © 2016年 Masatsugu Futamata. All rights reserved.
//

import Foundation

/**
 イメージユーティリティクラス

 - Version: 1.0 新規作成
 - Author: paveway.info@gmail.com
 */
class ImageUtils: NSObject {

    /**
     イメージを生成する。
 
     - Parameter name: 画像ファイル名
     - Parameter width: 幅
     - Parameter height: 高さ
     - Parameter scale: スケール
     - Returns: イメージ
     */
    class func createImage(name: String, width: CGFloat, height: CGFloat, scale: CGFloat = 1.0) -> UIImage? {
        if name.isEmpty || width <= 0 || height <= 0 || !(0 < scale && scale <= 1.0) {
            return nil
        }

        if let image = UIImage(named: name) {
            let resizedSize = CGSizeMake(width, height)
            UIGraphicsBeginImageContext(resizedSize)
            let rect = CGRectMake(0, 0, resizedSize.width * scale, resizedSize.height * scale)
            image.drawInRect(rect)
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext()

            return resizedImage

        } else {
            return nil
        }
    }
}