//
//  BaseWebViewController.swift
//  PWSimpleEditor
//

import UIKit

/**
 基底Webビュークラス

 - Version: 1.0 新規作成
 - Authoer: paveway.info@gmail.com
 */
class BaseWebViewController: BaseViewController {

    // MARK: - Variables

    /// Webビュー
    @IBOutlet weak var webView: UIWebView!

    /**
     ファイルデータをロードする。

     - Parameter fileName: ファイル名
     - Parameter fileExtesion: ファイル拡張子
     */
    func loadFileData(fileName: String, fileExtesion: String) {
        let bundle = NSBundle.mainBundle()
        if let path = bundle.pathForResource(fileName, ofType: fileExtesion) {
            if let data = NSData(contentsOfFile: path) {
                if let baseURL = NSURL(string: "") {
                    webView.loadData(data, MIMEType: "text/plain", textEncodingName: "UTF-8", baseURL: baseURL)
                }
            }
        }
    }

    /**
     URLデータをロードする。
 
     - Parameter urlString: URL文字列
     */
    func loadUrlData(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }
}