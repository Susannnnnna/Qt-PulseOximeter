#ifndef ADDITIONALEVENTSCONTROLLER_H
#define ADDITIONALEVENTSCONTROLLER_H

#include <QObject>
#include <QDateTime>
#include "../models/additionaleventsmodel.h"
#include "../models/additionaleventslistmodel.h"

class AdditionalEventsController : public QObject
{
    Q_OBJECT
public:
    explicit AdditionalEventsController(AdditionalEventsModel *model, AdditionalEventsListModel *listModel, QObject *parent = nullptr);

    Q_INVOKABLE bool addAdditionalEvent(const QString &userId,
                                         QDateTime additionalEventDate,
                                         const QString &additionalEvent);
    Q_INVOKABLE void getAdditionalEvents();
    Q_INVOKABLE bool editAdditionalEvent(int id,
                                          QDateTime additionalEventDate,
                                          const QString &additionalEvent);
    Q_INVOKABLE bool deleteAdditionalEvent(int id);

private:
    AdditionalEventsModel *m_model;
    AdditionalEventsListModel *m_listModel;

};

#endif // ADDITIONALEVENTSCONTROLLER_H
