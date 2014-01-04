package playlist.model;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * DataStax Academy Sample Application
 *
 * Copyright 2013 DataStax
 *
 */


public class TracksDAO extends CassandraData {

  // Hard Coded Genres for now

  private final UUID track_id;
  private final String artist;
  private final String track;
  private final String genre;
  private final String music_file;
  private final int track_length_in_seconds;

  /**
   * Constructor to create a TracksDAO object when given a single Cassandra Row object
   *
   * @param row - a single Cassandra Java Driver Row
   *
   */

  private TracksDAO(Row row) {
    track_id = row.getUUID("track_id");
    artist = row.getString("artist");
    track = row.getString("track");
    genre = row.getString("genre");
    music_file = row.getString("music_file");
    track_length_in_seconds = row.getInt("track_length_in_seconds");
  }

  public TracksDAO(String artist, String track, String genre, String music_file, int track_length_in_seconds) {
    this.track_id = UUID.randomUUID();  // We can generate the new UUID right here in the constructor
    this.artist = artist;
    this.track = track;
    this.genre = genre;
    this.music_file = music_file;
    this.track_length_in_seconds = track_length_in_seconds;
  }

  // Static finder method

  public static List<TracksDAO> listSongsByArtist(String artist) {
	  PreparedStatement preparedStatement = getSession().prepare("SELECT * FROM track_by_artist WHERE artist = ?");
	  BoundStatement boundStatement = preparedStatement.bind(artist);
	  ResultSet results = getSession().execute(boundStatement);

    List<TracksDAO> tracks = new ArrayList<>();

    for (Row row : results) {
      tracks.add(new TracksDAO(row));
    }

    return tracks;
  }

  public static List<TracksDAO> listSongsByGenre(String genre) {
	  ResultSet results = getSession().execute("select * from track_by_genre where genre = ?", genre);

	  List<TracksDAO> tracks = new ArrayList<>();

	  if (results != null) {
      for (Row row : results) {
        tracks.add(new TracksDAO(row));
      }
    }

    return tracks;
  }

  /**
   * Add this track to the database
   */
  public void add() {

    // Compute the first letter of the artists name for the artists_by_first_letter table
    String artist_first_letter = this.artist.substring(0,1).toUpperCase();

    PreparedStatement preparedStatement = getSession().prepare("INSERT INTO artists_by_first_letter (first_letter, artist) VALUES (?, ?)");
    BoundStatement boundStatement = preparedStatement.bind(artist_first_letter, this.artist);
    getSession().execute(boundStatement);

    preparedStatement = getSession().prepare("INSERT INTO track_by_artist (genre, track_id, artist, track, track_length_in_seconds) VALUES (?, ?, ?, ?, ?)");
    boundStatement = preparedStatement.bind(this.genre, this.track_id, this.artist, this.track, this.track_length_in_seconds);
    getSession().execute(boundStatement);

    preparedStatement = getSession().prepare("INSERT INTO track_by_genre (genre, track_id, artist, track, track_length_in_seconds) VALUES (?, ?, ?, ?, ?)");
    boundStatement = preparedStatement.bind(this.genre, this.track_id, this.artist, this.track, this.track_length_in_seconds);
    getSession().execute(boundStatement);

    // TODO - what are we missing here?

  }


  public UUID getTrack_id() {
    return track_id;
  }

  public String getArtist() {
    return artist;
  }

  public String getTrack() {
    return track;
  }

  public String getGenre() {
    return genre;
  }

  public String getMusic_file() {
    return music_file;
  }

  public int getTrack_length_in_seconds() {
    return track_length_in_seconds;
  }
}
