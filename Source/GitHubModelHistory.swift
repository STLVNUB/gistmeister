//
//	GitHubModelHistory.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class GitHubModelHistory : NSObject, NSCoding{
    
	var changeStatus : GitHubModelChangeStatus!
	var committedAt : String!
	var url : String!
	var user : GitHubModelUser2!
	var version : String!
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		let changeStatusJson = json["change_status"]
		if !changeStatusJson.isEmpty{
			changeStatus = GitHubModelChangeStatus(fromJson: changeStatusJson)
		}
		committedAt = json["committed_at"].stringValue
		url = json["url"].stringValue
		let userJson = json["user"]
		if !userJson.isEmpty{
			user = GitHubModelUser2(fromJson: userJson)
		}
		version = json["version"].stringValue
	}
    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if changeStatus != nil{
			dictionary["change_status"] = changeStatus.toDictionary()
		}
		if committedAt != nil{
			dictionary["committed_at"] = committedAt
		}
		if url != nil{
			dictionary["url"] = url
		}
		if user != nil{
			dictionary["user"] = user.toDictionary()
		}
		if version != nil{
			dictionary["version"] = version
		}
		return dictionary
	}
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         changeStatus = aDecoder.decodeObject(forKey: "change_status") as? GitHubModelChangeStatus
         committedAt = aDecoder.decodeObject(forKey: "committed_at") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         user = aDecoder.decodeObject(forKey: "user") as? GitHubModelUser2
         version = aDecoder.decodeObject(forKey: "version") as? String

	}
    
    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if changeStatus != nil{
			aCoder.encode(changeStatus, forKey: "change_status")
		}
		if committedAt != nil{
			aCoder.encode(committedAt, forKey: "committed_at")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}
		if version != nil{
			aCoder.encode(version, forKey: "version")
		}
	}
}
