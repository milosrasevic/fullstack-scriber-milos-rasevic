package com.maven.takehome.dto.tracks;

import com.maven.takehome.dto.tracks.TracksSuggestionDTO;

import java.util.ArrayList;

public class TracksSuggestionsDTO {

    private ArrayList<TracksSuggestionDTO> suggestions;

    public TracksSuggestionsDTO() {
    }

    public TracksSuggestionsDTO(ArrayList<TracksSuggestionDTO> suggestions) {
        this.suggestions = suggestions;
    }

    public ArrayList<TracksSuggestionDTO> getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(ArrayList<TracksSuggestionDTO> suggestions) {
        this.suggestions = suggestions;
    }
}
