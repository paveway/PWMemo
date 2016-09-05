//
//  LicenseListViewController.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/09/02.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import UIKit
import SVWebViewController

/**
 ライセンス一覧画面

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class LicenseListViewController: BaseTableViewController {

    // MARK: - Constants

    /// 画面タイトル
    private let kScreenTitle = "ライセンス一覧"

    /// セルタイトルリスト
    private let kCellTitleList = [
        "ECSlidingViewController",
        "XLForm",
        "CYRTextView",
        "SweetAlert-iOS",
        "DZNEmptyDataSet",
        "NJKScrollFullScreen",
        "SVWebViewController",
    ]

    /// セルタイトルインデックス
    private enum kCellTitleIndex: Int {
        case ECSlidingViewController
        case XLForm
        case CYRTextView
        case SweetAlert_iOS
        case DZNEmptyDataSet
        case NJKScrollFullScreen
    }

    /// URLリスト
    private let kUrlList = [
        "https://github.com/ECSlidingViewController/ECSlidingViewController",
        "https://github.com/xmartlabs/XLForm",
        "https://github.com/illyabusigin/CYRTextView",
        "https://github.com/codestergit/SweetAlert-iOS",
        "https://github.com/dzenbot/DZNEmptyDataSet",
        "https://github.com/ninjinkun/NJKScrollFullScreen",
        "https://github.com/TransitApp/SVWebViewController",
    ]

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

        // テーブルビューを設定する。
        setupTableView()

        // バナービューを設定する。
        setupBannerView(bannerView, delegate: self)
    }

    /**
     メモリ不足の時に呼び出される。
     */
    override func didReceiveMemoryWarning() {
        // スーパークラスのメソッドを呼び出す。
        super.didReceiveMemoryWarning()
    }

    // MARK: - UITableViewDataSource

    /**
     セクション内のセル数を返却する。

     - parameter tableView: テーブルビュー
     - parameter section: セクション番号
     - Returns: セクション内のセル数
     */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = kCellTitleList.count
        return count
    }

    /**
     セルを返却する。

     - parameter tableView: テーブルビュー
     - parameter indexPath: インデックスパス
     :return: セル
     */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得する。
        let cell = getTableViewCell()

        // セルにタイトルを設定する。
        cell.textLabel!.text = kCellTitleList[indexPath.row]
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .ByWordWrapping

        // アクセサリタイプを設定する。
        cell.accessoryType = .DetailDisclosureButton

        // セルを返却する。
        return cell
    }

    // MARK: - UITableViewDelegate

    /**
     セルが選択された時に呼び出される。

     - parameter tableView: テーブルビュー
     - parameter indexPath: インデックスパス
     　   */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 選択状態を解除する。
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        // ライセンス内容画面に遷移する。
        let vc = LicenseContentViewController(licenseNo: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }

    /**
     アクセサリボタンが押下された時に呼び出される。

     - parameter tableView: テーブルビュー
     - parameter indexPath: インデックスパス
     */
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        // ライセンス情報画面に遷移する。
        let row = indexPath.row
        let urlString = kUrlList[row]
        let vc = SVWebViewController(address: urlString)
        navigationController?.pushViewController(vc, animated: true)
    }
}
