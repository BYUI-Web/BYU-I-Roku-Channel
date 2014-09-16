BYU-I-Roku-Channel
==================

BYU-Idaho's Roku Channel

This Repository contains all of the essential code to create a mrss based roku feed. I have also added m3u8 live stream support to the channel as well. 

Config.opml - This is the meat of the file itself. All of the feeds have been configured else where (kaltura in our case) as well as an xml file that imports the live feeds (currently located on byuidahoradio.org's server). Currently the feed has 3 top level links (each of the <outline> tags) and inside two of them are nested other channels.

Manifest - This file I have not configured yet outside of just the name and the subtitle.

Source Files (*.brs) - These are all of the default files that were pulled from the Roku SDK MRSS example. I did however edit the NWM_MRSS.brs file. Line 47 is where I added support for HLS streams to this via this if statement.

# Accessing the Roku (Web Interface)

The campus roku device is set up with a generic username and password for easy use. When you first try to connect to the roku (by simply visiting its IP address) you will be prompted for a username and password. Those are as follows:

- Username: rokudev
-  terPassword: roku

Yes I know, real original. Don't judge.

# Debugging
To debug on the roku simply telnet into the the box on port 8085. The command will look as follows
```bash
telnet <IP> 8085
```

# Doing Dev
Dev work is all done in the master branch of the roku. The src/ directory contains all of the code required to run the app. By using the web interface you can upload a zip file of the src directory (IMPORTANT NOTE: You have to actually zip the files INSIDE the src/ directory. Not just the directory itself. It won't work I promise). Although tedious you will do your dev in the following pattern:

Write Code -> Zip Contents of Src Dir -> Use web interface to upload/install zip

The roku will refresh itself and you can view your changes

# Deploying the Roku Channel
The last and final hurdle! YAY! Start by telnet'ing into the box on port 8080
```bash
telnet <IP> 8080
```

Next up you will need to generate a key this is done simply as follows:
```bash
genkey
```

Wait a minute and it will give you a Password and DevID. You will only need the password. You will then go back to your Roku web interface and visit the packager link located in the upper left hand corner. Grab your password from the genkey command and then call the app what you will. Click package and download the .pkg file.

Lastly you will visit https://owner.roku.com/Developer/Apps.

Go into your app that you are trying to deploy and click edit. This will take you to a page where you can upload your .pkg file and publish it. Do so and BOOM! your done :)