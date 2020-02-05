//
//  LabelEntity.swift
//  swiftautosuggest
//
//  Created by Don Clore on 2/2/20.
//

import Foundation

struct LabelList: Codable {
  let labels: [LabelEntity]
}

struct LabelEntity: Codable {
  enum CodingKeys: String, CodingKey {
    case images = "Images"
    case id = "Id"
    case name = "Name"
    case contactInfo = "ContactInfo"
    case profile = "Profile"
    case dataQuality = "DataQuality"
  }
  let images: [LabelImage]?
  let id: Int
  
  var name: String
  var contactInfo: String?
  var profile: String?
  var dataQuality: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: CodingKeys.id)
    name = try values.decode(String.self, forKey: CodingKeys.name).trimmingCharacters(in: .whitespacesAndNewlines)
    contactInfo = try values.decode(String?.self, forKey: CodingKeys.contactInfo)?.trimmingCharacters(in: .whitespacesAndNewlines)
    dataQuality = try values.decode(String?.self, forKey: CodingKeys.dataQuality)?.trimmingCharacters(in: .whitespacesAndNewlines)
    profile = try values.decode(String?.self, forKey: CodingKeys.profile)?.trimmingCharacters(in: .whitespacesAndNewlines)
    images = try values.decode([LabelImage]?.self, forKey: CodingKeys.images)
  }
  
}




struct LabelImage: Codable {
  enum CodingKeys: String, CodingKey {
    case height = "Height"
    case imageType = "ImageType"
    case uri = "Uri"
    case width = "Width"
  }

  let height: Int
  let imageType: String
  let uri: String
  let width: Int
}


