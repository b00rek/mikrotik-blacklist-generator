# mikrotik-blacklist-server
Parses a few blacklists, aggregates their data and prepares a file, ready to import on Mikrotik devices. Meant to be running as a cron job on a web server, from which then Mikrotik fetches the blacklist and imports it periodically.

**Most of the blacklists this script pulls data from are updated once daily, and they are currently free for everyone to use. So please respect that, and don't hog their servers with requests every few seconds.**

# Licensing
Original script found on Joshaven Potter's website: http://joshaven.com/resources/tricks/mikrotik-automatically-updated-address-list/

CIDR calculator by Kai Schlichting: http://www.spamshield.org/
