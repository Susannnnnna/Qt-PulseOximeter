#include "exercisesmodel.h"
#include <QSqlError>
#include <QDebug>
#include <QDateTime>

ExercisesModel::ExercisesModel(QObject *parent) : BaseCrudModel(parent)
{
    createTable("CREATE TABLE IF NOT EXISTS Exercises "
                "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "user_id TEXT, "
                "exercise_date DATETIME, "
                "exercise TEXT, "
                "synch BOOLEAN DEFAULT FALSE, "
                "create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,"
                "modify_stamp DATETIME)");
}

bool ExercisesModel::addExercise(const QString &userId, QDateTime exerciseDate, const QString &exercise) {
    QVariantMap values;
    QString formattedDate = exerciseDate.toString("yyyy-MM-dd HH:mm");
    values[":user_id"] = userId;
    values[":exercise_date"] =  formattedDate;
    values[":exercise"] = exercise;
    return addData("INSERT INTO Exercises (user_id, exercise_date, exercise) "
                   "VALUES (:user_id, :exercise_date, :exercise)", values);
}

QList<QVariantMap> ExercisesModel::getExercises() {
    return getData("SELECT * FROM Meals");
}

bool ExercisesModel::editExercise(int id, QDateTime exerciseDate, const QString &exercise) {
    QVariantMap values;
    QString formattedDate = exerciseDate.toString("yyyy-MM-dd HH:mm");
    values[":exercise_date"] = formattedDate;
    values[":exercise"] = exercise;
    values[":id"] = id;
    return editData("UPDATE Exercises SET "
                    "exercise_date = :exercise_date, "
                    "exercise = :exercise, "
                    "modify_stamp = CURRENT_TIMESTAMP "
                    "WHERE id = :id", values);
}

bool ExercisesModel::deleteExercise(int id) {
    return deleteData("DELETE FROM Exercises WHERE id = :id", id);
}
