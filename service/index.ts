import express from 'express'
import JSONStream from 'JSONStream'
import es from 'event-stream'
import fs from 'fs'
import process from 'process'

const app = express()
const port = process.env['port'] || 3000

export interface Image {
    Height: number;
    ImageType: string;
    Uri: string;
    Width: number;
}

export interface Artist {
    Id: number;
    Name: string;
}

export interface Label {
    CatalogNumber: string;
    Id: string;
    Name: string;
    Role?: any;
}

export interface ExtraArtist {
    Id: number;
    Name: string;
}

export interface Description {
    Description: string;
}

export interface Format {
    FormatName: string;
    Quantity: string;
    Text: string;
    Descriptions: Description[];
}

export interface Genre {
    Genre: string;
}

export interface Style {
    Style: string;
}

export interface MasterId {
    IsMainRelease: string;
    Id: number;
}

export interface TrackList {
    Position: string;
    Title: string;
    Duration: string;
}

export interface Video {
    Duration: number;
    Embed: string;
    Source: string;
    Title: string;
    Description: string;
}

export interface Release {
    Id: string;
    Status: string;
    Images: Image[];
    Artists: Artist[];
    Title: string;
    Labels: Label[];
    ExtraArtists: ExtraArtist[];
    Formats: Format[];
    Genres: Genre[];
    Styles: Style[];
    Country: string;
    Released: string;
    Notes?: any;
    DataQuality: string;
    MasterId: MasterId;
    TrackList: TrackList[];
    Identifiers: any[];
    Videos: Video[];
    Companies: any[];
}

export interface ArtistEntry extends Artist {
    Releases: Release[]
}

export interface Track extends TrackList {
    Release: Release
}

const releases: Release[] = []
const artists: ArtistEntry[] = []
const tracks: Track[] = []

const pipeline = fs.createReadStream('./data.json')
    .pipe(JSONStream.parse('releases.*'))
    .pipe(es.mapSync((data: Release) => {
        data.Artists.forEach(releaseArtist => {
            let artist: ArtistEntry = artists.find( x => x.Id === releaseArtist.Id)
            if (!artist) {
                artist = {
                    ...releaseArtist,
                    Releases: []
                }
                artists.push(artist)
            }
            artist.Releases.push(data)
        })
        data.TrackList.forEach(t => {
            tracks.push({
                ...t,
                Release: data
            })
        })
        releases.push(data)
        if (releases.length % 100 === 0) {
            console.log(`parsed ${releases.length} releases`)
        }
    }))

const getReleases = (prefix: string) => releases
    .filter(r => r.Title.toLowerCase().startsWith(prefix.toLowerCase()))
    .map(x => ({
        id: x.Id,
        title: x.Title,
        notes: x.Notes,
        artist: x.Artists.map(a => ({
            id: a.Id,
            name: a.Name
        })),
    }))
    .slice(0, 5)

const getArtists = (prefix: string) => artists
    .filter(a => a.Name.toLowerCase().startsWith(prefix.toLowerCase()))
    .map(x => ({
        id: x.Id,
        name: x.Name,
        releases: x.Releases.map(r => ({
            id: x.Id,
            title: r.Title,
            notes: r.Notes
        })),
    }))
    .slice(0, 5)

const getTracks = (prefix: string) => tracks
    .filter(t => t.Title.toLowerCase().startsWith(prefix.toLowerCase()))
    .map(x => ({
        title: x.Title,
        duration: x.Duration,
        release: {
            id: x.Release.Id,
            title: x.Release.Title,
            notes: x.Release.Notes
        }
    }))
    .slice(0, 5)

app.get('/suggest/releases', (req, res) => {
    let prefix: string = req.query["prefix"]
    const results = {
        suggestions: getReleases(prefix)
    }
    res.send(JSON.stringify(results, null, 2))
})

app.get('/suggest/tracks', (req, res) => {
    let prefix: string = req.query["prefix"]
    const results = {
        suggestions: getTracks(prefix)
    }
    res.send(JSON.stringify(results, null, 2))
})

app.get('/suggest/artists', (req, res) => {
    let prefix: string = req.query["prefix"]
    const results = {
        suggestions: getArtists(prefix)
    }
    res.send(JSON.stringify(results, null, 2))
})

app.get('/suggest/all', (req, res) => {
    let prefix: string = req.query["prefix"]
    const results = {
        artists: getArtists(prefix),
        tracks: getTracks(prefix),
        releases: getReleases(prefix)
    }
    res.send(JSON.stringify(results, null, 2))
})

app.listen(port, () => console.log('listening on port ' + port))
