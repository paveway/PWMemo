//
//  LicenseInfoViewController.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/09/05.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import UIKit

/**
 ライセンス情報画面

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class LicenseInfoViewController: BaseWebViewController {

    // MARK: - Constants

    /// URLリスト
    private let kUrlList = [
        "https://github.com/ECSlidingViewController/ECSlidingViewController",
        "https://github.com/xmartlabs/XLForm",
        "https://github.com/illyabusigin/CYRTextView",
        "https://github.com/codestergit/SweetAlert-iOS",
        "https://github.com/dzenbot/DZNEmptyDataSet",
        "https://github.com/ninjinkun/NJKScrollFullScreen",
    ]

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

        // バナービューを設定する。
        setupBannerView(bannerView, delegate: self)

        let urlString = kUrlList[licenseNo]
        loadUrlData(urlString)
    }

    /**
     メモリ不足の時に呼び出される。
     */
    override func didReceiveMemoryWarning() {
        // スーパークラスのメソッドを呼び出す。
        super.didReceiveMemoryWarning()
    }
}
