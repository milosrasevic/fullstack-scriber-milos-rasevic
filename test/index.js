const chakram = require('chakram')
const expect = chakram.expect

describe('suggest', () => {
  it("madonna returns ray of light", async () => {
    const response = await chakram.get('http://service/suggest/artists?prefix=madon')
    expect(response).to.have.status(200)
    await expect(response).to.comprise.of.json({
      suggestions: [
        {
          "id": 8760,
          "name": "Madonna",
          "releases": [
            {
              "title": "Ray Of Light",
              "description": "The catalogue number on the spine is different from that on the label.\n\nSome copies have a sticker on front cover (applied on the shrinkwrap).\nMatte cover.\nTransparent inner sleeves."
            }
          ]
        }
      ]
    })
    return chakram.wait()
  })
  it("world tracks", async () => {
    const response = await chakram.get('http://service/suggest/tracks?prefix=world')
    const worldTracks = {
      "suggestions": [
        {
          "title": "World Domination",
          "duration": "6:46",
          "release": {
            "id": "884",
            "title": "The Fruity Green"
          }
        },
        {
          "title": "World Too Mean",
          "duration": "",
          "release": {
            "id": "1086",
            "title": "Deep South Experience"
          }
        },
        {
          "title": "World Unknown",
          "duration": "",
          "release": {
            "id": "2255",
            "title": "151 (The Remixes)"
          }
        },
        {
          "title": "World In My Eyes (Oil Tank Mix)",
          "duration": "7:29",
          "release": {
            "id": "2299",
            "title": "World In My Eyes / Happiest Girl / Sea Of Sin"
          }
        },
        {
          "title": "Worldcup",
          "duration": "3:05",
          "release": {
            "id": "3425",
            "title": "Techno Methods Vol .02"
          }
        }
      ]
    }
    expect(response).to.have.status(200)
    await expect(response).to.comprise.of.json(worldTracks)
    return chakram.wait()
  })
  it("dream releases", async () => {
    const dreamReleases = {
      "suggestions": [
        {
          "id": "471",
          "title": "Dreaming (Dahlbäck And Hulkkonen Remixes)",
          "description": null,
          "artist": [
            {
              "Id": 50,
              "Name": "ADNY"
            }
          ]
        },
        {
          "id": "722",
          "title": "Dream Sequence",
          "description": "Recorded in Berlin, Nov. 1991.\nDistributed by EFA Distribution.\nRe-released in 2000 as [url=http://www.discogs.com/release/723]Tresor 149[/url] with additional tracks.\n",
          "artist": [
            {
              "Id": 1100,
              "Name": "Blake Baxter"
            }
          ]
        },
        {
          "id": "2381",
          "title": "Dream Girl",
          "description": null,
          "artist": [
            {
              "Id": 2695,
              "Name": "Pierre's Pfantasy Club"
            }
          ]
        },
        {
          "id": "2596",
          "title": "Dreaming Of Electro She e.p.",
          "description": "©2000 Trama Industries ℗2000 Trama Industries",
          "artist": [
            {
              "Id": 572,
              "Name": "Decal"
            }
          ]
        },
        {
          "id": "4212",
          "title": "Dreams Of Elsewhere",
          "description": "Jewel case version with 4 page booklet",
          "artist": [
            {
              "Id": 173,
              "Name": "Common Factor"
            }
          ]
        }
      ]
    }
    const response = await chakram.get('http://service/suggest/releases?prefix=dream')
    expect(response).to.have.status(200)
    await expect(response).to.comprise.of.json(dreamReleases)
    return chakram.wait()
  })
  it("all zz should give us zzonked and zzino", async () => {
    const response = await chakram.get('http://service/suggest/all?prefix=zz')
    const zz = {
      "artists": [
        {
          "id": 8871,
          "name": "Zzino vs. Filterheadz",
          "releases": [
            {
              "title": "African Bulldozer / Sparadrap",
              "description": "Recorded at Borderland Studio\nPublished by Headroom Music"
            }
          ]
        }
      ],
      "tracks": [
        {
          "title": "Zzonked",
          "duration": "7:21",
          "release": {
            "id": "4475",
            "title": "Intelligent Univers"
          }
        },
        {
          "title": "ZZZzz9",
          "duration": "",
          "release": {
            "id": "6679",
            "title": "Machine Component 2"
          }
        }
      ],
      "releases": []
    }
    expect(response).to.have.status(200)
    await expect(response).to.comprise.of.json(zz)
    return chakram.wait()
  })
})
