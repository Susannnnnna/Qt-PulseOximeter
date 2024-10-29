#include "additionaleventsmodel.h"
#include <QSqlError>
#include <QDebug>
#include <QDateTime>

AdditionalEventsModel::AdditionalEventsModel(QObject *parent) : BaseCrudModel(parent) {
    createTable("CREATE TABLE IF NOT EXISTS AdditionalEvents "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "user_id TEXT, "
                "additional_event_date DATETIME, "
                "additional_event TEXT, "
                "synch BOOLEAN DEFAULT FALSE, "
                "create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,"
                "modify_stamp DATETIME)");
}

bool AdditionalEventsModel::addAdditionalEvent(const QString &userId, QDateTime additionalEventDate, const QString &additionalEvent) {
    QVariantMap values;
    QString formattedDate = additionalEventDate.toString("yyyy-MM-dd HH:mm");
    values[":user_id"] = userId;
    values[":additional_event_date"] =  formattedDate;
    values[":additional_event"] = additionalEvent;
    return addData("INSERT INTO AdditionalEvents (user_id, additional_event_date, additional_event) "
                   "VALUES (:user_id, :additional_event_date, :additional_event)", values);
}

QList<QVariantMap> AdditionalEventsModel::getAdditionalEvents() {
    return getData("SELECT * FROM AdditionalEvents");
}

bool AdditionalEventsModel::editAdditionalEvent(int id, QDateTime additionalEventDate, const QString &additionalEvent) {
    QVariantMap values;
    QString formattedDate = additionalEventDate.toString("yyyy-MM-dd HH:mm");
    values[":additional_event_date"] = formattedDate;
    values[":additional_event"] = additionalEvent;
    values[":id"] = id;
    return editData("UPDATE AdditionalEvents SET "
                    "additional_event_date = :additional_event_date, "
                    "additional_event = :additional_event, "
                    "modify_stamp = CURRENT_TIMESTAMP "
                    "WHERE id = :id", values);
}

bool AdditionalEventsModel::deleteAdditionalEvent(int id) {
    return deleteData("DELETE FROM AdditionalEvents WHERE id = :id", id);
}
