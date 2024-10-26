<<<<<<< HEAD
#ifndef MEALSCONTROLLER_H
#define MEALSCONTROLLER_H

#include <QObject>
#include <QDateTime>
#include "../models/mealsmodel.h"
#include "../models/mealslistmodel.h"

class MealsController : public QObject
{
    Q_OBJECT
public:
    explicit MealsController(MealsModel *model, MealsListModel *listModel, QObject *parent = nullptr);

    Q_INVOKABLE bool addMeal(const QString &userId,
                             QDateTime mealDate,
                             const QString &meal);
    Q_INVOKABLE void getMeals();
    Q_INVOKABLE bool editMeal(int id,
                              QDateTime mealDate,
                              const QString &meal);
    Q_INVOKABLE bool deleteMeal(int id);

private:
    MealsModel *m_model;
    MealsListModel *m_listModel;

};

#endif // MEALSCONTROLLER_H
=======
#ifndef MEALSCONTROLLER_H
#define MEALSCONTROLLER_H

#include <QObject>
#include <QDateTime>
#include "../models/mealsmodel.h"

class MealsController : public QObject
{
    Q_OBJECT
public:
    explicit MealsController(MealsModel *model, QObject *parent = nullptr);

    Q_INVOKABLE bool addMeal(QDateTime mealDate, const QString &meal);
    Q_INVOKABLE QList<QVariantMap> getMeals();
    Q_INVOKABLE bool editMeal(int i, QDateTime mealDate, const QString &meal);
    Q_INVOKABLE bool deleteMeal(int id);

private:
    MealsModel *m_model;

};

#endif // MEALSCONTROLLER_H
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
