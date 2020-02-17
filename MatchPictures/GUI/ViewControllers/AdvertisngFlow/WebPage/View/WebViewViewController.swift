//
//  WebPageViewController.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit
import WebKit

final class WebViewViewController: UIViewController {

    @IBOutlet weak private var webView: WKWebView!
    @IBOutlet weak private var errorLabel: UILabel!

    private let model: WebViewModelProtocol

    private var errorText: String? {
        didSet {
            errorLabel.text = errorText
            errorLabel.isHidden = errorText == nil
        }
    }

    // MARK: - Init/Deinit

    init(model: WebViewModelProtocol) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.all]
    }

    // MARK: - Logic

    private func loadWebPage() {
        guard let request: URLRequest = model.webPageRequest else {
            errorText = "Can't load page"
            return
        }

        errorText = nil
        startLoading()
        webView.navigationDelegate = self
        webView.load(request)
    }
}

// MARK: - Loadable
extension WebViewViewController: Loadable { }

// MARK: - WKNavigationDelegate
extension WebViewViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopLoading()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        stopLoading()
        errorLabel.text = error.localizedDescription
    }

}
