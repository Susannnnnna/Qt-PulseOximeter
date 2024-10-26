#include "additionaleventscontroller.h"
#include "qdatetime.h"

AdditionalEventsController::AdditionalEventsController(AdditionalEventsModel *model, QObject *parent)
    : QObject(parent), m_model(model){}

bool AdditionalEventsController::addAdditionalEvent(const QString &userId,
                                                    QDateTime additionalEventDate,
                                                    const QString &additionalEvent) {
    return m_model->addAdditionalEvent(userId,
                                       additionalEventDate,
                                       additionalEvent);
}

QList<QVariantMap> AdditionalEventsController::getAdditionalEvents() {
    return m_model->getAdditionalEvents();
}

bool AdditionalEventsController::editAdditionalEvent(int id,
                                                     QDateTime additionalEventDate,
                                                     const QString &additionalEvent) {
    return m_model->editAdditionalEvent(id,
                                        additionalEventDate,
                                        additionalEvent);
}

bool AdditionalEventsController::deleteAdditionalEvent(int id) {
    return m_model->deleteAdditionalEvent(id);
}
