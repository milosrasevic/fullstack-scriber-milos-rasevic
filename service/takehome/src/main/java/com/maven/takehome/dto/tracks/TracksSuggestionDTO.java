package com.maven.takehome.dto.tracks;

import com.maven.takehome.dto.ReleaseDTO;

public class TracksSuggestionDTO {

    private String title;
    private String duration;
    private ReleaseDTO release;

    public TracksSuggestionDTO() {
    }

    public TracksSuggestionDTO(String title, String duration, ReleaseDTO release) {
        this.title = title;
        this.duration = duration;
        this.release = release;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public ReleaseDTO getRelease() {
        return release;
    }

    public void setRelease(ReleaseDTO release) {
        this.release = release;
    }
}
