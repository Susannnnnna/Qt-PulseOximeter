#ifndef WELLBEINGMODEL_H
#define WELLBEINGMODEL_H

#include <QObject>
#include "basecrudmodel.h"

class WellbeingModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit WellbeingModel(QObject *parent = nullptr);

    bool addWellbeing(const QString &userId,
                      QDateTime wellbeingDate,
                      double sleep,
                      bool period,
                      double wellbeing,
                      double skinCondition,
                      double distraction,
                      const QString &comments);
    QList<QVariantMap> getWellbeings();
    bool editWellbeing(int id,
                       QDateTime wellbeingDate,
                       double sleep,
                       bool period,
                       double wellbeing,
                       double skinCondition,
                       double distraction,
                       const QString &comments);
    bool deleteWellbeing(int id);

};

#endif // WELLBEINGMODEL_H
