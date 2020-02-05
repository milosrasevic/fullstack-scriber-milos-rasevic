//
//  CandidateStuff.swift
//  swiftautosuggest
//
//  Created by Don Clore on 2/2/20.
//

import Foundation

//// THIS IS STUFF THAT THE CANDIDATE MUST DO, MUST NOT BE COMMITTED TO GIT HISTORY.
//extension AutoSuggestService.Models {
//  func insertLabelInTrie(_ label: LabelEntity) {
//    labelsTrie.insert(label.name, body: label)
//    if let profile = label.profile {
//      labelsTrie.insert(profile, body: label)
//    }
//    if let quality = label.dataQuality {
//      labelsTrie.insert(quality, body: label)
//    }
//  }
//
//  func insertArtistInTrie(_ artist: ArtistEntity) {
//    artistsTrie.insert(artist.name, body: artist)
//    if let realName = artist.realName {
//      artistsTrie.insert(realName, body: artist)
//    }
//    if let nameVariations = artist.nameVariations {
//      for nameVariation in nameVariations {
//        if let variation = nameVariation.nameVariation {
//          artistsTrie.insert(variation, body: artist)
//        }
//      }
//    }
//    if let dataQuality = artist.dataQuality {
//      artistsTrie.insert(dataQuality, body: artist)
//    }
//    if let aliases = artist.aliases {
//      for alias in aliases {
//        if let name = alias.name {
//          artistsTrie.insert(name, body: artist)
//        }
//      }
//    }
//  }
//
//  func insertReleaseInTrie(_ release: ReleaseEntity) {
//    if let status = release.status {
//      releasesTrie.insert(status, body: release)
//    }
//    if let tracklist = release.trackList {
//      for track in tracklist {
//        if let title = track.title {
//          releasesTrie.insert(title, body: release)
//        }
//      }
//    }
//    if let artists = release.artists {
//      for artist in artists {
//        if let name = artist.name {
//          releasesTrie.insert(name, body: release)
//        }
//      }
//    }
//    if let artists = release.extraArtists {
//      for artist in artists {
//        if let name = artist.name {
//          releasesTrie.insert(name, body: release)
//        }
//      }
//    }
//
//    if let formats = release.formats {
//      for format in formats {
//        if let name = format.formatName {
//          releasesTrie.insert(name, body: release)
//        }
//        if let descs = format.descriptions {
//          for desc in descs {
//            if let description = desc.description {
//              releasesTrie.insert(description, body: release)
//            }
//          }
//        }
//      }
//    }
//    if let title = release.title {
//      releasesTrie.insert(title, body: release)
//    }
//    if let genres = release.genres {
//      for g in genres {
//        if let genre = g.genre {
//          releasesTrie.insert(genre, body: release)
//        }
//      }
//    }
//    if let styles = release.styles {
//      for s in styles {
//        if let style = s.style {
//          releasesTrie.insert(style, body: release)
//        }
//      }
//    }
//    if let country = release.country {
//      releasesTrie.insert(country, body: release)
//    }
//    if let notes = release.notes {
//      releasesTrie.insert(notes, body: release)
//    }
//    if let dataQuality = release.dataQuality {
//      releasesTrie.insert(dataQuality, body: release)
//    }
//    if let identifiers = release.identifiers {
//      for id in identifiers {
//        if let identifier = id.description {
//          releasesTrie.insert(identifier, body: release)
//        }
//      }
//    }
//    if let videos = release.videos {
//      for v in videos {
//        if let video = v.title {
//          releasesTrie.insert(video, body: release)
//        }
//      }
//    }
//    if let companies = release.companies {
//      for c in companies {
//        if let company = c.name {
//          releasesTrie.insert(company, body: release)
//        }
//      }
//    }
//  }
//}
