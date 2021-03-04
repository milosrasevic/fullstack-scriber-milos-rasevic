package com.maven.takehome.controller;

import com.maven.takehome.dto.AllSuggestionsDTO;
import com.maven.takehome.dto.artists.ArtistsSuggestionsDTO;
import com.maven.takehome.dto.releases.ReleasesSuggestionsDTO;
import com.maven.takehome.dto.tracks.TracksSuggestionsDTO;
import com.maven.takehome.service.SuggestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping(value = "/suggest")
public class SuggestionController {

    @Autowired
    private SuggestionService suggestionService;

    @GetMapping("/tracks")
    public ResponseEntity<?> getTracksSuggestions(@RequestParam("prefix") String title) {
        try {
            return new ResponseEntity<TracksSuggestionsDTO>(suggestionService.getTracksSuggestions(title), HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<String>("Data JSON file not found", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/artists")
    public ResponseEntity<?> getArtistsSuggestions(@RequestParam("prefix") String name) {
        try {
            return new ResponseEntity<ArtistsSuggestionsDTO>(suggestionService.getArtistsSuggestions(name), HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<String>("Data JSON file not found", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/releases")
    public ResponseEntity<?> getReleasesSuggestions(@RequestParam("prefix") String title) {
        try {
            return new ResponseEntity<ReleasesSuggestionsDTO>(suggestionService.getReleasesSuggestions(title), HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<String>("Data JSON file not found", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/all")
    public ResponseEntity<?> getAllSuggestions(@RequestParam("prefix") String query) {
        try {
            return new ResponseEntity<AllSuggestionsDTO>(suggestionService.getAllSuggestions(query), HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<String>("Data JSON file not found", HttpStatus.BAD_REQUEST);
        }
    }
}
