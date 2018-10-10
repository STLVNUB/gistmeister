//
//	GitHubModelGistDetails.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class GitHubModelGistDetails : NSObject, NSCoding{
    
	var content : String!
	var filename : String!
	var language : String!
	var rawUrl : String!
	var size : Int!
	var truncated : Bool!
	var type : String!
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		content = json["content"].stringValue
		filename = json["filename"].stringValue
		language = json["language"].stringValue
		rawUrl = json["raw_url"].stringValue
		size = json["size"].intValue
		truncated = json["truncated"].boolValue
		type = json["type"].stringValue
	}
    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if content != nil{
			dictionary["content"] = content
		}
		if filename != nil{
			dictionary["filename"] = filename
		}
		if language != nil{
			dictionary["language"] = language
		}
		if rawUrl != nil{
			dictionary["raw_url"] = rawUrl
		}
		if size != nil{
			dictionary["size"] = size
		}
		if truncated != nil{
			dictionary["truncated"] = truncated
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         content = aDecoder.decodeObject(forKey: "content") as? String
         filename = aDecoder.decodeObject(forKey: "filename") as? String
         language = aDecoder.decodeObject(forKey: "language") as? String
         rawUrl = aDecoder.decodeObject(forKey: "raw_url") as? String
         size = aDecoder.decodeObject(forKey: "size") as? Int
         truncated = aDecoder.decodeObject(forKey: "truncated") as? Bool
         type = aDecoder.decodeObject(forKey: "type") as? String

	}
    
    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if content != nil{
			aCoder.encode(content, forKey: "content")
		}
		if filename != nil{
			aCoder.encode(filename, forKey: "filename")
		}
		if language != nil{
			aCoder.encode(language, forKey: "language")
		}
		if rawUrl != nil{
			aCoder.encode(rawUrl, forKey: "raw_url")
		}
		if size != nil{
			aCoder.encode(size, forKey: "size")
		}
		if truncated != nil{
			aCoder.encode(truncated, forKey: "truncated")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
	}
}
