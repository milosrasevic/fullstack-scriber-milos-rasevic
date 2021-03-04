package com.maven.takehome.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.maven.takehome.dto.AllSuggestionsDTO;
import com.maven.takehome.dto.ArtistDTO;
import com.maven.takehome.dto.ReleaseDTO;
import com.maven.takehome.dto.artists.ArtistsSuggestionDTO;
import com.maven.takehome.dto.artists.ArtistsSuggestionsDTO;
import com.maven.takehome.dto.releases.ReleasesSuggestionDTO;
import com.maven.takehome.dto.releases.ReleasesSuggestionsDTO;
import com.maven.takehome.dto.tracks.TracksSuggestionDTO;
import com.maven.takehome.dto.tracks.TracksSuggestionsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;


@Service
public class SuggestionServiceImpl implements SuggestionService {

    @Autowired
    private ObjectMapper objectMapper;

    @Override
    public TracksSuggestionsDTO getTracksSuggestions(String title) throws IOException {
        File file = ResourceUtils.getFile("src/main/resources/data.json");
        JsonNode jsonNode = objectMapper.readTree(file);

        ArrayList<TracksSuggestionDTO> suggestions = new ArrayList<TracksSuggestionDTO>();

        JsonNode releases = jsonNode.get("releases");

        for (int i = 0; i < releases.size(); i++) {
            JsonNode release = releases.get(i);
            JsonNode tracklist = release.get("TrackList");
            for (int j = 0; j < tracklist.size(); j++) {
                JsonNode track = tracklist.get(j);
                if (track.get("Title").asText().toLowerCase().startsWith(title.toLowerCase())) {
                    suggestions.add(getTrackSuggestion(track, release));
                    if (suggestions.size() >= 5) {
                        return new TracksSuggestionsDTO(suggestions);
                    }
                }
            }

        }

        return new TracksSuggestionsDTO(suggestions);

    }

    private TracksSuggestionDTO getTrackSuggestion(JsonNode track, JsonNode release) {

        String title = track.get("Title").asText();
        String duration = track.get("Duration").asText();

        Integer releaseId = release.get("Id").asInt();
        String releaseTitle = release.get("Title").asText();
        String releaseNotes = release.get("Notes").asText();


        ReleaseDTO releaseDTO = new ReleaseDTO(releaseId, releaseTitle, releaseNotes);

        TracksSuggestionDTO tracksSuggestionDTO = new TracksSuggestionDTO(title, duration, releaseDTO);
        return tracksSuggestionDTO;
    }

    @Override
    public ArtistsSuggestionsDTO getArtistsSuggestions(String name) throws IOException {

        File file = ResourceUtils.getFile("src/main/resources/data.json");
        JsonNode jsonNode = objectMapper.readTree(file);

        ArrayList<ArtistsSuggestionDTO> suggestions = new ArrayList<ArtistsSuggestionDTO>();

        JsonNode releases = jsonNode.get("releases");

        for (int i = 0; i < releases.size(); i++) {
            JsonNode release = releases.get(i);
            JsonNode artists = release.get("Artists");
            for (int j = 0; j < artists.size(); j++) {
                JsonNode artist = artists.get(j);
                if (artist.get("Name").asText().toLowerCase().startsWith(name.toLowerCase())) {
                    suggestions.add(getArtistSuggestion(artist, jsonNode));
                    if (suggestions.size() >= 5) {
                        return new ArtistsSuggestionsDTO(suggestions);
                    }
                }
            }

        }

        return new ArtistsSuggestionsDTO(suggestions);
    }

    private ArtistsSuggestionDTO getArtistSuggestion(JsonNode artist, JsonNode jsonNode) {

        Integer artistId = artist.get("Id").asInt();
        String artistName = artist.get("Name").asText();

        ArrayList<ReleaseDTO> releases = new ArrayList<ReleaseDTO>();

        for (int i = 0; i < jsonNode.get("releases").size(); i++) {
            JsonNode r = jsonNode.get("releases").get(i);
            JsonNode artists = r.get("Artists");
            for (int j = 0; j < artists.size(); j++) {
                if (artists.get(j).get("Id").asInt() == artistId) {
                    Integer releaseId = r.get("Id").asInt();
                    String releaseTitle = r.get("Title").asText();
                    String releaseNotes = r.get("Notes").asText();

                    releases.add(new ReleaseDTO(releaseId, releaseTitle, releaseNotes));
                }
            }
        }

        ArtistsSuggestionDTO artistsSuggestionDTO = new ArtistsSuggestionDTO(artistId, artistName, releases);

        return artistsSuggestionDTO;
    }

    @Override
    public ReleasesSuggestionsDTO getReleasesSuggestions(String title) throws IOException {
        File file = ResourceUtils.getFile("src/main/resources/data.json");
        JsonNode jsonNode = objectMapper.readTree(file);

        ArrayList<ReleasesSuggestionDTO> suggestions = new ArrayList<ReleasesSuggestionDTO>();

        JsonNode releases = jsonNode.get("releases");

        for (int i = 0; i < releases.size(); i++) {
            JsonNode release = releases.get(i);
            if (release.get("Title").asText().toLowerCase().startsWith(title.toLowerCase())) {
                suggestions.add(getReleaseSuggestion(release));
                if (suggestions.size() >= 5) {
                    return new ReleasesSuggestionsDTO(suggestions);
                }
            }
        }

        return new ReleasesSuggestionsDTO(suggestions);
    }

    private ReleasesSuggestionDTO getReleaseSuggestion(JsonNode release) {

        Integer releaseId = release.get("Id").asInt();
        String releaseTitle = release.get("Title").asText();
        String releaseNotes = release.get("Notes").asText();

        ArrayList<ArtistDTO> artists = new ArrayList<ArtistDTO>();

        for (int i = 0; i < release.get("Artists").size(); i++) {
            JsonNode artist = release.get("Artists").get(i);

            Integer artistId = artist.get("Id").asInt();
            String artistName = artist.get("Name").asText();

            artists.add(new ArtistDTO(artistId, artistName));
        }

        return new ReleasesSuggestionDTO(releaseId, releaseTitle, releaseNotes, artists);
    }

    @Override
    public AllSuggestionsDTO getAllSuggestions(String query) throws IOException {
        ArtistsSuggestionsDTO artists = getArtistsSuggestions(query);
        TracksSuggestionsDTO tracks = getTracksSuggestions(query);
        ReleasesSuggestionsDTO releases = getReleasesSuggestions(query);

        return new AllSuggestionsDTO(artists.getSuggestions(), tracks.getSuggestions(), releases.getSuggestions());
    }
}
