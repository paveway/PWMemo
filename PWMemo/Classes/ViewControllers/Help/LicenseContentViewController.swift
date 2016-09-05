//
//  LicenseContentViewController.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/09/05.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import UIKit

/**
 ライセンス内容画面

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class LicenseContentViewController: BaseWebViewController {

    // MARK: - Constants

    /// 画面タイトルリスト
    let kTitleList = [
        "ECSlidingViewController",
        "XLForm",
        "CYRTextView",
        "SweetAlert-iOS",
        "DZNEmptyDataSet",
        "NJKScrollFullScreen",
        "SVWebViewController",
    ]

    /// ライセンスファイル名リスト
    let kLicenseFileNameList = [
        "ECSlidingViewControllerLicense",
        "XLFormLicense",
        "CYRTextViewLicense",
        "SweetAlert_iOSLicense",
        "DZNEmptyDataSetLicense",
        "NJKScrollFullScreenLicense",
        "SVWebViewControllerLicense",
    ]

    /// ライセンスファイル拡張子
    let kLicenseFileExtention = "txt"

    

    // MARK: - Variables

    /// ライセンス番号
    private var licenseNo: Int

    // MARK: - Initializer

    /**
     イニシャライザ

     - Parameter aDecoder: デコーダー
     */
    required init(coder aDecoder: NSCoder) {
        fatalError()
    }

    /**
     イニシャライザ

     - Parameter licenseNo: ライセンス番号
     */
    init(licenseNo: Int) {
        // 引数を保存する。
        self.licenseNo = licenseNo

        // スーパークラスのイニシャライザを呼び出す。
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - UIViewController

    /**
     インスタンスが生成された時に呼び出される。
     */
    override func viewDidLoad() {
        // スーパークラスのメソッドを呼び出す。
        super.viewDidLoad()

        // 画面タイトルを設定する。
        navigationItem.title = kTitleList[licenseNo]

        // バナービューを設定する。
        setupBannerView(bannerView, delegate: self)

        // ライセンスファイルデータをロードする。
        let fileName = kLicenseFileNameList[licenseNo]
        loadFileData(fileName, fileExtesion: kLicenseFileExtention)
    }

    /**
     メモリ不足の時に呼び出される。
     */
    override func didReceiveMemoryWarning() {
        // スーパークラスのメソッドを呼び出す。
        super.didReceiveMemoryWarning()
    }
}
