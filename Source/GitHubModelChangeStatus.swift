//
//	GitHubModelChangeStatus.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class GitHubModelChangeStatus : NSObject, NSCoding{
    
	var additions : Int!
	var deletions : Int!
	var total : Int!
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		additions = json["additions"].intValue
		deletions = json["deletions"].intValue
		total = json["total"].intValue
	}
    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if additions != nil{
			dictionary["additions"] = additions
		}
		if deletions != nil{
			dictionary["deletions"] = deletions
		}
		if total != nil{
			dictionary["total"] = total
		}
		return dictionary
	}
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         additions = aDecoder.decodeObject(forKey: "additions") as? Int
         deletions = aDecoder.decodeObject(forKey: "deletions") as? Int
         total = aDecoder.decodeObject(forKey: "total") as? Int

	}
    
    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if additions != nil{
			aCoder.encode(additions, forKey: "additions")
		}
		if deletions != nil{
			aCoder.encode(deletions, forKey: "deletions")
		}
		if total != nil{
			aCoder.encode(total, forKey: "total")
		}
	}
}
