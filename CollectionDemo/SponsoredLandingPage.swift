//
//  SponsoredLandingPage.swift
//  CollectionDemo
//
//  Created by Derek Haller on 7/20/21.
//  Copyright © 2021 Nativo. All rights reserved.
//

import UIKit
import NativoSDK

class SponsoredLandingPage: UIViewController, NtvLandingPageInterface {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var contentWKWebView: WKWebView!
    
    func handleExternalLink(_ link: URL) {
    // Open externally in Safari or create new web view to load in-app
        UIApplication.shared.open(link, options: [:], completionHandler: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
