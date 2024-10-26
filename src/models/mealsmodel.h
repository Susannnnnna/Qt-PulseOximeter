#ifndef MEALSMODEL_H
#define MEALSMODEL_H

#include <QObject>
#include "basecrudmodel.h"

class MealsModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit MealsModel(QObject *parent = nullptr);

    bool addMeal(const QString &userId,
                 QDateTime mealDate,
                 const QString &meal);
    QList<QVariantMap> getMeals();
    bool editMeal(int id, QDateTime mealDate,
                  const QString &meal);
    bool deleteMeal(int id);
};

#endif // MEALSMODEL_H
