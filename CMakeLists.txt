cmake_minimum_required(VERSION 3.16)

project(HealthApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appHealthApp
    main.cpp
)

qt_add_qml_module(appHealthApp
    URI HealthApp
    VERSION 1.0

    RESOURCE_PREFIX /
    NO_RESOURCE_TARGET_PATH

    QML_FILES qml/main.qml

    QML_FILES qml/sampleData/UserData.qml
    QML_FILES qml/sampleData/ElectronicDevice.qml

    QML_FILES qml/components/MyButton.qml
    QML_FILES qml/components/MyListView.qml
    QML_FILES qml/components/MyTextField.qml
    QML_FILES qml/components/FontConfig.qml
    QML_FILES qml/components/MyLabeledRadioButtons.qml
    QML_FILES qml/components/MyText.qml

    QML_FILES qml/screens/HomeScreen.qml
    QML_FILES qml/screens/SettingsScreen.qml
    QML_FILES qml/screens/UserFormScreen.qml
    QML_FILES qml/screens/NavigationBar.qml
    QML_FILES qml/screens/LoginScreen.qml

    QML_FILES qml/styles/MyStyles.qml
)

# Setup QML import path for development
list(APPEND QML_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/qml")
set(QML_IMPORT_PATH ${QML_IMPORT_PATH} CACHE STRING "QML import paths" FORCE)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHealthApp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHealthApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHealthApp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appHealthApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
