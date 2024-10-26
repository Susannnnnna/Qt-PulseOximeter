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
