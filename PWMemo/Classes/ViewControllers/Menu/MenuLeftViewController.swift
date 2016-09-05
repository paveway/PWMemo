//
//  MenuLeftViewController.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/09/01.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import UIKit
import XLForm

/**
 左メニュー画面

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class MenuLeftViewController: BaseXLFormViewController {

    // MARK: - XLForm

    /**
     フォームの初期化を行う。
     */
    override func initializeForm() {
        let textAlignment = NSTextAlignment.Left.rawValue
        let accessoryType = UITableViewCellAccessoryType.DisclosureIndicator.rawValue
        let size: CGFloat = 44 * 0.65

        // フォームを生成する。
        let form = XLFormDescriptor(title: "")

        // ファイルセクション
        let fileSection = XLFormSectionDescriptor.formSectionWithTitle("ファイル")
        form.addFormSection(fileSection)

        let fileListRowTitle = "ファイル一覧"
        let fileListRow = XLFormRowDescriptor(tag: "About", rowType: XLFormRowDescriptorTypeButton, title: fileListRowTitle)
        fileListRow.cellConfig["textLabel.textAlignment"] = textAlignment
        fileListRow.cellConfig["accessoryType"] = accessoryType
        fileListRow.action.formSelector = #selector(fileListRowPressed(_:))

        let fileListImageName = "home.png"
        let fileListImage = ImageUtils.createImage(fileListImageName, width: size, height: size)
        fileListRow.cellConfig["imageView.image"] = fileListImage
        fileSection.addFormRow(fileListRow)

        // ヘルプセクションを作成する。
        let helpSection = XLFormSectionDescriptor.formSectionWithTitle("ヘルプ")
        form.addFormSection(helpSection)

        let settingRowTitle = "設定"
        let settingRow = XLFormRowDescriptor(tag: "About", rowType: XLFormRowDescriptorTypeButton, title: settingRowTitle)
        settingRow.cellConfig["textLabel.textAlignment"] = textAlignment
        settingRow.cellConfig["accessoryType"] = accessoryType
        settingRow.action.formSelector = #selector(settingRowPressed(_:))

        let settingImageName = "setting.png"
        let settingImage = ImageUtils.createImage(settingImageName, width: size, height: size)
        settingRow.cellConfig["imageView.image"] = settingImage
// TODO: 暫定
//        helpSection.addFormRow(settingRow)

        // このアプリについて行
        let aboutRowTitle = "このアプリについて"
        let aboutRow = XLFormRowDescriptor(tag: "About", rowType: XLFormRowDescriptorTypeButton, title: aboutRowTitle)
        aboutRow.cellConfig["textLabel.textAlignment"] = textAlignment
        aboutRow.cellConfig["accessoryType"] = accessoryType
        aboutRow.action.formSelector = #selector(aboutRowPressed(_:))

        let aboutImageName = "about.png"
        let aboutImage = ImageUtils.createImage(aboutImageName, width: size, height: size)
        aboutRow.cellConfig["imageView.image"] = aboutImage
        helpSection.addFormRow(aboutRow)

        // 更新履歴行
        let historyRowTitle = "更新履歴"
        let historyRow = XLFormRowDescriptor(tag: "History", rowType: XLFormRowDescriptorTypeButton, title: historyRowTitle)
        historyRow.cellConfig["textLabel.textAlignment"] = textAlignment
        historyRow.cellConfig["accessoryType"] = accessoryType
        let historyImageName = "history.png"
        let historyImage = ImageUtils.createImage(historyImageName, width: size, height: size)
        historyRow.cellConfig["imageView.image"] = historyImage
        historyRow.action.formSelector = #selector(historyRowPressed(_:))
        helpSection.addFormRow(historyRow)

        // ライセンス
        let licenseRowTitle = "ライセンス"
        let licenseRow = XLFormRowDescriptor(tag: "License", rowType: XLFormRowDescriptorTypeButton, title: licenseRowTitle)
        licenseRow.cellConfig["textLabel.textAlignment"] = textAlignment
        licenseRow.cellConfig["accessoryType"] = accessoryType
        let licenseImageName = "license.png"
        let licenseImage = ImageUtils.createImage(licenseImageName, width: size, height: size)
        licenseRow.cellConfig["imageView.image"] = licenseImage
        licenseRow.action.formSelector = #selector(licenseRowPressed(_:))
        helpSection.addFormRow(licenseRow)

        self.form = form
    }

    /**
     ファイル一覧行が押下された時に呼び出される。

     - Parameter sender: XLFormRowDescriptor
     */
    func fileListRowPressed(sender: XLFormRowDescriptor) {
        // 選択状態を解除する。
        deselectFormRow(sender)

        // ファイル一覧画面に遷移する。
        let vc = FileListViewController()
        resetTopView(vc)
    }

    /**
     設定行が押下された時に呼び出される。

     - Parameter sender: XLFormRowDescriptor
     */
    func settingRowPressed(sender: XLFormRowDescriptor) {
        // 選択状態を解除する。
        deselectFormRow(sender)
    }

    /**
     このアプリについて行が押下された時に呼び出される。

     - Parameter sender: XLFormRowDescriptor
     */
    func aboutRowPressed(sender: XLFormRowDescriptor) {
        // 選択状態を解除する。
        deselectFormRow(sender)

        let appName = EnvUtils.getAppName()
        let version = EnvUtils.getVersion()
        let title = "\(appName)"
        let message = "Ver.\(version)\nSimple text editor.\nCopyright(C) 2016 paveway.info.\nAll rights reserved."
        showAlert(title, message: message)
    }

    /**
     更新履歴行が押下された時に呼び出される。

     - Parameter sender: XLFormRowDescriptor
     */
    func historyRowPressed(sender: XLFormRowDescriptor) {
        // 選択状態を解除する。
        deselectFormRow(sender)

        // 更新履歴画面に遷移する。
        let vc = HistoryViewController()
        resetTopView(vc)
    }

    /**
     ライセンス行が押下された時に呼び出される。

     - Parameter sender: XLFormRowDescriptor
     */
    func licenseRowPressed(sender: XLFormRowDescriptor) {
        // 選択状態を解除する。
        deselectFormRow(sender)

        // ライセンス一覧画面に遷移する。
        let vc = LicenseListViewController()
        resetTopView(vc)
    }
}
