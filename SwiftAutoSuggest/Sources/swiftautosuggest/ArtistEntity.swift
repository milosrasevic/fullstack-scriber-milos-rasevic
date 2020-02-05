//
//  ArtistEntity.swift
//  swiftautosuggest
//
//  Created by Don Clore on 2/2/20.
//

import Foundation

struct ArtistList: Codable {
  let artists: [ArtistEntity]
}

struct ArtistEntity: Codable {
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case images = "Images"
    case name = "Name"
    case realName = "RealName"
    case dataQuality = "DataQuality"
    case urls = "Urls"
    case nameVariations = "NameVariations"
    case aliases = "Aliases"
  }
  let id: Int
  let images: [ArtistImageEntity]?
  let name: String
  let realName: String?
  let dataQuality: String?
  let urls: [ArtistURLEntity]?
  let nameVariations: [ArtistNameVariationEntity]?
  let aliases: [ArtistAliasEntity]?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: CodingKeys.id)
    images = try values.decode([ArtistImageEntity]?.self, forKey: CodingKeys.images)
    name = try values.decode(String.self, forKey: CodingKeys.name).trimmingCharacters(in: .whitespacesAndNewlines)
    realName = try values.decode(String?.self, forKey: CodingKeys.realName)?.trimmingCharacters(in: .whitespacesAndNewlines)
    dataQuality = try values.decode(String?.self, forKey: CodingKeys.dataQuality)?.trimmingCharacters(in: .whitespacesAndNewlines)
    urls = try values.decode([ArtistURLEntity]?.self, forKey: CodingKeys.urls)
    nameVariations = try values.decode([ArtistNameVariationEntity]?.self, forKey: CodingKeys.nameVariations)
    aliases = try values.decode([ArtistAliasEntity]?.self, forKey: CodingKeys.aliases)
  }
}

struct ArtistImageEntity: Codable {
  enum CodingKeys: String, CodingKey {
    case height = "Height"
    case imageType = "Type"
    case uri = "Uri"
    case width = "Width"
  }

  let height: Int?
  let width: Int?
  let imageType: String?
  let uri: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    height = try values.decode(Int?.self, forKey: CodingKeys.height)
    width = try values.decode(Int?.self, forKey: CodingKeys.width)
    imageType = try values.decode(String?.self, forKey: CodingKeys.imageType)?.trimmingCharacters(in: .whitespacesAndNewlines)
    uri = try values.decode(String?.self, forKey: CodingKeys.uri)?.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

struct ArtistNameVariationEntity: Codable {
  enum CodingKeys: String, CodingKey {
    case nameVariation = "NameVariation"
  }
  
  let nameVariation: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    nameVariation = try values.decode(String?.self, forKey: CodingKeys.nameVariation)?.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

struct ArtistURLEntity: Codable {
  enum CodingKeys: String, CodingKey {
    case url = "Url"
  }
  
  let url: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    url = try values.decode(String?.self, forKey: CodingKeys.url)?.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

struct ArtistAliasEntity: Codable {
  enum CodingKeys: String, CodingKey {
    case name = "Name"
  }
  
  let name: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decode(String?.self, forKey: CodingKeys.name)?.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}



