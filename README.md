BYU-I-Roku-Channel
==================

BYU-Idaho's Roku Channel

This Repository contains all of the essential code to create a mrss based roku feed. I have also added m3u8 live stream support to the channel as well. 

Config.opml - This is the meat of the file itself. All of the feeds have been configured else where (kaltura in our case) as well as an xml file that imports the live feeds (currently located on byuidahoradio.org's server). Currently the feed has 3 top level links (each of the <outline> tags) and inside two of them are nested other channels.

Manifest - This file I have not configured yet outside of just the name and the subtitle.

Source Files (*.brs) - These are all of the default files that were pulled from the Roku SDK MRSS example. I did however edit the NWM_MRSS.brs file. Line 47 is where I added support for HLS streams to this via this if statement.

