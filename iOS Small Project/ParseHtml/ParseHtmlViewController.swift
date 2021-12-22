//
//  ParseHtmlViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/22.
//

import UIKit
import HTMLKit
import WebKit
import StoreKit

class ParseHtmlViewController: UIViewController {

    
    
    private let webView: WKWebView = {
        let prefs = WKPreferences()
        
        
        prefs.javaScriptCanOpenWindowsAutomatically = true
        let config = WKWebViewConfiguration()
        
        config.preferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    let urlString = "https://www.google.com/search?q=%EA%B0%95%EC%95%84%EC%A7%80&source=lnms&tbm=isch&sa=X&ved=2ahUKEwix-KPhz_f0AhWNwJQKHc5nDPQQ_AUoAXoECAEQAw&biw=1440&bih=821&dpr=2"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(webView)
        webView.navigationDelegate = self
        webView.frame = self.view.bounds
        
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    



}


extension ParseHtmlViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // parsing
        parseImages()
        
        
    }
    
    func parseImages() {
        // <img src = "..." />
        webView.evaluateJavaScript("document.body.innerHTML") { result, error in
            guard let html = result as? String, error == nil else {
                print("Failed to get html string")
                return
            }
            
            // MARK: - HTMLKit pod 있을 때
            
            //print(html)
            let document = HTMLDocument(string: html)
            let images: [String] = document.querySelectorAll("img").compactMap({ element in
                guard let src = element.attributes["src"] as? String else {
                    return nil
                }
                return src
            })
            print("Found \(images.count) images")

            for src in images {
                print(src + "\n\n\n")
            }
        }
    }
}
