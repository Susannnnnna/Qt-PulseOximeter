#ifndef SETTINGSCONTROLLER_H
#define SETTINGSCONTROLLER_H

#include <QObject>
#include "../models/settingsmodel.h"

class SettingsController : public QObject
{
    Q_OBJECT
public:
    explicit SettingsController(SettingsModel *model, QObject *parent = nullptr);

    Q_INVOKABLE bool addSettings(const QString &email,
                                 const QString &nickname,
                                 int birthYear,
                                 int height,
                                 int weight,
                                 const QString &gender);
    Q_INVOKABLE QList<QVariantMap> getSettings();
    Q_INVOKABLE bool editSettings(int id,
                                  const QString &nickname,
                                  int birthYear,
                                  int height,
                                  int weight,
                                  const QString &gender);

private:
    SettingsModel *m_model;

};

#endif // SETTINGSCONTROLLER_H
