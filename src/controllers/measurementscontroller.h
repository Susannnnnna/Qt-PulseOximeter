#ifndef MEASUREMENTSCONTROLLER_H
#define MEASUREMENTSCONTROLLER_H

#include <QObject>
#include <QDateTime>
#include "../models/measurementsmodel.h"

class MeasurementsController : public QObject
{
    Q_OBJECT
public:
    explicit MeasurementsController(MeasurementsModel *model, QObject *parent = nullptr);

    Q_INVOKABLE bool addMeasurement(const QString &userId,
                                    QDateTime measurementDate,
                                    double spo2,
                                    double heartRate);
    Q_INVOKABLE QList<QVariantMap> getMeasurements();
    Q_INVOKABLE bool editMeasurement(int id,
                                     QDateTime measurementDate,
                                     double spo2,
                                     double heartRate);
    Q_INVOKABLE bool deleteMeasurement(int id);

private:
    MeasurementsModel *m_model;

};

#endif // MEALSCONTROLLER_H

