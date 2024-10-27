#include "additionaleventscontroller.h"
#include "qdatetime.h"

AdditionalEventsController::AdditionalEventsController(AdditionalEventsModel *model, AdditionalEventsListModel *listModel, QObject *parent)
    : QObject(parent), m_model(model){}

bool AdditionalEventsController::addAdditionalEvent(const QString &userId,
                                                    QDateTime additionalEventDate,
                                                    const QString &additionalEvent) {
    return m_model->addAdditionalEvent(userId,
                                       additionalEventDate,
                                       additionalEvent);
}

void AdditionalEventsController::getAdditionalEvents() {
    QList<QVariantMap> additionalEvents = m_model->getAdditionalEvents();
    m_listModel->setAdditionalEvents(additionalEvents);
    emit m_model->getAdditionalEvents();
}

bool AdditionalEventsController::editAdditionalEvent(int id,
                                                     QDateTime additionalEventDate,
                                                     const QString &additionalEvent) {
    bool success = m_model->editAdditionalEvent(id, additionalEventDate, additionalEvent);
    if (success) {
        getAdditionalEvents();
    }
    return success;
}

bool AdditionalEventsController::deleteAdditionalEvent(int id) {
    bool success = m_model->deleteAdditionalEvent(id);
    if (success) {
        m_listModel->removeAdditionalEventById(id);
    }
    return success;
}
