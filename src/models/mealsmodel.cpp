#include "mealsmodel.h"
#include <QSqlError>
#include <QDebug>
#include <QDateTime>

MealsModel::MealsModel(QObject *parent) : BaseCrudModel(parent) {
    createTable("CREATE TABLE IF NOT EXISTS Meals "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "user_id TEXT, "
                "meal_date DATETIME, "
                "meal TEXT, "
                "synch BOOLEAN DEFAULT FALSE, "
                "create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,"
                "modify_stamp DATETIME)");
}

bool MealsModel::addMeal(const QString &userId, QDateTime mealDate, const QString &meal) {
    QVariantMap values;
    QString formattedDate = mealDate.toString("yyyy-MM-dd HH:mm");
    values[":user_id"] = userId;
    values[":meal_date"] =  formattedDate;
    values[":meal"] = meal;
    return addData("INSERT INTO Meals (user_id, meal_date, meal) "
                      "VALUES (:user_id, :meal_date, :meal)", values);
}

QList<QVariantMap> MealsModel::getMeals() {
    return getData("SELECT * FROM Meals");
}

bool MealsModel::editMeal(int id, QDateTime mealDate, const QString &meal) {
    QVariantMap values;
    QString formattedDate = mealDate.toString("yyyy-MM-dd HH:mm");
    values[":meal_date"] = formattedDate;
    values[":meal"] = meal;
    values[":id"] = id;
    return editData("UPDATE Meals SET "
                      "meal_date = :meal_date, "
                      "meal = :meal, "
                      "modify_stamp = CURRENT_TIMESTAMP "
                      "WHERE id = :id", values);
}

bool MealsModel::deleteMeal(int id) {
    return deleteData("DELETE FROM Meals WHERE id = :id", id);
}
