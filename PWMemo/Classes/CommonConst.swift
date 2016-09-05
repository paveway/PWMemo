//
//  CommonConst.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/08/25.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import Foundation

/// コンフィグ
struct Config {
    /// ファイル名
    static let kFilename = "Config"

    /// ファイルタイプ
    static let kType = "txt"

    /// キー
    struct Key {
        /// Admob AD ユニットID
        static let kAdmobAdUnitId = "admobAdUnitId"

        /// Admob AD テストデバイスID
        static let kAdmobAdTestDeviceIds = "admobAdTestDevice"
    }
}

/// ファイル
struct File {
    /// ルートディレクトリ
    static let kRootDir = "PWSimpleEditor"
}

/// フォント
struct Font {
     /// フォントファミリー名情報
    struct FontFamilyName {
        static let kCourierNew = "CourierNew"
        static let kArial = "Arial"
        static let kSourceHanCodeJp = "SourceHanCodeJP"
    }

    /// フォントファミリー名インデックス
    enum FontFamilyNameIndex {
        case kCourierNew
        case kArial
        case kSourceHanCodeJp
    }

    /// フォントファミリー名リスト
    static let FontFamilyNameList = [
        FontFamilyName.kCourierNew,
        FontFamilyName.kArial,
        FontFamilyName.kSourceHanCodeJp
    ]

    /// フォント名
    struct FontName {
        /// CourierNew(Normal)
        static let kCourierNewNormal = "CourierNewPSMT"

        /// CourierNew(Italic)
        static let kCourierNewItalic = "CourierNewPS-ItalicMT"

        /// CourierNew(Bold)
        static let kCourierNewBold = "CourierNewPS-BoldMT"

        /// CourierNew(Bold Italic)
        static let kCourierNewBoldItalic = "CourierNewPS-BoldItalicMT"

        /// Arial(Normal)
        static let kArialNormal = "ArialMT"

        /// Arial(Italic)
        static let kArialItalic = "Arial-ItalicMT"

        /// Arial(Bold)
        static let kArialBold = "Arial-BoldMT"

        /// Arial(Bold Italic)
        static let kArialBoldItalic = "Arial-BoldItalicMT"

        /// Source Han Code JP(Normal)
        static let kSourceHanCodeJpNormal = "SourceHanCodeJP-Normal"

        /// Source Han Code JP(Normal Italic)
        static let kSourceHanCodeJpNormalItalic = "SourceHanCodeJP-NormalIt"

        /// Source Han Code JP(Bold)
        static let kSourceHanCodeJpBold = "SourceHanCodeJP-Bold"

        /// Source Han Code JP(Bold Italic)
        static let kSourceHanCodeJpBoldItalic = "SourceHanCodeJP-BoldIt"
    }

    /// フォント名インデックス
    enum FontNameIndex {
        case kCourierNewNormal
        case kArialNormal
        case kSourceHanCodeJpNormal
    }

    /// フォント名リスト
    static let FontNameList = [
        FontName.kCourierNewNormal,
        FontName.kArialNormal,
        FontName.kSourceHanCodeJpNormal
    ]
}

struct SlidingViewController {
    static let kShadowOpacity: CGFloat = 0.75
    static let kShadowRadius: CGFloat = 5.0
    static let kShadowColor = UIColor.blueColor().CGColor
}