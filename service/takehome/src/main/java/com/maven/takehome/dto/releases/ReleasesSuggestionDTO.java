package com.maven.takehome.dto.releases;

import com.maven.takehome.dto.ArtistDTO;

import java.util.ArrayList;

public class ReleasesSuggestionDTO {

    private Integer id;
    private String title;
    private String notes;
    private ArrayList<ArtistDTO> artist;

    public ReleasesSuggestionDTO() {
    }

    public ReleasesSuggestionDTO(Integer id, String title, String notes, ArrayList<ArtistDTO> artist) {
        this.id = id;
        this.title = title;
        this.notes = notes;
        this.artist = artist;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public ArrayList<ArtistDTO> getArtist() {
        return artist;
    }

    public void setArtist(ArrayList<ArtistDTO> artist) {
        this.artist = artist;
    }
}
