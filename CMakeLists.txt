cmake_minimum_required(VERSION 3.16)

project(HealthApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Core Gui Qml Quick Sql Network)

qt_standard_project_setup()

qt_add_executable(appHealthApp
    main.cpp
)

qt_add_qml_module(appHealthApp
    URI HealthApp
    VERSION 1.0

    RESOURCE_PREFIX /
    NO_RESOURCE_TARGET_PATH

    QML_FILES
        qml/main.qml

        qml/components/MyButton.qml
        qml/components/MyListView.qml
        qml/components/MyTextField.qml
        qml/components/MyLabeledRadioButtons.qml
        qml/components/MyText.qml
        qml/components/MyNumberPad.qml

        qml/screens/HomeScreen.qml
        qml/screens/SettingsScreen.qml
        qml/screens/LoginScreen.qml
        qml/screens/LogoutScreen.qml
        qml/screens/TESTScreen.qml
        qml/styles/MyStyles.qml

        qml/screens/ExercisesScreen.qml
        qml/screens/MealsScreen.qml
        qml/screens/EverydayWellBeingScreen.qml
        qml/screens/AdditionaDataScreen.qml
        qml/screens/PulseOximeterScreen.qml
        qml/screens/ChartsScreen.qml
        qml/screens/KnowledgeScreen.qml

    SOURCES
        src/controllers/measurementscontroller.h
        src/controllers/measurementscontroller.cpp
        src/controllers/mealscontroller.h
        src/controllers/mealscontroller.cpp

        src/models/measurementsmodel.h
        src/models/measurementsmodel.cpp
        src/models/basecrudmodel.h
        src/models/basecrudmodel.cpp
        src/models/mealsmodel.h
        src/models/mealsmodel.cpp

    RESOURCES
        README.md

        assets/icons/add.png
        assets/icons/menu-bar.png
        assets/icons/menu-bar2.png
        assets/icons/house.png
        assets/icons/home-page.png
        assets/icons/smartwatch.png
        assets/icons/smartwatch2.png
        assets/icons/analytics.png
        assets/icons/wellbeing.png
        assets/icons/information.png
        assets/icons/diet.png
        assets/icons/additional-events.png
        assets/icons/personal-settings.png
        assets/icons/logout.png
        assets/icons/yoga-pose.png
        assets/icons/delete.png
        assets/icons/delete2.png
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
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::Sql Qt6::Network
)

include(GNUInstallDirs)
install(TARGETS appHealthApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
