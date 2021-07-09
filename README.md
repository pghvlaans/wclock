**wclock-0.1.0**

wclock is a simple shell script to conveniently get times from around the world in terminal emulators and tty. It interfaces with /usr/share/zoneinfo to acquire time zones that match a user-provided search term (case- and space-insensitive).

The following features are included for increased convenience:

* Query mode: Use -q with a continent (or any other directory inside /usr/share/zoneinfo/posix) to get a list of available time zones, e.g. `wclock -q asia`. -q without further parameters gives a list of such directories.
* Extra cities: A list of cities, metro areas, etc. with a population of over 400,000 is referenced if no matching time zone is found. `wclock washington`, for example, will return a time for Washington, DC using the America/New_York time zone.
* Country search: Look up time zones by country.

*Dependencies*

wclock needs the following in place to work properly:

* tzdata (specifically, time zone data in /usr/share/zoneinfo)
* findutils
* coreutils
* grep
* less
* A POSIX-compliant shell, or any other shell with a POSIX compliance mode
* sed (for installation)
* gzip (for installation)

These packages should be included on almost any Linux or BSD installation. wclock has been tested with Linux and FreeBSD.

*Bug Reporting*

To report bugs or incorrect time zones, request alternate city spellings, etc., please feel free to open a GitHub issue or email the author directly.

*Acknowledgement*

The list of extra cities was adapted from the Basic World Cities Database provided by Pareto Software, LLC through Simplemaps.com, covered by the Creative Commons 4.0 License. See ATTRIBUTION and SIMPLEMAPS-LICENSE for details.

*Disclaimer*

No listing (or absence of listing) in the "extras" document is intended as a political statement or as an endorsement of any particular interpretation of statehood claims or national borders. Any extra names, old spellings, etc. were added for the sole purpose of making the search functionality more convenient.
