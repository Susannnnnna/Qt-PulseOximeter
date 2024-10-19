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
