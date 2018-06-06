//
//  ViewController.swift
//  XmlParsing
//
//  Created by Sasi Gadu on 09/02/18.
//  Copyright © 2018 Sms country. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var mytableView: UITableView!
    var apimanager : [ApiManager] = [ApiManager] ()
    let theatres = Theatres()
    var outputArray = NSMutableArray()
    let cusObj = xmlParsingModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.sendRequest(url: "http://staging.api.bhcinema.com/v1.0/GetAllLocations", httpMethod: "POST") { (data) in

        
            self.cusObj.initWithParseData(data: data , successresponse: { (dictofResponse : NSMutableArray) in
                
                print(dictofResponse)
                self.outputArray = dictofResponse
                print(self.outputArray)
                
                DispatchQueue.main.async {
                    
                                    self.mytableView.reloadData()
                                }
                    
                }, failureresponse: { (error : Error) in
                    print(error)
                    DispatchQueue.main.sync(execute: {
                        
                       
                    })
                })
                
            }
}



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outputArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let dic = outputArray[indexPath.row] as! NSDictionary
        cell.lblName.text = dic.value(forKey: "0") as? String
        cell.lblAddress.text = dic.value(forKey: "1") as? String

            return cell

    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

