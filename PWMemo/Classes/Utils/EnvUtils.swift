//
//  EnvUtils.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/08/25.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import Foundation

/**
環境ユーティリティ

- Version: 1.0 新規作成
- Author: paveway.info@gmail.com
*/
class EnvUtils: NSObject {

    /// バージョンキー
    static let kVersionKey: String = "CFBundleShortVersionString"

    /// ビルドキー
    static let kBuildKey: String = "CFBundleVersion"

    /**
     アプリケーションデリゲートを取得する。

     - Returns: アプリケーションデリゲート
     */
    class func getAppDelegate() -> AppDelegate {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate
    }

    /**
    バージョン番号を取得する。

    - Returns: バージョン番号
    */
    class func getVersion() -> String {
        let bundle = NSBundle.mainBundle()
        let version: String = bundle.objectForInfoDictionaryKey(kVersionKey) as! String
        return version
    }
    /**
    ビルド番号を取得する。

    - Returns: ビルド番号
    */
    class func getBuild() -> String {
        let bundle = NSBundle.mainBundle()
        let build: String =
            bundle.objectForInfoDictionaryKey(kBuildKey) as! String
        return build
    }

    /**
     アプリ名を取得する。
 
     - Returns: アプリ名
     */
    class func getAppName() -> String {
        let bundle = NSBundle.mainBundle()
        let build: String =
        bundle.objectForInfoDictionaryKey("CFBundleName") as! String
        return build
    }
}