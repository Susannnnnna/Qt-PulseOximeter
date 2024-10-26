#include "mealscontroller.h"
#include "qdatetime.h"

MealsController::MealsController(MealsModel *model, MealsListModel *listModel, QObject *parent)
    : QObject(parent), m_model(model), m_listModel(listModel) {}

bool MealsController::addMeal(const QString &userId, QDateTime mealDate, const QString &meal) {
    bool success = m_model->addMeal(userId, mealDate, meal);
    if (success) {
        getMeals();
    }
    return success;
}

void MealsController::getMeals() {
    QList<QVariantMap> meals = m_model->getMeals();
    m_listModel->setMeals(meals);
}

bool MealsController::editMeal(int id, QDateTime mealDate, const QString &meal) {
    bool success = m_model->editMeal(id, mealDate, meal);
    if (success) {
        getMeals();
    }
    return success;
}

bool MealsController::deleteMeal(int id) {
    bool success = m_model->deleteMeal(id);
    if (success) {
        qDebug() << "Remove record with id: " << id;
        bool removed = m_listModel->removeMealById(id);
        qDebug() << "Item removed from model: " << removed;
    }
    return success;
}
