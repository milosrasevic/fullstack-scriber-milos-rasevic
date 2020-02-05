//
//  ReleaseEntity.swift
//  TryParseLabels
//
//  Created by Don Clore on 2/2/20.
//  Copyright © 2020 Don Clore. All rights reserved.
//

import Foundation

struct ReleasesList: Codable {
  let releases: [ReleaseEntity]
}

struct ReleaseEntity: Codable {
  struct Company: Codable {
    enum CodingKeys: String, CodingKey {
      case id = "Id"
      case name = "Name"
      case entityType = "EntityType"
      case entityTypeName = "EntityTypeName"
      case resourceURL = "ResourceUrl"
    }
    let id: Int
    let name: String?
    let entityType: Int?
    let entityTypeName: String?
    let resourceURL: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      id = try values.decode(Int.self, forKey: CodingKeys.id)
      name = try values.decode(String?.self, forKey: CodingKeys.name)?.trimmingCharacters(in: .whitespacesAndNewlines)
      entityType = try values.decode(Int?.self, forKey: CodingKeys.entityType)
      entityTypeName = try values.decode(String?.self, forKey: CodingKeys.entityTypeName)?.trimmingCharacters(in: .whitespacesAndNewlines)
      resourceURL = try values.decode(String?.self, forKey: CodingKeys.resourceURL)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
  }
  
  struct Label: Codable {
    enum CodingKeys: String, CodingKey {
      case catalogNumber = "CatalogNumber"
      case id = "Id"
      case name = "Name"
      case role = "Role"
    }
    
    let catalogNumber: String?
    let id: String?
    let name: String?
    let role: String?
  }
  
  struct Track: Codable {
    enum CodingKeys: String, CodingKey {
      case position = "Position"
      case title = "Title"
      case duration = "Duration"
    }
    let position: String?
    let title: String?
    let duration: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      position = try values.decode(String?.self, forKey: CodingKeys.position)?.trimmingCharacters(in: .whitespacesAndNewlines)
      title = try values.decode(String?.self, forKey: CodingKeys.title)?.trimmingCharacters(in: .whitespacesAndNewlines)
      duration = try values.decode(String?.self, forKey: CodingKeys.duration)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
  }
  
  struct Image: Codable {
    enum CodingKeys: String, CodingKey {
      case height = "Height"
      case imageType = "ImageType"
      case uri = "Uri"
      case width = "Width"
    }
    
    let height: Int?
    let imageType: String?
    let uri: String?
    let width: Int?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      height = try values.decode(Int?.self, forKey: CodingKeys.height)
      imageType = try values.decode(String?.self, forKey: CodingKeys.imageType)?.trimmingCharacters(in: .whitespacesAndNewlines)
      uri = try values.decode(String?.self, forKey: CodingKeys.uri)?.trimmingCharacters(in: .whitespacesAndNewlines)
      width = try values.decode(Int?.self, forKey: CodingKeys.width)
    }

  }
  
  struct Video: Codable {
    enum CodingKeys: String, CodingKey {
      case duration = "Duration"
      case embed = "Embed"
      case source = "Source"
      case title = "Title"
      case description = "Description"
    }
    
    let duration: Int?
    let embed: String?
    let source: String?
    let title: String?
    let description: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      duration = try values.decode(Int?.self, forKey: CodingKeys.duration)
      embed = try values.decode(String?.self, forKey: CodingKeys.embed)?.trimmingCharacters(in: .whitespacesAndNewlines)
      source = try values.decode(String?.self, forKey: CodingKeys.source)?.trimmingCharacters(in: .whitespacesAndNewlines)
      title = try values.decode(String?.self, forKey: CodingKeys.title)?.trimmingCharacters(in: .whitespacesAndNewlines)
      description = try values.decode(String?.self, forKey: CodingKeys.description)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
  }
  
  struct Identifier: Codable {
    enum CodingKeys: String, CodingKey {
      case description = "Description"
      case identifierType = "Type"
      case identifierValue = "Value"
    }
    
    let description: String?
    let identifierType: String?
    let identifierValue: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      description = try values.decode(String?.self, forKey: CodingKeys.description)?.trimmingCharacters(in: .whitespacesAndNewlines)
      identifierType = try values.decode(String?.self, forKey: CodingKeys.identifierType)?.trimmingCharacters(in: .whitespacesAndNewlines)
      identifierValue = try values.decode(String?.self, forKey: CodingKeys.identifierValue)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
  }
  
  struct MasterId: Codable {
    enum CodingKeys: String, CodingKey {
      case isMainRelease = "IsMainRelease"
      case id = "Id"
    }
    let id: Int?
    let isMainRelease: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      id = try values.decode(Int?.self, forKey: CodingKeys.id)
      isMainRelease = try values.decode(String?.self, forKey: CodingKeys.isMainRelease)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
  }
  
  struct Genre: Codable {
    enum CodingKeys: String, CodingKey {
      case genre = "Genre"
    }
    let genre: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      genre = try values.decode(String?.self, forKey: CodingKeys.genre)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
  }
  
  struct Format: Codable {
    struct Description: Codable {
      enum CodingKeys: String, CodingKey {
        case description = "Description"
      }
      
      let description: String?
      
      init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decode(String?.self, forKey: CodingKeys.description)?.trimmingCharacters(in: .whitespacesAndNewlines)
      }
    }
    
    
    enum CodingKeys: String, CodingKey {
      case formatName = "FormatName"
      case quantity = "Quantity"
      case text = "Text"
      case descriptions = "Descriptions"
    }
    
    let formatName: String?
    let quantity: String?
    let text: String?
    let descriptions: [Description]?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      formatName = try values.decode(String?.self, forKey: CodingKeys.formatName)?.trimmingCharacters(in: .whitespacesAndNewlines)
      quantity = try values.decode(String?.self, forKey: CodingKeys.quantity)?.trimmingCharacters(in: .whitespacesAndNewlines)
      text = try values.decode(String?.self, forKey: CodingKeys.text)?.trimmingCharacters(in: .whitespacesAndNewlines)
      descriptions = try values.decode([Description]?.self, forKey: CodingKeys.descriptions)
    }
  }
  
  struct Style: Codable {
    enum CodingKeys: String, CodingKey {
      case style = "Style"
    }
    let style: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      style = try values.decode(String?.self, forKey: CodingKeys.style)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

  }
  
  struct Artist: Codable {
    enum CodingKeys: String, CodingKey {
      case name = "Name"
    }
    let name: String?
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      name = try values.decode(String?.self, forKey: CodingKeys.name)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
  }
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case status = "Status"
    case images = "Images"
    case artists = "Artists"
    case title = "Title"
    case labels = "Labels"
    case extraArtists = "ExtraArtists"
    case formats = "Formats"
    case genres = "Genres"
    case styles = "Styles"
    case country = "Country"
    case released = "Released"
    case notes = "Notes"
    case dataQuality = "DataQuality"
    case masterId = "MasterId"
    case trackList = "TrackList"
    case identifiers = "Identifiers"
    case videos = "Videos"
    case companies = "Companies"
  }
  
  let id: String
  let status: String?
  let images: [Image]?
  let artists: [Artist]?
  let title: String?
  let labels: [Label]?
  let extraArtists: [Artist]?
  let formats: [Format]?
  let genres: [Genre]?
  let styles: [Style]?
  let country: String?
  let released: String?
  let notes: String?
  let dataQuality: String?
  let masterId: MasterId?
  let trackList: [Track]?
  let identifiers: [Identifier]?
  let videos: [Video]?
  let companies: [Company]?

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: CodingKeys.id)
    status = try values.decode(String?.self, forKey: CodingKeys.status)?.trimmingCharacters(in: .whitespacesAndNewlines)
    images = try values.decode([Image]?.self, forKey: CodingKeys.images)
    artists = try values.decode([Artist]?.self, forKey: CodingKeys.artists)
    title = try values.decode(String?.self, forKey: CodingKeys.title)?.trimmingCharacters(in: .whitespacesAndNewlines)
    labels = try values.decode([Label]?.self, forKey: CodingKeys.labels)
    extraArtists = try values.decode([Artist]?.self, forKey: CodingKeys.extraArtists)
    formats = try values.decode([Format]?.self, forKey: CodingKeys.formats)
    genres = try values.decode([Genre]?.self, forKey: CodingKeys.genres)
    styles = try values.decode([Style]?.self, forKey: CodingKeys.styles)
    country = try values.decode(String?.self, forKey: CodingKeys.country)?.trimmingCharacters(in: .whitespacesAndNewlines)
    released = try values.decode(String?.self, forKey: CodingKeys.released)?.trimmingCharacters(in: .whitespacesAndNewlines)
    notes = try values.decode(String?.self, forKey: CodingKeys.notes)?.trimmingCharacters(in: .whitespacesAndNewlines)
    dataQuality = try values.decode(String?.self, forKey: CodingKeys.dataQuality)?.trimmingCharacters(in: .whitespacesAndNewlines)
    masterId = try values.decode(MasterId?.self, forKey: CodingKeys.masterId)
    trackList = try values.decode([Track]?.self, forKey: CodingKeys.trackList)
    identifiers = try values.decode([Identifier]?.self, forKey: CodingKeys.identifiers)
    videos = try values.decode([Video]?.self, forKey: CodingKeys.videos)
    companies = try values.decode([Company]?.self, forKey: CodingKeys.companies)
  }
}
