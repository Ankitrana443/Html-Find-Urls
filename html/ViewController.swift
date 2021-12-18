//
//  ViewController.swift
//  html
//
//  Created by Ankit Rana on 17/12/21.
//

import UIKit
import WebKit
import SwiftSoup

class ViewController: UIViewController {
    @IBOutlet weak var wk: WKWebView!

    var  ab = [String]()
    @IBOutlet weak var ankit: UILabel!
    
    override func viewDidLoad() {
        do {
            let html1 = "<ul><li><a href=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/Internal Job Posting Policy - Baldota Group.pdf\" style=\"color : white;\" target=\"_blank\">Internal Job Posting Policy</a> <img src=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/new1.gif\" style=\"height:12px\" /></li>\r\n\r\n<li><a style=\"color : white;\" href=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/Job Rotation Policy - Baldota Group.pdf\" target=\"_blank\">Job Rotation Policy</a> <img src=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/new1.gif\" style=\"height:12px\" /></li></ul>"
            let doc: Document = try SwiftSoup.parse(html1)
            let a : Element = try doc.select("a").first()!
            let link = try a.attr("href")
            print(link)
            
            
            
            //----------================SHOWING PDF ++++++===========================
            let mainurl = link.replacingOccurrences(of: " ", with: "%20")
            wk.load(NSURLRequest(url: NSURL(string: mainurl)! as URL) as URLRequest)
            
        
        }
        catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        }
        catch {
            print("error")
        }
     
        
//        let str = "https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/Internal Job Posting Policy - Baldota Group.pdf"
//        let replaced = str.replacingOccurrences(of: " ", with: "%20")
//        print(replaced)
//
//        wk.load(NSURLRequest(url: NSURL(string: replaced)! as URL) as URLRequest)
        
      
    }

    @IBAction func btn(_ sender: Any) {
    
        downloadFile()
    
    }
    
    func downloadFile(){
            let url = "https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/Internal%20Job%20Posting%20Policy%20-%20Baldota%20Group.pdf"
            let fileName = "MyFile"
            
            savePdf(urlString: url, fileName: fileName)
          
        }

        func savePdf(urlString:String, fileName:String) {
                DispatchQueue.main.async {
                    let url = URL(string: urlString)
                    let pdfData = try? Data.init(contentsOf: url!)
                    let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
                    let pdfNameFromUrl = "YourAppName-\(fileName).pdf"
                    let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
                    do {
                        try pdfData?.write(to: actualPath, options: .atomic)
                        print("pdf successfully saved!")
        //file is downloaded in app data container, I can find file from x code > devices > MyApp > download Container >This container has the file
                    } catch {
                        print("Pdf could not be saved")
                    }
                }
            }
}


