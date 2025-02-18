cmake_minimum_required(VERSION 3.16)

project(BLEPulseSensor VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Charts)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appBLEPulseSensor
    main.cpp
)

set_source_files_properties(qml/styles/MyStyles.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

qt_policy(SET QTP0004 NEW)
qt_add_qml_module(appBLEPulseSensor
    URI BLEPulseSensor
    VERSION 1.0
    QML_FILES
        Main.qml
        qml/styles/MyStyles.qml
        qml/screens/BloodPressureScreen.qml
        qml/screens/DataScreen.qml
        qml/screens/KnowledgeScreen.qml
        qml/components/ImageIcons.qml
        qml/components/InfoCard.qml
        qml/components/TabButtonFooter.qml
        qml/components/LineSeparator.qml

    RESOURCES
        README.md
        assets/icons/dots.png
        assets/icons/analysis.png
        assets/icons/heart.png
        assets/icons/light-bulb.png
        assets/icons/home.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appBLEPulseSensor PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBLEPulseSensor
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appBLEPulseSensor
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::Charts
)

include(GNUInstallDirs)
install(TARGETS appBLEPulseSensor
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
