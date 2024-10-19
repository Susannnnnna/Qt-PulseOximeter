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
