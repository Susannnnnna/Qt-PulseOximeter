#include "wellbeingmodel.h"
#include <QSqlError>
#include <QDebug>
#include <QDateTime>

WellbeingModel::WellbeingModel(QObject *parent) : BaseCrudModel(parent) {
    createTable("CREATE TABLE IF NOT EXISTS Wellbeing "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "wellbeing_date DATETIME, "
                "user_id TEXT, "
                "sleep REAL, "
                "period BOOLEAN, "
                "wellbeing REAL, "
                "skinCondition REAL, "
                "distraction REAL, "
                "synch BOOLEAN DEFAULT FALSE, "
                "create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,"
                "modify_stamp DATETIME)");
}

bool WellbeingModel::addWellbeing(const QString &userId,
                                  QDateTime wellbeingDate,
                                  double sleep,
                                  bool period,
                                  double wellbeing,
                                  double skinCondition,
                                  double distraction,
                                  const QString &comments) {
    QVariantMap values;
    QString formattedDate = wellbeingDate.toString("yyyy-MM-dd HH:mm");
    values[":user_id"] = userId;
    values[":wellbeing_date"] =  formattedDate;
    values[":sleep"] = sleep;
    values[":period"] = period;
    values[":wellbeing"] = wellbeing;
    values[":skinCondition"] = skinCondition;
    values[":distraction"] = distraction;
    values[":comments"] = comments;
    return addData("INSERT INTO Wellbeing (user_id, wellbeing_date, sleep, period, wellbeing, skinCondition, distraction, comments) "
                   "VALUES (:user_id, :wellbeing_date, :sleep, :period, :wellbeing, :skinCondition, :distraction, :comments)", values);
}

QList<QVariantMap> WellbeingModel::getWellbeings() {
    return getData("SELECT * FROM Wellbeing");
}

bool WellbeingModel::editWellbeing(int id,
                                   QDateTime wellbeingDate,
                                   double sleep,
                                   bool period,
                                   double wellbeing,
                                   double skinCondition,
                                   double distraction,
                                   const QString &comments) {
    QVariantMap values;
    QString formattedDate = wellbeingDate.toString("yyyy-MM-dd HH:mm");
    values[":wellbeing_date"] = formattedDate;
    values[":sleep"] = sleep;
    values[":period"] = period;
    values[":wellbeing"] = wellbeing;
    values[":skinCondition"] = skinCondition;
    values[":distraction"] = distraction;
    values[":comments"] = comments;
    values[":id"] = id;
    return editData("UPDATE Wellbeing SET "
                    "wellbeing_date = :wellbeing_date, "
                    "sleep = :sleep, "
                    "period = :period, "
                    "wellbeing = :wellbeing, "
                    "skinCondition = :skinCondition, "
                    "distraction = :distraction, "
                    "comments = :comments, "
                    "modify_stamp = CURRENT_TIMESTAMP "
                    "WHERE id = :id", values);
}

bool WellbeingModel::deleteWellbeing(int id) {
    return deleteData("DELETE FROM Wellbeing WHERE id = :id", id);
}
