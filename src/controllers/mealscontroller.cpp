#include "mealscontroller.h"
#include "qdatetime.h"

MealsController::MealsController(MealsModel *model, MealsListModel *listModel, QObject *parent)
    : QObject(parent), m_model(model), m_listModel(listModel) {}

bool MealsController::addMeal(const QString &userId, QDateTime mealDate, const QString &meal) {
    bool success = m_model->addMeal(userId, mealDate, meal);
    if (success) {
        getMeals();
        emit m_listModel->dataChanged();
    }
    return success;
}

void MealsController::getMeals() {
    QList<QVariantMap> meals = m_model->getMeals();
    qDebug() << "Meals loaded: " << meals;
    m_listModel->setMeals(meals);
    emit m_listModel->dataChanged();
}

bool MealsController::editMeal(int id, QDateTime mealDate, const QString &meal) {
    qDebug() << "editMeal() called with id: " << id << ", mealData: " << mealDate << ", meal:" << meal;
    bool success = m_model->editMeal(id, mealDate, meal);
    if (success) {
        getMeals();
    } else {
        qDebug() << "editMeal failed for id: " << id;
    }
    return success;
}

bool MealsController::deleteMeal(int id) {
    qDebug() << "deleteMeal() called with id: " << id;
    bool success = m_model->deleteMeal(id);
    if (success) {
        qDebug() << "Record successfully deleted from database with id: " << id;
        bool removed = m_listModel->removeMealById(id);
        qDebug() << "Item removed from model: " << removed;
    } else {
        qDebug() << "Failed to delete record from database with id:" << id;
    }
    return success;
}
