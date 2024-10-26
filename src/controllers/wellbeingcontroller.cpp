#include "wellbeingcontroller.h"
#include "qdatetime.h"

WellbeingController::WellbeingController(WellbeingModel *model, QObject *parent)
    : QObject(parent), m_model(model){}

bool WellbeingController::addWellbeing(const QString &userId,
                                       QDateTime wellbeingDate,
                                       double sleep,
                                       bool period,
                                       double wellbeing,
                                       double skinCondition,
                                       double distraction,
                                       const QString &comments) {
    return m_model->addWellbeing(userId,
                                 wellbeingDate,
                                 sleep,
                                 period,
                                 wellbeing,
                                 skinCondition,
                                 distraction,
                                 comments);
}

QList<QVariantMap> WellbeingController::getWellbeings() {
    return m_model->getWellbeings();
}

bool WellbeingController::editWellbeing(int id,
                                        QDateTime wellbeingDate,
                                        double sleep,
                                        bool period,
                                        double wellbeing,
                                        double skinCondition,
                                        double distraction,
                                        const QString &comments) {
    return m_model->editWellbeing(id,
                                  wellbeingDate,
                                  sleep,
                                  period,
                                  wellbeing,
                                  skinCondition,
                                  distraction,
                                  comments);
}

bool WellbeingController::deleteWellbeing(int id) {
    return m_model->deleteWellbeing(id);
}
