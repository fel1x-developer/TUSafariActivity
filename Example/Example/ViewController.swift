//
//  ViewController.swift
//  Example
//
//  Created by Minsoo Choo on 2024-07-25.
//

import UIKit
import WebKit

import TUSafariActivity

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://github.com/fel1x-developer/TUSafariActivity")!
        webView.load(URLRequest(url: url))
    }
    
    @IBAction func share(_ sender: Any) {
        let url = self.webView.url!
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: [TUSafariActivity()])
        
        activityViewController.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem;
        present(activityViewController, animated: true, completion: nil)
    }
}

