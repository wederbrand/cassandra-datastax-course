package playlist.model;

import com.datastax.driver.core.Session;
import junit.framework.TestCase;

import java.util.List;
import java.util.Set;
import java.util.UUID;

/**
 * DataStax Academy Sample Application
 *
 * Copyright 2013 DataStax
 *
 */

public class PlaylistDAOTest extends TestCase {


  @Override
  protected void setUp() throws Exception {
    super.setUp();

    Session session  = CassandraData.getSession();
    session.execute("TRUNCATE users");
    session.execute("TRUNCATE playlist_tracks");

  }

  public void testDeletePlayList() throws Exception {

    UserDAO user = UserDAO.addUser("testuser1","pw");
    PlaylistDAO pl = PlaylistDAO.createPlayList(user,"Bob's favorites");

    assertEquals("testuser1",pl.getUsername() );

    UserDAO testUser = UserDAO.getUser("testuser1");
    Set<String> playlists = testUser.getPlaylist_names();

    assertTrue("playlist exists", playlists.contains("Bob's favorites"));

    pl.deletePlayList();
    testUser = UserDAO.getUser("testuser1");
    playlists = testUser.getPlaylist_names();

    assertFalse("playlist exists", playlists.contains("Bob's favorites"));

    user.deleteUser();

  }

  public void testAddPlayList() throws Exception {
    UserDAO user = UserDAO.addUser("testuser1","pw");
    PlaylistDAO pl = PlaylistDAO.createPlayList(user, "Bob's favorites");

    assertEquals("testuser1",pl.getUsername() );

    UserDAO testUser = UserDAO.getUser("testuser1");
    Set<String> playlists = testUser.getPlaylist_names();

    assertTrue("playlist exists", playlists.contains("Bob's favorites"));

    user.deleteUser();

  }

}
