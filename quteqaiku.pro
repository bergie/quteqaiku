# Add more folders to ship with the application, here
folder_01.source = qml/quteqaiku
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# Avoid auto screen rotation
#DEFINES += ORIENTATIONLOCK

# Needs to be defined for Symbian
#DEFINES += NETWORKACCESS

symbian:TARGET.UID3 = 0xE1B4CA5B

# Define QMLJSDEBUGGER to allow debugging of QML in debug builds
# (This might significantly increase build time)
# DEFINES += QMLJSDEBUGGER

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    utils.cpp

HEADERS += \
    utils.h

OTHER_FILES += \
    qml/quteqaiku/StatusDelegate.qml \
    qml/quteqaiku/MessageView.qml \
    qml/quteqaiku/SettingsView.qml \
    qml/quteqaiku/main.qml \
    qml/quteqaiku/StreamView.qml
