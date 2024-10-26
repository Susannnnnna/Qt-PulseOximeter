#ifndef ADDITIONALEVENTSMODEL_H
#define ADDITIONALEVENTSMODEL_H

#include <QObject>
#include "basecrudmodel.h"

class AdditionalEventsModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit AdditionalEventsModel(QObject *parent = nullptr);

    bool addAdditionalEvent(const QString &userId,
                            QDateTime additionalEventDate,
                            const QString &additionalEvent);
    QList<QVariantMap> getAdditionalEvents();
    bool editAdditionalEvent(int id,
                             QDateTime additionalEventDate,
                             const QString &additionalEvent);
    bool deleteAdditionalEvent(int id);

};

#endif // ADDITIONALEVENTSMODEL_H
