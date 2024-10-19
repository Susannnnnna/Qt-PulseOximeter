#ifndef MEALSMODEL_H
#define MEALSMODEL_H

#include "basecrudmodel.h"
#include <QObject>

class MealsModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit MealsModel(QObject *parent = nullptr);

    bool addMeal(QDateTime mealDate, const QString &meal);
    QList<QVariantMap> getMeals();
    bool editMeal(int id, QDateTime mealDate, const QString &meal);
    bool deleteMeal(int id);
};

#endif // MEALSMODEL_H
