## Worklight Starter App for Native iOS

Sample applications shows a list of news in a Table View

The sample application shows how to use the Worklight API to connect to the Worklight Server and invoke an Adapter procedure.

The application contains the minimal modifications and customizations on purpose, not intended to be publish to App Store.

### Installation

Download or clone the repository

    git clone https://github.com/csantanapr/wl-starter-ios-app


Open XCode project WLStarter
    
    open wl-starter-ios-app/WLStarter.xcodeproj


### Running the App with fake data

Click play to run App on iPhone Simulator or Device. 

The App will show items that are locally created.


### Create a Worklight Project
You need to create a new Worklight project, you can use the Worklight Command Line Interface (CLI).
You can download and install the CLI from here [http://public.dhe.ibm.com/ibmdl/export/pub/software/mobile-solutions/worklight/worklight_cli_installer_6.2.0.zip](http://public.dhe.ibm.com/ibmdl/export/pub/software/mobile-solutions/worklight/worklight_cli_installer_6.2.0.zip)

Create a worklight server, this is only need to be done once.
    
    wl create-server
    
Create a project and change directory

    wl create wlproject && cd $_
    
Add ios api, add adapter

    wl add api wlnativeios -e ios
    wl add adapter news -t http

Start the Worklight Server, build, deploy and open the browser console
    
    wl start
    wl build
    wl deploy
    wl console

### Add the Worklight API to WLStarter
For more detail instructions on how to add the Worklight APIs see the documentation [http://ibm.com/support/knowledgecenter/SSZH4A_6.2.0/com.ibm.worklight.dev.doc/devref/t_copying_native_api_files_for_ios.html](http://ibm.com/support/knowledgecenter/SSZH4A_6.2.0/com.ibm.worklight.dev.doc/devref/t_copying_native_api_files_for_ios.html)

#### Using XCode add the following file and folder
Make sure that copy items and create groups is checked.

    wlproject/apps/wlnativeios/worklight.plist
    wlproject/apps/wlnativeios/WorklightAPI

#### Add framework and libraries dependencies
In the target configuration and add the following:

- CoreData.framework
- CoreLocation.framework
- MobileCoreServices.framework
- Security.framework
- SystemConfiguration.framework
- libstdc++.6.dylib
- libz.dylib

#### Update the header search path
In Build Settings add the following entry: $(SRCROOT)/WorklightAPI/include for HEADER_SEARCH_PATH

#### Add Linker flags for the new libraries
In Build Settings  search for "Other Linker Flags"" field, enter the following value: -ObjC

#### Add Keychain Entitlement
Select the Target Capabiltiies turn on Keychain Sharing
If you see an error message like "reason: 'Couldn't add the Keychain Item.'" you forgot to do this

#### Modify the Code to use the Worklight API
Open CSTableViewController.m and change to "#define WORKLIGHT 1"


#### Simulator Issues
If you see an error like "reason: 'Couldn't add the Keychain Item.'" when running on simulator, just reset the Simulator. 
Select "iOS Simulator", then select "Reset Content and Settings..."



