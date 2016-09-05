//
//  HistoryViewController.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/09/02.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import UIKit

/**
 更新履歴画面

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class HistoryViewController: BaseWebViewController {

    // MARK: - Constants

    private let kScreenTitle = "更新履歴"

    /// 更新履歴ファイル名
    let kHistoryFileName = "History"

    /// 更新履歴ファイル拡張子
    let kHistoryFileExtension = "txt"

    // MARK: - UIViewController

    /**
     インスタンスが生成された時に呼び出される。
     */
    override func viewDidLoad() {
        // スーパークラスのメソッドを呼び出す。
        super.viewDidLoad()

        // 画面タイトルを設定する。
        navigationItem.title = kScreenTitle

        // 左上メニューバーボタンを生成する。
        createLeftMenuBarButton()

        // バナービューを設定する。
        setupBannerView(bannerView, delegate: self)

        // 更新履歴データをロードする。
        loadFileData(kHistoryFileName, fileExtesion: kHistoryFileExtension)
    }

    /**
     メモリ不足の時に呼び出される。
     */
    override func didReceiveMemoryWarning() {
        // スーパークラスのメソッドを呼び出す。
        super.didReceiveMemoryWarning()
    }
}
