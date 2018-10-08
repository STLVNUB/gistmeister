//
//	GitHubModelUserPlan.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class GitHubModelUserPlan : NSObject, NSCoding{
    
	var collaborators : Int!
	var name : String!
	var privateRepos : Int!
	var space : Int!
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		collaborators = json["collaborators"].intValue
		name = json["name"].stringValue
		privateRepos = json["private_repos"].intValue
		space = json["space"].intValue
	}
    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if collaborators != nil{
			dictionary["collaborators"] = collaborators
		}
		if name != nil{
			dictionary["name"] = name
		}
		if privateRepos != nil{
			dictionary["private_repos"] = privateRepos
		}
		if space != nil{
			dictionary["space"] = space
		}
		return dictionary
	}
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         collaborators = aDecoder.decodeObject(forKey: "collaborators") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         privateRepos = aDecoder.decodeObject(forKey: "private_repos") as? Int
         space = aDecoder.decodeObject(forKey: "space") as? Int

	}
    
    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if collaborators != nil{
			aCoder.encode(collaborators, forKey: "collaborators")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if privateRepos != nil{
			aCoder.encode(privateRepos, forKey: "private_repos")
		}
		if space != nil{
			aCoder.encode(space, forKey: "space")
		}
	}
}
