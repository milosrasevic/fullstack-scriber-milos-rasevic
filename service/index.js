"use strict";
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
exports.__esModule = true;
var express_1 = __importDefault(require("express"));
var JSONStream_1 = __importDefault(require("JSONStream"));
var event_stream_1 = __importDefault(require("event-stream"));
var fs_1 = __importDefault(require("fs"));
var app = express_1["default"]();
var port = 3000;
var releases = [];
var artists = [];
var tracks = [];
var pipeline = fs_1["default"].createReadStream('./data.json')
    .pipe(JSONStream_1["default"].parse('releases.*'))
    .pipe(event_stream_1["default"].mapSync(function (data) {
    data.Artists.forEach(function (releaseArtist) {
        var artist = artists.find(function (x) { return x.Id === releaseArtist.Id; });
        if (!artist) {
            artist = __assign(__assign({}, releaseArtist), { Releases: [] });
            artists.push(artist);
        }
        artist.Releases.push(data);
    });
    data.TrackList.forEach(function (t) {
        tracks.push(__assign(__assign({}, t), { Release: data }));
    });
    releases.push(data);
    if (releases.length % 100 === 0) {
        console.log("parsed " + releases.length + " releases");
    }
}));
var getReleases = function (prefix) { return releases
    .filter(function (r) { return r.Title.toLowerCase().startsWith(prefix.toLowerCase()); })
    .map(function (x) { return ({
    id: x.Id,
    title: x.Title,
    description: x.Notes,
    artist: x.Artists
}); })
    .slice(0, 5); };
var getArtists = function (prefix) { return artists
    .filter(function (a) { return a.Name.toLowerCase().startsWith(prefix.toLowerCase()); })
    .map(function (x) { return ({
    id: x.Id,
    name: x.Name,
    releases: x.Releases.map(function (r) { return ({
        title: r.Title,
        description: r.Notes
    }); })
}); })
    .slice(0, 5); };
var getTracks = function (prefix) { return tracks
    .filter(function (t) { return t.Title.toLowerCase().startsWith(prefix.toLowerCase()); })
    .map(function (x) { return ({
    title: x.Title,
    duration: x.Duration,
    release: {
        id: x.Release.Id,
        title: x.Release.Title
    }
}); })
    .slice(0, 5); };
app.get('/autosuggest/releases', function (req, res) {
    var prefix = req.query["prefix"];
    var results = getReleases(prefix);
    res.send(JSON.stringify(results, null, 2));
});
app.get('/autosuggest/tracks', function (req, res) {
    var prefix = req.query["prefix"];
    var results = getTracks(prefix);
    res.send(JSON.stringify(results, null, 2));
});
app.get('/autosuggest/artists', function (req, res) {
    var prefix = req.query["prefix"];
    var results = getArtists(prefix);
    res.send(JSON.stringify(results, null, 2));
});
app.get('/autosuggest/all', function (req, res) {
    var prefix = req.query["prefix"];
    var results = {
        artists: getArtists(prefix),
        tracks: getTracks(prefix),
        releases: getReleases(prefix)
    };
    res.send(JSON.stringify(results, null, 2));
});
app.listen(port, function () { return console.log('listening on port ' + port); });
