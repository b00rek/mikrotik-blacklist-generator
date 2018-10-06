# mikrotik-blacklist-generator
Parses a few blacklists, aggregates their data and prepares a file, ready to import on Mikrotik devices. Meant to be running as a cron job on a web server, from which then Mikrotik fetches the blacklist and imports it periodically.

**Most of the blacklists this script pulls data from are updated once daily, and they are currently free for everyone to use. So please respect that, and don't hog their servers with requests every few seconds. Once or twice a day is more than enough. If you want your blacklists updated in realtime, I suggest setting up a honeypot, or consider subscribing to some lists distributed via BGP.**

# Licensing
Original script found on Joshaven Potter's website: http://joshaven.com/resources/tricks/mikrotik-automatically-updated-address-list/

CIDR calculator by Kai Schlichting: http://www.spamshield.org/

Based on that, figure out which license applies here. My modifications are free to use by anyone. Credit would be nice, but it's not necessary.
