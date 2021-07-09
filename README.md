**wclock-0.1.0**

wclock is a simple shell script to conveniently get times from around the world in terminal emulators and tty. It interfaces with /usr/share/zoneinfo to acquire time zones that match a user-provided search term (case- and space-insensitive).

The following features are included for increased convenience:

* Query mode: Use -q with a continent (or any other directory inside /usr/share/zoneinfo/posix) to get a list of available time zones, e.g. `wclock -q asia`. -q without further parameters gives a list of such directories.
* Extra cities: A list of cities, metro areas, etc. with a population of over 400,000 is referenced if no matching time zone is found. `wclock washington`, for example, will return a time for Washington, DC using the America/New_York time zone.

*Dependencies*

wclock needs the following in place to work properly:

* tzdata (specifically, time zone data in /usr/share/zoneinfo)
* findutils
* coreutils
* grep
* less
* A POSIX-compliant shell (e.g. dash, ksh), or any other shell with a POSIX compliance mode (e.g. bash, zsh)

These packages should be included on almost any Linux or BSD installation. wclock has been tested with Linux and FreeBSD.

*Bug Reporting*

To report bugs or incorrect time zones, request alternate city spellings, etc., please feel free to open a GitHub issue or email the author directly.

*Acknowledgement*

The list of extra cities was adapted from the Basic World Cities Database provided by Pareto, Inc. through simplemaps.com, covered by the Creative Commons 4.0 License. See ATTRIBUTION and SIMPLEMAPS-LICENSE for details.

(move below to ATTRIBUTION)
Changes to the original source material include:

* Removing entries associated with cities populated by less than 400,000 people
* Removing entries matching an existing time zone name (New York, Shanghai, London, etc.)
* Removing all data except for the city name in ASCII
* Replacing spaces with underscores
* Adding alternate spellings for some cities
* Placing the resulting data in a text file
* Appending a time zone to each entry
