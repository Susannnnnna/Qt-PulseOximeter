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
    QSqlQuery query;
    query.prepare("INSERT INTO Meals (user_id, meal_date, meal) VALUES (?, ?, ?)");
    query.addBindValue(userId);
    query.addBindValue(mealDate.toString("yyyy-MM-dd HH:mm"));
    query.addBindValue(meal);
    return query.exec();
}

QList<QVariantMap> MealsModel::getMeals() {
    return getData("SELECT * FROM Meals");
}

bool MealsModel::editMeal(int id, QDateTime mealDate, const QString &meal) {
    QSqlQuery query;
    query.prepare("UPDATE Meals SET "
                      "meal_date = ?, "
                      "meal = ?, "
                      "modify_stamp = CURRENT_TIMESTAMP "
                      "WHERE id = ?");
    query.addBindValue(mealDate.toString("yyyy-MM-dd HH:mm"));
    query.addBindValue(meal);
    query.addBindValue(id);
    qDebug() << "Executing editMeal with ID: " << id << ", Meal date: " << mealDate << ", Meal: " << meal;

    bool success = query.exec();
    if (!success) {
        qDebug() << "Failed to edit meal: " << query.lastError().text();
    } else {
        qDebug() << "Meal edit successfully for ID: " << id;
    }
    return success;
}

bool MealsModel::deleteMeal(int id) {
    return deleteData("DELETE FROM Meals WHERE id = :id", id);
}
