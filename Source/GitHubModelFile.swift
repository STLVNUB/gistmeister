//
//	GitHubModelFile.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class GitHubModelFile : NSObject, NSCoding{
    
	var sampleGist : GitHubModelSampleGist!
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		let sampleGistJson = json["SampleGist"]
		if !sampleGistJson.isEmpty{
			sampleGist = GitHubModelSampleGist(fromJson: sampleGistJson)
		}
	}
    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if sampleGist != nil{
			dictionary["SampleGist"] = sampleGist.toDictionary()
		}
		return dictionary
	}
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         sampleGist = aDecoder.decodeObject(forKey: "SampleGist") as? GitHubModelSampleGist

	}
    
    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if sampleGist != nil{
			aCoder.encode(sampleGist, forKey: "SampleGist")
		}
	}
}
