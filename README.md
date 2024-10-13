# kraken_animelist

API:
 https://api.jikan.moe/v4/top/anime
 https://api.jikan.moe/v4/anime/$id/characters

App design is up to you, design is not important use your imagination.
Android project must work but ios is optional if you have a MacBook.

Problem:
    Use native method channels for calling service requests. Network layer must be on Flutter side.
    Flow:
        Flutter ui sends methodCall to native (fetchAnimeList)
        Native listens that method channel and sends methodCall to Flutter part.
        Flutter listens that method channel and calls fetchAnimeList on bloc.
        Bloc emits the received data to ui via data layer.

Pages:
    Anime list
        Anime detail

Anime list Page
    Musts:
        Show at least 20 anime with pagination
        Show images, title and rating score
    Optionals:
        Filter by tv, movie and upcoming


Detail page
    Musts:
        Show image, title, rating score, genres, synopsis, episodes count and list of characters with images and title.

Musts
    Follow Clean architecture - Feature first instructions
    Use Flutter 3.7.12 (do not use 3.19.1 or any other versions)
    Use bloc/cubit for state management
    Unit tests
    Widget tests

Optionals
    Golden tests
    Use Chopper for network service
    Firebase crashlytics implementation
    Prefer use GetIt and Injectable for dependency injection