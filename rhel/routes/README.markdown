# Routes #

This is a simple Puppet module to manage the routes-eth0 file linux
operating systems.

# Author #

 * Istvan Cebrian <istvan.cebrian@syone.com>
 * [GitHub Project]()
 * [Blog]()

# Sample #

    -------------------------------------------------
	## Routing to mng
	10.2.30.80/28 via 213.30.90.238 dev eth0
	213.30.111.208 via 213.30.90.238 dev eth0
	## Novo ctx Alfragide e Boavista
	212.18.178.128/26 via 213.30.90.238 dev eth0
	212.18.178.192/26 via 213.30.90.238 dev eth0
	## ctx Extranet
	10.11.26.0/24 via 213.30.90.238 dev eth0
	10.11.30.0/24 via 213.30.90.238 dev eth0
	83.174.19.192/28 via 213.30.90.238 dev eth0
	## routing to logcollector1
	10.2.33.16/28 via 213.30.90.238 dev eth0
	## routing O&M Network
	10.2.0.0/16 via 213.30.90.238 dev eth0
	10.128.0.0/16 via 213.30.90.238 dev eth0
	#Routing serv backups
	212.18.189.96/29 via 213.30.90.238 dev eth0
	212.18.189.104/29 via 213.30.90.238 dev eth0
	## routing to OVO
	213.30.111.212 via 213.30.90.238 dev eth0
	## routing to netbackup
	212.18.189.64/28 via 213.30.90.238 dev eth0
	## routing to mon
	213.30.90.224/28 via 213.30.90.238 dev eth0
    -------------------------------------------------

# Getting Started #

In your puppet manifests, site.pp or in the Dashboard or other ENC:

    include routes

