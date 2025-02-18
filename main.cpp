#include <QMetaType>
#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    //QApplication app(argc, argv); // przy korzystaniu z QtCharts
    QQmlApplicationEngine engine;


    engine.addImportPath("qml/styles");
    engine.addImportPath("qml/screens");
    engine.addImportPath("qml/components");

    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    //const QUrl url(QStringLiteral("qrc:/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("BLEPulseSensor", "Main");

    return app.exec();
}
