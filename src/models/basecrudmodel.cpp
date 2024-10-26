<<<<<<< HEAD
#include "basecrudmodel.h"
#include "qdir.h"
#include <QSqlError>
#include <QDebug>
#include <QSqlRecord>
#include <QStandardPaths>

BaseCrudModel::BaseCrudModel(QObject *parent)
    : QObject{parent} {

    QString path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);

    QDir dir(path);
    if (!dir.exists()) {
        dir.mkpath(path);
        qDebug() << "Path not exist: " << path << "\n";
    } else {
        qDebug() << "Path exist: " << path << "\n";
    }

    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path + "/healthapp.db");

    if(!db.open()) {
        qDebug() << "Error opening database: " << db.lastError();
    }
}

bool BaseCrudModel::createTable(const QString &query) {
    QSqlQuery q;
    if(!q.exec(query)) {
        qDebug() << "Error creating table: " << q.lastError();
        return false;
    }
    return true;
}

bool BaseCrudModel::addData(const QString &query, const QVariantMap &values) {
    QSqlQuery q;
    q.prepare(query);
    for (auto it = values.constBegin(); it != values.constEnd(); ++it) {
        q.bindValue(it.key(), it.value());
    }
    if(!q.exec()) {
        qDebug() << "Error inserting entry: " << q.lastError();
        return false;
    }
    return true;
}

QList<QVariantMap> BaseCrudModel::getData(const QString &query) {
    QList<QVariantMap> results;
    QSqlQuery q;
    if(!q.exec(query)) {
        qDebug() << "Error reading data: " << q.lastError();
        return results;
    }
    while (q.next()) {
        QVariantMap entry;
        for (int i = 0; i < q.record().count(); ++i) {
            entry[q.record().fieldName(i)] = q.value(i);
        }
        results.append(entry);
    }
    return results;
}

bool BaseCrudModel::editData(const QString &query, const QVariantMap &values) {
    QSqlQuery q;
    q.prepare(query);
    for (auto it = values.constBegin(); it != values.constEnd(); ++it) {
        q.bindValue(it.key(), it.value());
    }
    if(!q.exec()) {
        qDebug() << "Error updating data: " << q.lastError();
        return false;
    }
    return true;
}

bool BaseCrudModel::deleteData(const QString &query, int id) {
    QSqlQuery q;
    q.prepare(query);
    q.bindValue(":id", id);
    if(!q.exec()) {
        qDebug() << "Error deleting data: " << q.lastError();
        return false;
    }
    return true;
}
=======
#include "basecrudmodel.h"
#include "qdir.h"
#include <QSqlError>
#include <QDebug>
#include <QSqlRecord>
#include <QStandardPaths>

BaseCrudModel::BaseCrudModel(QObject *parent)
    : QObject{parent} {

    QString path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);

    QDir dir(path);
    if (!dir.exists()) {
        dir.mkpath(path);
        qDebug() << "Path not exist: " << path << "\n";
    } else {
        qDebug() << "Path exist: " << path << "\n";
    }

    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path + "/healthapp.db");

    if(!db.open()) {
        qDebug() << "Error opening database: " << db.lastError();
    }
}

bool BaseCrudModel::createTable(const QString &query) {
    QSqlQuery q;
    if(!q.exec(query)) {
        qDebug() << "Error creating table: " << q.lastError();
        return false;
    }
    return true;
}

bool BaseCrudModel::addData(const QString &query, const QVariantMap &values) {
    QSqlQuery q;
    q.prepare(query);
    for (auto it = values.constBegin(); it != values.constEnd(); ++it) {
        q.bindValue(it.key(), it.value());
    }
    if(!q.exec()) {
        qDebug() << "Error inserting entry: " << q.lastError();
        return false;
    }
    return true;
}

QList<QVariantMap> BaseCrudModel::getData(const QString &query) {
    QList<QVariantMap> results;
    QSqlQuery q;
    if(!q.exec(query)) {
        qDebug() << "Error reading data: " << q.lastError();
        return results;
    }
    while (q.next()) {
        QVariantMap entry;
        for (int i = 0; i < q.record().count(); ++i) {
            entry[q.record().fieldName(i)] = q.value(i);
        }
        results.append(entry);
    }
    return results;
}

bool BaseCrudModel::editData(const QString &query, const QVariantMap &values) {
    QSqlQuery q;
    q.prepare(query);
    for (auto it = values.constBegin(); it != values.constEnd(); ++it) {
        q.bindValue(it.key(), it.value());
    }
    if(!q.exec()) {
        qDebug() << "Error updating data: " << q.lastError();
        return false;
    }
    return true;
}

bool BaseCrudModel::deleteData(const QString &query, int id) {
    QSqlQuery q;
    q.prepare(query);
    q.bindValue(":id", id);
    if(!q.exec()) {
        qDebug() << "Error deleting data: " << q.lastError();
        return false;
    }
    return true;
}
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
