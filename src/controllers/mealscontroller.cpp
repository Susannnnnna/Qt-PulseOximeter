#include "mealscontroller.h"
#include "qdatetime.h"

MealsController::MealsController(MealsModel *model, QObject *parent)
    : QObject(parent), m_model(model){}

bool MealsController::addMeal(QDateTime mealDate, const QString &meal) {
    return m_model->addMeal(mealDate, meal);
}

QList<QVariantMap> MealsController::getMeals() {
    return m_model->getMeals();
}

bool MealsController::editMeal(int id, QDateTime mealDate, const QString &meal) {
    return m_model->editMeal(id, mealDate, meal);
}

bool MealsController::deleteMeal(int id) {
    return m_model->deleteMeal(id);
}
