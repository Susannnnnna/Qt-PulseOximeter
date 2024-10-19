#include "mealsmodel.h"
#include <QSqlError>
#include <QDebug>
#include <QDateTime>

MealsModel::MealsModel(QObject *parent) : BaseCrudModel(parent) {
    createTable("CREATE TABLE IF NOT EXISTS Meals "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "meal_date DATETIME, "
                "meal TEXT, "
                "synch BOOLEAN DEFAULT 0, "
                "timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,");
//                "modify_stamp DATETIME DEFAULT CURRENT_TIMESTAMP)");
}

bool MealsModel::addMeal(QDateTime mealDate, const QString &meal) {
    QVariantMap values;
    QString formattedMealDate = mealDate.toString("yyyy-MM-dd HH:mm");
    values[":meal_date"] =  formattedMealDate;
    values[":meal"] = meal;
    return addData("INSERT INTO Meals (meal_date, meal) "
                      "VALUES (:meal_date, :meal)", values);
}

QList<QVariantMap> MealsModel::getMeals() {
    return getData("SELECT * FROM Meals");
}

bool MealsModel::editMeal(int id, QDateTime mealDate, const QString &meal) {
    QVariantMap values;
    QString formattedMealDate = mealDate.toString("yyyy-MM-dd HH:mm");
    values[":meal_date"] = formattedMealDate;
    values[":meal"] = meal;
    values[":id"] = id;
    return editData("UPDATE Meals SET "
                      "meal_date = :meal_date, meal = :meal"
                      "WHERE id = :id", values);
}

bool MealsModel::deleteMeal(int id) {
    return deleteData("DELETE FROM Meals WHERE id = :id", id);
}
