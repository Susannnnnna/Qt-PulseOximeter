<<<<<<< HEAD
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

=======
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
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
