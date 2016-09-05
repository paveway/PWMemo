//
//  ResourceUtils.swift
//  PWEditor
//
//  Created by mfuta1971 on 2016/08/02.
//  Copyright © 2016年 Masatsugu Futamata. All rights reserved.
//

import Foundation

class ResourceUtils: NSObject {

    /**
     パスを取得する。

     - Parameter name: ファイル名
     - Parameter type: ファイル拡張子
     - Returns: パス
     */
    class func getPath(name: String, type: String) -> String {
        let mainBundle = NSBundle.mainBundle()
        let path = mainBundle.pathForResource(name, ofType: type)!
        return path
    }

    /**
     ファイルデータを取得する。
 
     - Parameter name: ファイル名
     - Parameter type: ファイル拡張子
     - Returns: ファイルデータ
     */
    class func getFileData(fileName: String, type: String) -> String {
        let path = getPath(fileName, type: type)
        let fileHandle = NSFileHandle(forReadingAtPath: path)
        let fileData = fileHandle!.readDataToEndOfFile()
        let fileDataString = String(data: fileData, encoding: NSUTF8StringEncoding)
        return fileDataString!
    }
}