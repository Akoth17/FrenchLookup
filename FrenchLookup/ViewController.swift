//
//  ViewController.swift
//  FrenchLookup
//
//  Created by Andrew Koth on 3/12/15.
//  Copyright (c) 2015 Andrew Koth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appsWebView: UIWebView!
    var htmlView: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCNRTL("manger")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchCNRTL(searchTerm: String) {
        if let cnrtlSearchTerm = searchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://cnrtl.fr/definition/\(cnrtlSearchTerm)"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                println("Task completed")
                if(error != nil) {
                    println(error.localizedDescription)
                }
                var err: NSError?
                
                var htmlResult = NSString(contentsOfURL: url!, encoding: NSUTF8StringEncoding, error: &err)
                if(err != nil) {
                    println("HTMLError \(err!.localizedDescription)")
                }
                self.htmlView = htmlResult
                println(htmlResult)
                
            })
            task.resume()
        }
    }
}

