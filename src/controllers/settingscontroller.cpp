#include "settingscontroller.h"

SettingsController::SettingsController(SettingsModel *model, QObject *parent)
    : QObject(parent), m_model(model){}


bool SettingsController::addSettings(const QString &email,
                                     const QString &nickname,
                                     int birthYear,
                                     int height,
                                     int weight,
                                     const QString &gender) {
    return m_model->addSettings(email,
                                nickname,
                                birthYear,
                                height,
                                weight,
                                gender);
}

QList<QVariantMap> SettingsController::getSettings() {
    return m_model->getSettings();
}

bool SettingsController::editSettings(int id,
                                      const QString &nickname,
                                      int birthYear,
                                      int height,
                                      int weight,
                                      const QString &gender) {
    return m_model->editSettings(id,
                                 nickname,
                                 birthYear,
                                 height,
                                 weight,
                                 gender);
}
