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
