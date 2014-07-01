# Worklight Starter App for Native iOS

The sample application shows how to use the Worklight API to connect to the Worklight Server and invoke an Adapter procedure.

The application contains the minimal modifications and customizations for educational purposes, not intended to be publish to App Store.

## Download the Code

Download Zip [zip](https://github.com/csantanapr/wl-starter-ios-app/archive/master.zip) or clone from DevOps

	git clone https://hub.jazz.net/git/csantana23/wl-starter-ios-app


Open XCode project WLStarter
    
    open wl-starter-ios-app/WLStarter.xcodeproj


## Run the App 

Click play to run App on iPhone Simulator or Device. 

The App will show items that are locally created.

## Install Worklight Command Line Interface (CLI)
Download and install the CLI  [worklight_cli_installer_6.2.0.zip](http://public.dhe.ibm.com/ibmdl/export/pub/software/mobile-solutions/worklight/worklight_cli_installer_6.2.0.zip)

Unzip and select the installer based on your operating system, the worklight cli will be ready next time you open a command prompt


## Create a Worklight Project

Create a worklight server, this is only needs to be done once.
    
    wl create-server
    
Create a project and change directory to wlproject

    wl create wlproject && cd $_
    
From inside the Worklight project add ios api, add adapter

    wl add api wlnativeios -e ios
    wl add adapter news -t http

Start the Worklight Server, build, deploy and open the console
    
    wl start
    wl build
    wl deploy
    wl console

To see if the Adapter is ready to receive invocations from the App run:

    wl invoke news:getStories
    
To cli also works in interactive mode if you don't pass arguments, to get more information for the cli run:

    wl help [<command>]


## Add the Worklight API
For more detail instructions on how to add the Worklight APIs see the documentation [http://ibm.com/support/knowledgecenter/SSZH4A_6.2.0/com.ibm.worklight.dev.doc/devref/t_copying_native_api_files_for_ios.html](http://ibm.com/support/knowledgecenter/SSZH4A_6.2.0/com.ibm.worklight.dev.doc/devref/t_copying_native_api_files_for_ios.html)

1. ### Using XCode add the following file and folder
Make sure that copy items and create groups is checked.

    wlproject/apps/wlnativeios/worklight.plist
    wlproject/apps/wlnativeios/WorklightAPI

2. ### Add framework and libraries dependencies
In the target configuration and add the following:

	- CoreData.framework
	- CoreLocation.framework
	- MobileCoreServices.framework
	- Security.framework
	- SystemConfiguration.framework
	- libstdc++.6.dylib
	- libz.dylib

3. ### Update the header search path
In Build Settings add the following entry: $(SRCROOT)/WorklightAPI/include for HEADER_SEARCH_PATH

4. ### Add Linker flags for the new libraries
In Build Settings  search for "Other Linker Flags"" field, enter the following value: -ObjC

5. ### Turn on Keychain Sharing Capabilty
Select the Target Capabiltiies to turn on Keychain Sharing
If you see an error message like "reason: 'Couldn't add the Keychain Item.'" you forgot to do this step

### Modify the Code to use the Worklight API
Open CSTableViewController.m and change to "#define WORKLIGHT 1"
This will change the table to use the Worklight Adapter to get data instead of the local data

#### Simulator Issues
If you see an error like "reason: 'Couldn't add the Keychain Item.'" when running on simulator, just reset the Simulator. 

Select "iOS Simulator" from the menu, then select "Reset Content and Settings..."



