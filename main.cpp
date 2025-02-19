#include <QDateTime>
#include <QMetaType>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/controllers/mealscontroller.h"
#include "src/controllers/measurementscontroller.h"
#include "src/controllers/exercisescontroller.h"
#include "src/controllers/additionaleventscontroller.h"
#include "src/controllers/wellbeingcontroller.h"
#include "src/controllers/settingscontroller.h"
#include "src/models/mealsmodel.h"
#include "src/models/mealslistmodel.h"
#include "src/models/measurementsmodel.h"
#include "src/models/exercisesmodel.h"
#include "src/models/exerciseslistmodel.h"
#include "src/models/additionaleventsmodel.h"
#include "src/models/additionaleventslistmodel.h"
#include "src/models/wellbeingmodel.h"
#include "src/models/settingsmodel.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qRegisterMetaType<QDateTime>("QDateTime");
    MeasurementsModel measurementsModel;
    MeasurementsController measurementsController(&measurementsModel);
    MealsModel mealsModel;
    MealsListModel mealsListModel;
    MealsController mealsController(&mealsModel, &mealsListModel);
    ExercisesModel exercisesModel;
    ExercisesListModel exercisesListModel;
    ExercisesController exercisesController(&exercisesModel, &exercisesListModel);
    AdditionalEventsModel additionalEventsModel;
    AdditionalEventsListModel additionalEventsListModel;
    AdditionalEventsController additionalEventsController(&additionalEventsModel, &additionalEventsListModel);
    WellbeingModel wellbeingModel;
    WellbeingListModel wellbeingListModel;
    WellbeingController wellbeingController(&wellbeingModel, &wellbeingListModel);
    SettingsModel settingsModel;
    SettingsController settingsController(&settingsModel);
    QQmlApplicationEngine engine;
    qmlRegisterSingletonType(QUrl("qrc:src/views/screens/TESTStyle.qml"), "TESTMyStyles", 1, 0, "TESTMyStyles");
    qmlRegisterSingletonType(QUrl("qrc:qml/styles/MyStyles.qml"), "MyStyles", 1, 0, "MyStyles");
    engine.rootContext()->setContextProperty("measurementsController", &measurementsController);
    engine.rootContext()->setContextProperty("mealsController", &mealsController);
    engine.rootContext()->setContextProperty("mealsListModel", &mealsListModel);
    engine.rootContext()->setContextProperty("exercisesController", &exercisesController);
    engine.rootContext()->setContextProperty("exercisesListModel", &exercisesListModel);
    engine.rootContext()->setContextProperty("additionalEventsController", &additionalEventsController);
    engine.rootContext()->setContextProperty("additionalEventsListModel", &additionalEventsListModel);
    engine.rootContext()->setContextProperty("wellbeingController", &wellbeingController);
    engine.rootContext()->setContextProperty("settingsController", &settingsController);
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}
