localdrupal
===========

A small script to spin up a local drupal site quickly.

Inspired by the likes of Drupal Quickstart and Pro Drupal virtual machines I wanted a way to spin up a local site very quickly on my Mac.

The small script leverages the useful virtualhost.sh project and assumes a copy of dnsmasq running which points all .dev domains to the localhost.

You'll need to chmod a+x localdrupal.sh in order to run this after downloading.  

Example usage: 
localdrupal.sh create test.dev

