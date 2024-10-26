#ifndef WELLBEINGCONTROLLER_H
#define WELLBEINGCONTROLLER_H

#include <QObject>
#include <QDateTime>
#include "../models/wellbeingmodel.h"

class WellbeingController : public QObject
{
    Q_OBJECT
public:
    explicit WellbeingController(WellbeingModel *model, QObject *parent = nullptr);

    Q_INVOKABLE bool addWellbeing(const QString &userId,
                                  QDateTime wellbeingDate,
                                  double sleep,
                                  bool period,
                                  double wellbeing,
                                  double skinCondition,
                                  double distraction,
                                  const QString &comments);
    Q_INVOKABLE QList<QVariantMap> getWellbeings();
    Q_INVOKABLE bool editWellbeing(int id,
                                   QDateTime wellbeingDate,
                                   double sleep,
                                   bool period,
                                   double wellbeing,
                                   double skinCondition,
                                   double distraction,
                                   const QString &comments);
    Q_INVOKABLE bool deleteWellbeing(int id);

private:
    WellbeingModel *m_model;

};

#endif // WELLBEINGCONTROLLER_H
