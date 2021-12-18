//
//  ssViewController.swift
//  html
//
//  Created by Ankit Rana on 18/12/21.
//

import UIKit
import SwiftSoup

class ssViewController: UIViewController {
    let html1 = "<ul><li><a href=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/Internal Job Posting Policy - Baldota Group.pdf\" style=\"color : white;\" target=\"_blank\">Internal Job Posting Policy</a> <img src=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/new1.gif\" style=\"height:12px\" /></li>\r\n\r\n<li><a style=\"color : white;\" href=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/Job Rotation Policy - Baldota Group.pdf\" target=\"_blank\">Job Rotation Policy</a> <img src=\"https://bnest.baldotagroup.in/pages/by4hm8ur/announcementCirculars/new1.gif\" style=\"height:12px\" /></li></ul>"
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {

            for element in try SwiftSoup.parse(html1).select("a")
            {
                self.array.append(try element.attr("href"))
            }
            print(self.array)
            
     }
        catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        }
        catch {
            print("error")
        }
        // Do any additional setup after loading the view.
     
     
        
    }



}
