#include <QDateTime>
#include <QMetaType>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/controllers/measurementscontroller.h"
#include "src/models/measurementsmodel.h"
#include "src/controllers/mealscontroller.h"
#include "src/models/mealsmodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qRegisterMetaType<QDateTime>("QDateTime");

    MeasurementsModel measurementsModel;
    MeasurementsController measurementsController(&measurementsModel);

    MealsModel mealsModel;
    MealsController mealsController(&mealsModel);

    QQmlApplicationEngine engine;

    qmlRegisterSingletonType(QUrl("qrc:src/views/screens/TESTStyle.qml"), "TESTMyStyles", 1, 0, "TESTMyStyles");
    qmlRegisterSingletonType(QUrl("qrc:qml/styles/MyStyles.qml"), "MyStyles", 1, 0, "MyStyles");

    engine.rootContext()->setContextProperty("measurementsController", &measurementsController);
    engine.rootContext()->setContextProperty("mealsController", &mealsController);

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
