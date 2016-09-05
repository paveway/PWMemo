//
//  RightMenuViewController.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/09/01.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import UIKit
import XLForm

/**
 右メニュー画面

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class RightMenuViewController: BaseXLFormViewController {

    // MARK: - XLForm

    /**
     フォームの初期化を行う。
     */
    override func initializeForm() {
        // フォームを生成する。
        let form = XLFormDescriptor(title: "")



        self.form = form
    }
}
