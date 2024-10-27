#include "settingsmodel.h"
#include <QSqlError>
#include <QDebug>


SettingsModel::SettingsModel(QObject *parent) : BaseCrudModel(parent) {
    createTable("CREATE TABLE IF NOT EXISTS Settings "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "email TEXT, "
                "nickname TEXT, "
                "birth_year INT, "
                "height INT, "
                "weight INT, "
                "gender TEXT, "
                "synch boolen DEFAULT FALSE, "
                "create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,"
                "modify_stamp DATETIME)");
}

bool SettingsModel::addSettings(const QString &email,
                                const QString &nickname,
                                int birthYear,
                                int height,
                                int weight,
                                const QString &gender) {
    QVariantMap values;
    values[":email"] = email;
    values[":nickname"] = nickname;
    values[":birth_year"] =  birthYear;
    values[":height"] = height;
    values[":weight"] = weight;
    values[":gender"] = gender;
    return addData("INSERT INTO Settings "
                   "(email, nickname, birth_year, height, weight, gender) "
                   "VALUES (:email, :nickname, :birth_year, :height, :weight, :gender)", values);
}

QList<QVariantMap> SettingsModel::getSettings() {
    return getData("SELECT * FROM Settings");
}

bool SettingsModel::editSettings(int id,
                                 const QString &nickname,
                                 int birthYear,
                                 int height,
                                 int weight,
                                 const QString &gender) {
    QVariantMap values;
    values[":id"] = id;
    values[":nickname"] = nickname;
    values[":birth_year"] =  birthYear;
    values[":height"] = height;
    values[":weight"] = weight;
    values[":gender"] = gender;
    return editData("UPDATE Settings SET "
                    "email = :email, "
                    "nickname = :nickname, "
                    "birth_year = :birth_year, "
                    "height = :height, "
                    "weight = :weight, "
                    "gender = :gender, "
                    "modify_stamp = CURRENT_TIMESTAMP "
                    "WHERE id = :id", values);
}
