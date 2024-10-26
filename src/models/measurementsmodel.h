<<<<<<< HEAD
#ifndef MEASUREMENTSMODEL_H
#define MEASUREMENTSMODEL_H

#include <QObject>
#include "basecrudmodel.h"

class MeasurementsModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit MeasurementsModel(QObject *parent = nullptr);

    bool addMeasurement(const QString &userId,
                        QDateTime measurementDate,
                        double spo2,
                        double heartRate);
    QList<QVariantMap> getMeasurements();
    bool editMeasurement(int id,
                         QDateTime measurementDate,
                         double spo2,
                         double heartRate);
    bool deleteMeasurement(int id);
};

#endif // MEALSMODEL_H
=======
#ifndef MEASUREMENTSMODEL_H
#define MEASUREMENTSMODEL_H

#include "basecrudmodel.h"
#include <QObject>

class MeasurementsModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit MeasurementsModel(QObject *parent = nullptr);

    bool addMeasurement(double spo2, double heartRate);
    QList<QVariantMap> getMeasurements();
    bool editMeasurement(int id, double spo2, double heartRate);
    bool deleteMeasurement(int id);
};

#endif // MEALSMODEL_H
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
