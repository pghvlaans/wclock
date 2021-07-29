**wclock-0.1.2**

*Please Note:* This is a development version of `wclock`. As such, it may not have been tested as thoroughly as `wclock-0.1.1`, the stable version. `compat` and `extras` are written against anticipated changes in `tzdata-2021b`.

wclock is a shell program to conveniently get times from around the world in terminal emulators and tty. It interfaces with `date` and the zoneinfo directory to acquire time zones that match user-provided search terms (case-insensitive, spaces OK).

The following features are included for increased convenience:

* Extra cities: A list of cities, metro areas, etc. with a population of over 400,000 is referenced in addition to the named time zones. `wclock washington`, for example, will return a time for Washington, DC using the America/New_York time zone.
* Country search: Look up time zones by country.
* Breaks: Use -b between search terms to retrieve the time in multiple locations: `wclock los angeles -b sendai -b south africa`
* Time and date check: use -t to find your local time at a given day and time in the search location: `wclock -t 10:00 2021/07/13 -b finland`
* Reverse time and date check: Alternatively, use -l to find the time in the search location when it is the given time in your local time zone: `wclock -l 10:00 2021/07/13 -b lagos`
* Query mode: Use -q with a continent (or any other directory inside `/usr/share/zoneinfo/posix`) to get a list of available time zones, e.g. `wclock -q asia`. -q without further parameters gives a list of such directories.

[![screenshot](https://user-images.githubusercontent.com/74497663/126334543-be612228-80d2-4bda-9dc0-73d9ab60bcbf.png?raw=true)](https://user-images.githubusercontent.com/74497663/126334543-be612228-80d2-4bda-9dc0-73d9ab60bcbf.png?raw=true)

*Dependencies*

wclock needs the following in place to work properly:

* tzdata
* findutils
* coreutils
* grep
* less
* A POSIX-compliant shell, or any other shell with a POSIX compliance mode

The following are installation dependencies:

* sed
* gzip

These packages should be included on almost any Linux installation.

*Compatibility*

This version of wclock was written against tzdata-2021b. However, it should operate correctly with versions of tzdata dating back to tzdata-2012a.

*Installation*

See INSTALL for installation instructions.

*Bug Reporting*

To report bugs or incorrect time zones, request alternate city spellings, etc., please feel free to open a GitHub issue or email the author directly.

*Acknowledgement*

The list of extra cities was adapted from Chris Youderian's Basic World Cities Database at SimpleMaps.com (Pareto Software, LLC). The Basic World Cities Database is covered by the Creative Commons 4.0 License. See ATTRIBUTION for details. The overall SimpleMaps.com license can be found in SIMPLEMAPS-LICENSE.

*Disclaimer*

No listing (or absence of listing) in the "extras" document is intended as a political statement or as an endorsement of any particular interpretation of statehood claims or national borders. Any extra names, old spellings, etc. were added for making the search functionality more convenient or avoiding deprecated time zones.
