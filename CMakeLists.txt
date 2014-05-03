project(wmip)

set(appName wmip)

find_package(KDE4 REQUIRED)
 
include(KDE4Defaults)
 

install(DIRECTORY wmip/
        DESTINATION ${DATA_INSTALL_DIR}/plasma/plasmoids/${appName})
 
install(FILES wmip/metadata.desktop
        DESTINATION ${SERVICES_INSTALL_DIR} RENAME plasma-applet-${appName}.desktop)
