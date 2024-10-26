<<<<<<< HEAD
#include "measurementscontroller.h"
#include "qdatetime.h"

MeasurementsController::MeasurementsController(MeasurementsModel *model, QObject *parent)
    : QObject(parent), m_model(model){}

bool MeasurementsController::addMeasurement(const QString &userId,
                                            QDateTime measurementDate,
                                            double spo2,
                                            double heartRate) {
    return m_model->addMeasurement(userId, measurementDate, spo2, heartRate);
}

QList<QVariantMap> MeasurementsController::getMeasurements() {
    return m_model->getMeasurements();
}

bool MeasurementsController::editMeasurement(int id,
                                             QDateTime measurementDate,
                                             double spo2,
                                             double heartRate) {
    return m_model->editMeasurement(id, measurementDate, spo2, heartRate);
}

bool MeasurementsController::deleteMeasurement(int id) {
    return m_model->deleteMeasurement(id);
}
=======
#include "measurementscontroller.h"

MeasurementsController::MeasurementsController(MeasurementsModel *model, QObject *parent)
    : QObject(parent), m_model(model){}

bool MeasurementsController::addMeasurement(double spo2, double heartRate) {
    return m_model->addMeasurement(spo2, heartRate);
}

QList<QVariantMap> MeasurementsController::getMeasurements() {
    return m_model->getMeasurements();
}

bool MeasurementsController::editMeasurement(int id, double spo2, double heartRate) {
    return m_model->editMeasurement(id, spo2, heartRate);
}

bool MeasurementsController::deleteMeasurement(int id) {
    return m_model->deleteMeasurement(id);
}
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
