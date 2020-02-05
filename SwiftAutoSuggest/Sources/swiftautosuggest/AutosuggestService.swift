//
//  Service.swift
//  CHTTPParser
//
//  Created by Don Clore on 2/2/20.
//

import Foundation
import FileKit

public struct AutoSuggestService {
  public struct ResultSet: Codable {
    let labels: [LabelEntity]
    let artists: [ArtistEntity]
    let releases: [ReleaseEntity]
  }
  
  struct Models {
    static var instance: Models!
       
    fileprivate init() {
      let projectFolderURL = FileKit.projectFolderURL
      loadLabels(projectFolderURL)
      loadArtists(projectFolderURL)
      loadReleases(projectFolderURL)
    }
        
    private func loadLabels(_ projectFolderURL: URL) {
      let labelsFile = projectFolderURL.appendingPathComponent("smallLabelsFile.json")
      
      do {
        let data = try Data(contentsOf: labelsFile)
        let decoder = JSONDecoder()
        let labelList = try decoder.decode(LabelList.self, from: data)
        let labels = labelList.labels
        for _ in labels {
           // DO:  Candidate - do something here.
        }
        print("Label count = \(labels.count)")
      } catch let error {
        print(error.localizedDescription)
      }
    }
        
    fileprivate func loadArtists(_ projectFolderURL: URL) {
      let artistsFile = projectFolderURL.appendingPathComponent("smallArtistsFile.json")
      
      do {
        let data = try Data(contentsOf: artistsFile)
        let decoder = JSONDecoder()
        let artistList = try decoder.decode(ArtistList.self, from: data)
        let artists = artistList.artists
        for _ in artists {
          //DO: Candidate - do something here.
        }
        print("Artist count = \(artists.count)")
      } catch let error {
        print(error.localizedDescription)
      }
    }
    
    private func loadReleases(_ projectFolderURL: URL) {
      let releasesFile = projectFolderURL.appendingPathComponent("smallReleasesFile.json")
      do {
        let data = try Data(contentsOf: releasesFile)
        let decoder = JSONDecoder()
        let releasesList = try decoder.decode(ReleasesList.self, from: data)
        let releases = releasesList.releases
        for _ in releases {
          //DO: Candidate; do something here.
        }
        print("Releases count = \(releases.count)")
      } catch let error {
        print(error.localizedDescription)
      }
    }
 }
  
  static var instance: AutoSuggestService!
  static var initialized = false
  
  static func initialize() {
    guard !initialized else {
      return
    }
    defer {
      initialized = true
    }
    Models.instance = Models()
    instance = AutoSuggestService()
  }
  
  static func getResult(for prefix: String) -> ResultSet {
    return ResultSet(labels: [], artists: [], releases: [])
  }
}
