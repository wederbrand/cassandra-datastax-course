package playlist.model;

import com.datastax.driver.core.Session;
import junit.framework.TestCase;
import java.util.List;
import java.util.UUID;

/**
 * DataStax Academy Sample Application
 *
 * Copyright 2013 DataStax
 *
 */

public class SongTest extends TestCase {

  public void testFindTracksByArtist() throws Exception {

    List<TracksDAO> songs = TracksDAO.listSongsByArtist("The Pioneers");

    assertEquals(44, songs.size());

    // Check the first track
    TracksDAO firstTrack = songs.get(0);

    assertEquals("Ali Button", firstTrack.getTrack());

  }

  public void testFindTracksByGenre() throws Exception {

    List<TracksDAO> songs = TracksDAO.listSongsByGenre("classical");

    assertEquals(1874, songs.size());

    // Check the first track
    TracksDAO firstTrack = songs.get(0);

    assertEquals("Concerto grosso No. 10 en Ré Mineur_ Op. 6: Air lento", firstTrack.getTrack());

  }

  private void cleanTestTrack() {
    Session session = CassandraData.getSession();
    session.execute("DELETE FROM artists_by_first_letter WHERE first_letter = '-' ");
    session.execute("DELETE FROM track_by_artist WHERE artist = '-The Riptanos' ");
    session.execute("DELETE FROM track_by_genre WHERE genre = 'geek music' ");
  }

  public void testAddSongAndArtist() throws Exception {

    cleanTestTrack();

    // Validate data is clean

    assertEquals(0,TracksDAO.listSongsByArtist("-The Riptanos").size());
    assertEquals(0,TracksDAO.listSongsByGenre("geek music").size());

    TracksDAO tracksDAO = new TracksDAO("-The Riptanos", "Share a Mind", "geek music", "Music File", 100 );
    tracksDAO.add();

    assertEquals(1,TracksDAO.listSongsByArtist("-The Riptanos").size());
    assertEquals(1,TracksDAO.listSongsByGenre("geek music").size());
    assertEquals(100,TracksDAO.listSongsByGenre("geek music").get(0).getTrack_length_in_seconds());

    cleanTestTrack();
  }

}
