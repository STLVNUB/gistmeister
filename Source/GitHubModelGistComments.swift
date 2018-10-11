//
//	GitHubModelGistComments.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class GitHubModelGistComments : NSObject, NSCoding{
    
	var authorAssociation : String!
	var body : String!
	var createdAt : String!
	var id : Int!
	var nodeId : String!
	var updatedAt : String!
	var url : String!
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		authorAssociation = json["author_association"].stringValue
		body = json["body"].stringValue
		createdAt = json["created_at"].stringValue
		id = json["id"].intValue
		nodeId = json["node_id"].stringValue
		updatedAt = json["updated_at"].stringValue
		url = json["url"].stringValue
	}
    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if authorAssociation != nil{
			dictionary["author_association"] = authorAssociation
		}
		if body != nil{
			dictionary["body"] = body
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if id != nil{
			dictionary["id"] = id
		}
		if nodeId != nil{
			dictionary["node_id"] = nodeId
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         authorAssociation = aDecoder.decodeObject(forKey: "author_association") as? String
         body = aDecoder.decodeObject(forKey: "body") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
	}
    
    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if authorAssociation != nil{
			aCoder.encode(authorAssociation, forKey: "author_association")
		}
		if body != nil{
			aCoder.encode(body, forKey: "body")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if nodeId != nil{
			aCoder.encode(nodeId, forKey: "node_id")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
	}
}
