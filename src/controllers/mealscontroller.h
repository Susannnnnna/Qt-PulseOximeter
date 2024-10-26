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
