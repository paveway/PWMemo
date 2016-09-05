//
//  BaseTableVIewController.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/08/24.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import Foundation
import DZNEmptyDataSet
import SWTableViewCell
import NJKScrollFullScreen

/**
 基底テーブルクラス

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class BaseTableViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, SWTableViewCellDelegate, NJKScrollFullscreenDelegate {

    // MARK: - Constants

    /// セル名
    let kCellName = "Cell"

    // MARK: - Variables

    /// テーブルビュー
    @IBOutlet weak var tableView: UITableView!

    var scrollProxy: NJKScrollFullScreen!

    // MARK: - UIViewController

    /**
     インスタンスが生成された時に呼び出される。
     */
    override func viewDidLoad() {
        // スーパークラスのメソッドを呼び出す。
        super.viewDidLoad()

        // テーブルビューを設定する。
        setupTableView()
    }

    // MARK: - UITableViewDataSource

    /**
     セクションのセル数を返却する。

     - Parameter tableView: テーブルビュー
     - Parameter section: セクション番号
     - Returns: セル数
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    /**
     セルを返却する。

     - Parameter tableView: テーブルビュー
     - Parameter indexPath: インデックスパス
     - Returns: セル
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = getSWTableViewCell()
        return cell
    }

    // MARK: - UITableViewDelegate

    /**
     セルが選択された時に呼び出される。

     - Parameter tableView: テーブルビュー
     - Parameter indexPath: インデックスパス
     */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

    /**
     テーブルビューを設定する。
     */
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        scrollProxy = NJKScrollFullScreen(forwardTarget: self)
        tableView.delegate = scrollProxy
        scrollProxy.delegate = self
    }

    func getTableViewCell(style: UITableViewCellStyle = .Default) -> UITableViewCell {
        // セルを取得する。
        var cell = tableView.dequeueReusableCellWithIdentifier(kCellName) as UITableViewCell?
        if (cell == nil) {
            // セルが取得できない場合
            // セルを生成する。
            cell = UITableViewCell(style: style, reuseIdentifier: kCellName)
        }

        cell!.textLabel?.text = ""
        cell!.accessoryType = .None

        return cell!
    }

    /**
     テーブルビューセルを返却する。

     - Parameter tableView: テーブルビュー
     - Returns: テーブルビューセル
     */
    func getSWTableViewCell(style: UITableViewCellStyle = .Default) -> SWTableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(kCellName) as? SWTableViewCell
        if cell == nil {
            cell = SWTableViewCell(style: style, reuseIdentifier: kCellName)
            let leftUtilityButtons = createLeftUtilityButtons()
            if leftUtilityButtons != nil {
                cell!.leftUtilityButtons = leftUtilityButtons! as [AnyObject]
            }
            let rightUtilityButtons = createRightUtilityButtons()
            if rightUtilityButtons != nil {
                cell!.rightUtilityButtons = rightUtilityButtons! as [AnyObject]
            }
            cell!.delegate = self
        }
        return cell!
    }

    /**
     左セルボタン配列を生成する。
     サブクラスで実装する。
 
     - Returns: 左セルボタン配列
     */
    func createLeftUtilityButtons() -> NSMutableArray? {
        return nil
    }

    /**
     右セルボタン配列を生成する。
     サブクラスで実装する。

     - Returns: 右セルボタン配列
     */
    func createRightUtilityButtons() -> NSMutableArray? {
        return nil
    }

    // MARK: - DZNEmptyDataSet

    /**
     空データ時のタイトルを返却する。

     - Returns: タイトル
     */
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "データなし"
        let attributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0),
            NSForegroundColorAttributeName: UIColor.lightGrayColor(),
            ]
        let title = NSAttributedString(string: text, attributes: attributes)
        return title
    }

    // MARK: - NJKScrollFullScreenDelegate

    func scrollFullScreen(fullScreenProxy: NJKScrollFullScreen!, scrollViewDidScrollUp deltaY: CGFloat) {
        moveNavigationBar(deltaY, animated: true)
        moveToolbar(-deltaY, animated: true)
    }
    func scrollFullScreen(fullScreenProxy: NJKScrollFullScreen!, scrollViewDidScrollDown deltaY: CGFloat) {
        moveNavigationBar(deltaY, animated: true)
        moveToolbar(-deltaY, animated: true)
    }
    func scrollFullScreenScrollViewDidEndDraggingScrollUp(fullScreenProxy: NJKScrollFullScreen!) {
        hideNavigationBar(true)
        hideToolbar(true)
    }
    func scrollFullScreenScrollViewDidEndDraggingScrollDown(fullScreenProxy: NJKScrollFullScreen!) {
        showNavigationBar(true)
        showToolbar(true)
    }
}