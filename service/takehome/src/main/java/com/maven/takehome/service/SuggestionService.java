package com.maven.takehome.service;

import com.maven.takehome.dto.AllSuggestionsDTO;
import com.maven.takehome.dto.artists.ArtistsSuggestionsDTO;
import com.maven.takehome.dto.releases.ReleasesSuggestionsDTO;
import com.maven.takehome.dto.tracks.TracksSuggestionsDTO;

import java.io.FileNotFoundException;
import java.io.IOException;

public interface SuggestionService {

    public TracksSuggestionsDTO getTracksSuggestions(String title) throws IOException;
    public ArtistsSuggestionsDTO getArtistsSuggestions(String name) throws IOException;
    public ReleasesSuggestionsDTO getReleasesSuggestions(String title) throws IOException;
    public AllSuggestionsDTO getAllSuggestions(String query) throws IOException;

}
