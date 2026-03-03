from app.modules.tracks.repository import TrackRepository

class TrackService:
    def __init__(
        self,
        repository: TrackRepository,
    ):
        self.repository = repository

    def get_track(self, track_id: int):
        track = self.repository.get_by_id(track_id)
        if not track:
            raise ValueError("Track not found")
        return track

    def get_all_tracks(self):
        return self.repository.list()

    def verify_existing_track(self, artist_name: int):
        track = self.repository.get_by_artist_name(artist_name)
        if not track:
            raise ValueError("Track not found")
        if track.deleted_at:
            raise ValueError("Track has been deleted")
        return track
    
