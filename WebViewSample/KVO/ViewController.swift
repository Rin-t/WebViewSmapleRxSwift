//
//  ViewController.swift
//  WebViewSample
//
//  Created by Rin on 2021/09/17.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }

    private func setupWebView() {
        // webView.isLoadingの値の変化を監視
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)

        // webView.estimatedProgressの値の変化を監視
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)

        let url = URL(string: "https://www.google.com/?hl=ja")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        progressView.setProgress(0.1, animated: true)
    }

    deinit {
        webView.removeObserver(self, forKeyPath: "loading")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            UIApplication.shared
                .isNetworkActivityIndicatorVisible = webView.isLoading
            if !webView.isLoading {
                progressView.setProgress(0.0, animated: false)
                navigationItem.title = webView.title
            }
        }

        if keyPath == "estimatedProgress" {
            progressView
                .setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
}

