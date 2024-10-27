#ifndef MEASUREMENTSMODEL_H
#define MEASUREMENTSMODEL_H

#include <QObject>
#include "src/models/basecrudmodel.h"

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
