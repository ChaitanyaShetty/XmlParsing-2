
//
//  XMLParserModel.swift
//  XmlParsing
//
//  Created by Sasi Gadu on 12/02/18.
//  Copyright © 2018 Sms country. All rights reserved.
//

import Foundation

//protocol CustomXMLParsing {
//    func parse(value:NSMutableArray)
//}

class xmlParsingModel : CommonParser,XMLParserDelegate{
  
    var outputArray = NSMutableArray()
    var boolValue : Bool = false
    let theatres = Theatres()
    var erroris : Error?
    
    
    
    func initWithParseData(data: Data, successresponse : successParserResponse,
                           failureresponse : failiureParserResponse) {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        
        if erroris == nil {
            successresponse(outputArray)
        }
        else{
            failureresponse(erroris!)
        }
        
    }
    
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        

    if elementName == ParserConstants.APIResponseKey  &&
            attributeDict[ParserConstants.APIStatusKey]! == "True"
            {
        boolValue = true
        }
        
        if boolValue == true{
            
            if elementName == ParserConstants.TheaterKey {
                
                theatres.name = String(describing: attributeDict["name"]!)
                theatres.address = String(describing: attributeDict["address"]!)
               
                let responseDictIs = NSMutableDictionary()
                responseDictIs.setValue( theatres.name, forKey: "0")
                responseDictIs.setValue(theatres.address, forKey: "1")
                if outputArray.contains(responseDictIs) == false{
                                outputArray.add(responseDictIs)
                            } else {
                    
                            }
            }
            
        }
        
        
        

        
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
    
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == ParserConstants.TheaterKey {
//            responseDictIs.setObject(outputArray, forKey:"Theatres" as NSCopying)
//        }
//        if elementName == ParserConstants.APIResponseKey {
//
//        }
//    }
    

    
}


