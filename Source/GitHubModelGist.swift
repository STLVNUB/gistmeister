//
//	GitHubModelGist.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class GitHubModelGist : NSObject, NSCoding{
    
	var comments : Int!
	var commentsUrl : String!
	var commitsUrl : String!
	var createdAt : String!
	var descriptionField : String!
	var files : GitHubModelFile!
	var forks : [AnyObject]!
	var forksUrl : String!
	var gitPullUrl : String!
	var gitPushUrl : String!
	var history : [GitHubModelHistory]!
	var htmlUrl : String!
	var id : String!
	var nodeId : String!
	var owner : GitHubModelUser2!
	var publicField : Bool!
	var truncated : Bool!
	var updatedAt : String!
	var url : String!
	var user : String!
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		comments = json["comments"].intValue
		commentsUrl = json["comments_url"].stringValue
		commitsUrl = json["commits_url"].stringValue
		createdAt = json["created_at"].stringValue
		descriptionField = json["description"].stringValue
		let filesJson = json["files"]
		if !filesJson.isEmpty{
			files = GitHubModelFile(fromJson: filesJson)
		}
		forks = [AnyObject]()
		let forksArray = json["forks"].arrayValue
		for forksJson in forksArray{
            forks.append(forksJson.stringValue as AnyObject)
		}
		forksUrl = json["forks_url"].stringValue
		gitPullUrl = json["git_pull_url"].stringValue
		gitPushUrl = json["git_push_url"].stringValue
		history = [GitHubModelHistory]()
		let historyArray = json["history"].arrayValue
		for historyJson in historyArray{
			let value = GitHubModelHistory(fromJson: historyJson)
			history.append(value)
		}
		htmlUrl = json["html_url"].stringValue
		id = json["id"].stringValue
		nodeId = json["node_id"].stringValue
		let ownerJson = json["owner"]
		if !ownerJson.isEmpty{
			owner = GitHubModelUser2(fromJson: ownerJson)
		}
		publicField = json["public"].boolValue
		truncated = json["truncated"].boolValue
		updatedAt = json["updated_at"].stringValue
		url = json["url"].stringValue
        user = json["user"].stringValue
	}
    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if comments != nil{
			dictionary["comments"] = comments
		}
		if commentsUrl != nil{
			dictionary["comments_url"] = commentsUrl
		}
		if commitsUrl != nil{
			dictionary["commits_url"] = commitsUrl
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if files != nil{
			dictionary["files"] = files.toDictionary()
		}
		if forks != nil{
			dictionary["forks"] = forks
		}
		if forksUrl != nil{
			dictionary["forks_url"] = forksUrl
		}
		if gitPullUrl != nil{
			dictionary["git_pull_url"] = gitPullUrl
		}
		if gitPushUrl != nil{
			dictionary["git_push_url"] = gitPushUrl
		}
		if history != nil{
			var dictionaryElements = [[String:Any]]()
			for historyElement in history {
				dictionaryElements.append(historyElement.toDictionary())
			}
			dictionary["history"] = dictionaryElements
		}
		if htmlUrl != nil{
			dictionary["html_url"] = htmlUrl
		}
		if id != nil{
			dictionary["id"] = id
		}
		if nodeId != nil{
			dictionary["node_id"] = nodeId
		}
		if owner != nil{
			dictionary["owner"] = owner.toDictionary()
		}
		if publicField != nil{
			dictionary["public"] = publicField
		}
		if truncated != nil{
			dictionary["truncated"] = truncated
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
		}
		if url != nil{
			dictionary["url"] = url
		}
		if user != nil{
			dictionary["user"] = user
		}
		return dictionary
	}
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         comments = aDecoder.decodeObject(forKey: "comments") as? Int
         commentsUrl = aDecoder.decodeObject(forKey: "comments_url") as? String
         commitsUrl = aDecoder.decodeObject(forKey: "commits_url") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         files = aDecoder.decodeObject(forKey: "files") as? GitHubModelFile
         forks = aDecoder.decodeObject(forKey: "forks") as? [AnyObject]
         forksUrl = aDecoder.decodeObject(forKey: "forks_url") as? String
         gitPullUrl = aDecoder.decodeObject(forKey: "git_pull_url") as? String
         gitPushUrl = aDecoder.decodeObject(forKey: "git_push_url") as? String
         history = aDecoder.decodeObject(forKey: "history") as? [GitHubModelHistory]
         htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
         owner = aDecoder.decodeObject(forKey: "owner") as? GitHubModelUser2
         publicField = aDecoder.decodeObject(forKey: "public") as? Bool
         truncated = aDecoder.decodeObject(forKey: "truncated") as? Bool
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         user = aDecoder.decodeObject(forKey: "user") as? String

	}
    
    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if comments != nil{
			aCoder.encode(comments, forKey: "comments")
		}
		if commentsUrl != nil{
			aCoder.encode(commentsUrl, forKey: "comments_url")
		}
		if commitsUrl != nil{
			aCoder.encode(commitsUrl, forKey: "commits_url")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if files != nil{
			aCoder.encode(files, forKey: "files")
		}
		if forks != nil{
			aCoder.encode(forks, forKey: "forks")
		}
		if forksUrl != nil{
			aCoder.encode(forksUrl, forKey: "forks_url")
		}
		if gitPullUrl != nil{
			aCoder.encode(gitPullUrl, forKey: "git_pull_url")
		}
		if gitPushUrl != nil{
			aCoder.encode(gitPushUrl, forKey: "git_push_url")
		}
		if history != nil{
			aCoder.encode(history, forKey: "history")
		}
		if htmlUrl != nil{
			aCoder.encode(htmlUrl, forKey: "html_url")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if nodeId != nil{
			aCoder.encode(nodeId, forKey: "node_id")
		}
		if owner != nil{
			aCoder.encode(owner, forKey: "owner")
		}
		if publicField != nil{
			aCoder.encode(publicField, forKey: "public")
		}
		if truncated != nil{
			aCoder.encode(truncated, forKey: "truncated")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}
	}
}
