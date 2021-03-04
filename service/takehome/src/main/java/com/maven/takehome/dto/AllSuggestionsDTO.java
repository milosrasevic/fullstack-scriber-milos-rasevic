package com.maven.takehome.dto;

import com.maven.takehome.dto.artists.ArtistsSuggestionDTO;
import com.maven.takehome.dto.releases.ReleasesSuggestionDTO;
import com.maven.takehome.dto.tracks.TracksSuggestionDTO;

import java.util.ArrayList;

public class AllSuggestionsDTO {

    private ArrayList<ArtistsSuggestionDTO> artists;
    private ArrayList<TracksSuggestionDTO> tracks;
    private ArrayList<ReleasesSuggestionDTO> releases;

    public AllSuggestionsDTO() {
    }

    public AllSuggestionsDTO(ArrayList<ArtistsSuggestionDTO> artists, ArrayList<TracksSuggestionDTO> tracks, ArrayList<ReleasesSuggestionDTO> releases) {
        this.artists = artists;
        this.tracks = tracks;
        this.releases = releases;
    }

    public ArrayList<ArtistsSuggestionDTO> getArtists() {
        return artists;
    }

    public void setArtists(ArrayList<ArtistsSuggestionDTO> artists) {
        this.artists = artists;
    }

    public ArrayList<TracksSuggestionDTO> getTracks() {
        return tracks;
    }

    public void setTracks(ArrayList<TracksSuggestionDTO> tracks) {
        this.tracks = tracks;
    }

    public ArrayList<ReleasesSuggestionDTO> getReleases() {
        return releases;
    }

    public void setReleases(ArrayList<ReleasesSuggestionDTO> releases) {
        this.releases = releases;
    }
}
