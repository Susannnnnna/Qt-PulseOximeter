#include "measurementsmodel.h"
#include <QSqlError>
#include <QDebug>
#include <QDateTime>

MeasurementsModel::MeasurementsModel(QObject *parent) : BaseCrudModel(parent) {
    createTable("CREATE TABLE IF NOT EXISTS Measurements "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "spo2 REAL, "
                "heart_rate REAL,"
                "timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)");
}

bool MeasurementsModel::addMeasurement(double spo2, double heartRate) {
    QVariantMap values;
    values[":spo2"] =  spo2;
    values[":heart_rate"] = heartRate;
    return addData("INSERT INTO Measurements (spo2, heart_rate) "
                      "VALUES (:spo2, :heart_rate)", values);
}

QList<QVariantMap> MeasurementsModel::getMeasurements() {
    return getData("SELECT * FROM Measurements");
}

bool MeasurementsModel::editMeasurement(int id, double spo2, double heartRate) {
    QVariantMap values;
    values[":spo2"] = spo2;
    values[":heart_rate"] = heartRate;
    values[":id"] = id;
    return editData("UPDATE Measurements SET "
                      "spo2 = :spo2, heart_rate = :heart_rate "
                      "WHERE id = :id", values);
}

bool MeasurementsModel::deleteMeasurement(int id) {
    return deleteData("DELETE FROM Measurements WHERE id = :id", id);
}
