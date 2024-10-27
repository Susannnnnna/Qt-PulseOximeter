#ifndef SETTINGSMODEL_H
#define SETTINGSMODEL_H

#include <QObject>
#include "src/models/basecrudmodel.h"

class SettingsModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit SettingsModel(QObject *parent = nullptr);

    bool addSettings(const QString &email,
                                 const QString &nickname,
                                 int birthYear,
                                 int height,
                                 int weight,
                                 const QString &gender);
    QList<QVariantMap> getSettings();
    bool editSettings(int id,
                                  const QString &nickname,
                                  int birthYear,
                                  int height,
                                  int weight,
                                  const QString &gender);
signals:

};

#endif // SETTINGSMODEL_H
