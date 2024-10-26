#include "measurementsmodel.h"
#include <QSqlError>
#include <QDebug>
#include <QDateTime>

MeasurementsModel::MeasurementsModel(QObject *parent) : BaseCrudModel(parent) {
    createTable("CREATE TABLE IF NOT EXISTS Measurements "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "user_id TEXT, "
                "measurement_date DATETIME"
                "spo2 REAL, "
                "heart_rate REAL, "
                "synch boolen DEFAULT FALSE, "
                "create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,"
                "modify_stamp DATETIME)");
}

bool MeasurementsModel::addMeasurement(const QString &userId, QDateTime measurementDate, double spo2, double heartRate) {
    QVariantMap values;
    QString formattedMeasurementDate = measurementDate.toString("yyyy-MM-dd HH:mm:ss");
    values[":user_id"] = userId;
    values[":measurement_date"] = formattedMeasurementDate;
    values[":spo2"] =  spo2;
    values[":heart_rate"] = heartRate;
    return addData("INSERT INTO Measurements (user_id, measurement_date, spo2, heart_rate) "
                      "VALUES (:user_id, :measurement_date, :spo2, :heart_rate)", values);
}

QList<QVariantMap> MeasurementsModel::getMeasurements() {
    return getData("SELECT * FROM Measurements");
}

bool MeasurementsModel::editMeasurement(int id, QDateTime measurementDate, double spo2, double heartRate) {
    QVariantMap values;
    QString formattedDate = measurementDate.toString("yyyy-MM-dd HH:mm:ss");
    values[":measurement_date"] = formattedDate;
    values[":spo2"] = spo2;
    values[":heart_rate"] = heartRate;
    values[":id"] = id;
    return editData("UPDATE Measurements SET "
                      "measurement_date = :measurement_date, spo2 = :spo2, heart_rate = :heart_rate, modify_stamp = CURRENT_TIMESTAMP "
                      "WHERE id = :id", values);
}

bool MeasurementsModel::deleteMeasurement(int id) {
    return deleteData("DELETE FROM Measurements WHERE id = :id", id);
}
