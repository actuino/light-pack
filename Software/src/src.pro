# -------------------------------------------------
# src.pro
#
# Copyright (c) 2010,2011 Mike Shatohin, mikeshatohin [at] gmail.com
# http://lightpack.googlecode.com
# Project created by QtCreator 2010-04-28T19:08:13
# -------------------------------------------------

TARGET      = Prismatik
DESTDIR     = bin
TEMPLATE    = app
QT         += network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

# QMake and GCC produce a lot of stuff
OBJECTS_DIR = stuff
MOC_DIR     = stuff
UI_DIR      = stuff
RCC_DIR     = stuff

# Find currect git revision
GIT_REVISION = $$system(git show -s --format="%h")

# For update GIT_REVISION use it:
#   $ qmake Lightpack.pro && make clean && make
#
# Or simply edit this file (add space anythere
# for cause to call qmake) and re-build project

isEmpty( GIT_REVISION ){
    # In code uses #ifdef GIT_REVISION ... #endif
    message( "GIT not found, GIT_REVISION will be undefined" )
} else {
    # Define current mercurial revision id
    # It will be show in about dialog and --help output
    DEFINES += GIT_REVISION=\\\"$${GIT_REVISION}\\\"
}

TRANSLATIONS += ../res/translations/ru_RU.ts \
       ../res/translations/uk_UA.ts
RESOURCES    = ../res/LightpackResources.qrc
RC_FILE      = ../res/Lightpack.rc

include(../build-config.prf)

unix:!macx{
    CONFIG    += link_pkgconfig
    PKGCONFIG += libusb
}

win32 {
    # Windows version using WinAPI for HID
    LIBS    += -lhid -lusbcamd -lsetupapi
    # For QSerialDevice
    LIBS    += -luuid -ladvapi32

    #DX9 grab
    LIBS    += -lgdi32 -ld3d9

    QMAKE_CFLAGS += -O2
    # Windows version using WinAPI + GDI + DirectX for grab colors

    INCLUDEPATH += "$${DIRECTX_SDK_DIR}/Include"
    LIBS    += -lwsock32 -lshlwapi -lole32 -L"$${DIRECTX_SDK_DIR}/Lib/x86" -ldxguid -ld3dx10 -ld3d10 -ld3d10_1 -ldxgi

    LIBS    += -lpsapi

    QMAKE_POST_LINK = cd $(DESTDIR) && \
                cp -f \"$${QTDIR}/bin/QtCore$${DEBUG_EXT}4.dll\" ./ && \
                cp -f \"$${QTDIR}/bin/QtXml$${DEBUG_EXT}4.dll\" ./ && \
                cp -f \"$${QTDIR}/bin/QtGui$${DEBUG_EXT}4.dll\" ./ && \
                cp -f \"$${QTDIR}/bin/QtNetwork$${DEBUG_EXT}4.dll\" ./ && \
                cp -f \"$${MINGW_RUNTIME_DIR}/mingwm10.dll\" ./ && \
                cp -f \"$${MINGW_RUNTIME_DIR}/libgcc_s_dw2-1.dll\" ./ && \
                cp -f \"$${MINGW_RUNTIME_DIR}/libstdc++-6.dll\" ./ && \
              #  cp -f \"$$PWD/../PythonQt/lib/PythonQt$${DEBUG_EXT}.dll\" ./ && \
              #  cp -f \"$$PWD/../PythonQt/lib/PythonQt_QtAll$${DEBUG_EXT}.dll\" ./ && \
              #  cp -f \"$$PWD\"/../python_binaries_win32/* ./
}

unix:!macx{
    # Linux version using libusb and hidapi codes
    SOURCES +=
    # For QSerialDevice
    LIBS += $$QMAKE_LIBS_X11
    LIBS += -ludev -lrt
}

macx{
    # MacOS version using libusb and hidapi codes
    SOURCES +=
    LIBS += -framework IOKit \
            -framework Cocoa \
            -framework Carbon \
            -framework CoreFoundation \
            -framework ApplicationServices \
            -framework OpenGL \
            -L/opt/local/lib -lusb-1.0

    ICON = ../res/icons/Prismatik.icns

    # For build universal binaries (native on Intel and PowerPC)
    QMAKE_MAC_SDK = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk
    QMAKE_POST_LINK = $$PWD/mac_post_link.sh $(DESTDIR) $$PWD
}

INCLUDEPATH += ./hidapi ./grab ./alienfx ./

SOURCES += \
    LightpackApplication.cpp  main.cpp   SettingsWindow.cpp  Settings.cpp \
      GrabWidget.cpp  GrabConfigWidget.cpp \
    SpeedTest.cpp \
    LedDeviceLightpack.cpp \
    LedDeviceAlienFx.cpp \
    LedDeviceAdalight.cpp \
    LedDeviceArdulight.cpp \
    LedDeviceVirtual.cpp \
    ColorButton.cpp \
    grab/WinAPIGrabber.cpp \
    LightpackPluginInterface.cpp \
    ApiServer.cpp \
    ApiServerSetColorTask.cpp \
    LightpackMath.cpp \
    MoodLampManager.cpp \
    LedDeviceManager.cpp \
    SelectWidget.cpp \
    grab/D3D10Grabber/D3D10Grabber.cpp \
    grab/GrabberBase.cpp \
    grab/calculations.cpp \
    grab/TimeredGrabber.cpp \
    grab/X11Grabber.cpp \
    grab/QtGrabber.cpp \
    grab/QtGrabberEachWidget.cpp \
    grab/WinAPIGrabberEachWidget.cpp \
    grab/D3D9Grabber.cpp \
    GrabManager.cpp \
    AbstractLedDevice.cpp \
    grab/FBGrabber.cpp

HEADERS += \
    LightpackApplication.hpp \
    SettingsWindow.hpp \
    Settings.hpp \
    SettingsDefaults.hpp \
    version.h \
    TimeEvaluations.hpp \
    GrabManager.hpp \
    GrabWidget.hpp \
    GrabConfigWidget.hpp \
    debug.h \
    SpeedTest.hpp \
    alienfx/LFXDecl.h \
    alienfx/LFX2.h \
    LedDeviceLightpack.hpp \
    LedDeviceAlienFx.hpp \
    LedDeviceAdalight.hpp \
    LedDeviceArdulight.hpp \
    LedDeviceVirtual.hpp \
    ColorButton.hpp \
    grab/WinAPIGrabber.hpp \
    ../common/defs.h \
    enums.hpp     LightpackPluginInterface.hpp     ApiServer.hpp     ApiServerSetColorTask.hpp \
    ../../CommonHeaders/LIGHTPACK_HW.h \
    ../../CommonHeaders/COMMANDS.h \
    ../../CommonHeaders/USB_ID.h \
    LightpackMath.hpp \
#    plugins/PyPlugin.h \
    MoodLampManager.hpp \
    LedDeviceManager.hpp \
    SelectWidget.hpp \
    ../common/D3D10GrabberDefs.hpp \
    grab/D3D10Grabber/D3D10Grabber.hpp \
    grab/calculations.hpp \
    grab/GrabberBase.hpp \
    grab/TimeredGrabber.hpp \
    grab/X11Grabber.hpp \
    grab/QtGrabber.hpp \
    grab/QtGrabberEachWidget.hpp \
    grab/WinAPIGrabberEachWidget.hpp \
    grab/D3D9Grabber.hpp \
    grab/MacOSGrabber.hpp \
    colorspace_types.h \
    AbstractLedDevice.hpp \
    grab/FBGrabber.hpp

FORMS += SettingsWindow.ui \
    GrabWidget.ui \
    GrabConfigWidget.ui

#
#   QSerialDevice
#
include(qserialdevice/qserialdevice/qserialdevice.pri)
include(qserialdevice/qserialdeviceenumerator/qserialdeviceenumerator.pri)
unix:include(qserialdevice/unix/ttylocker.pri)

#
# QtSingleApplication
#
include(qtsingleapplication/src/qtsingleapplication.pri)

#
# Hotkeys based on PSI and QKeySequenceWidget
#
#include(hotkeys/globalshortcut/globalshortcut.pri)
#include(hotkeys/qkeysequencewidget/qkeysequencewidget.pri)

#
# PythonQt
#
##include (../PythonQt/build/common.prf )
#include (../PythonQt/build/PythonQt.prf )
#include (../PythonQt/build/PythonQt_QtAll.prf )
