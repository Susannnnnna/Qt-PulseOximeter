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
    qDebug() << "[MealsController.cpp] Meals loaded: " << meals;
    m_listModel->setMeals(meals);
    emit m_listModel->dataChanged();
}

bool MealsController::editMeal(int id, QDateTime mealDate, const QString &meal) {
    try {
        qDebug() << "[MealsController.cpp] editMeal() called with id: " << id << ", mealData: " << mealDate << ", meal:" << meal;
        if (!m_model->editMeal(id, mealDate, meal)) {
            throw std::runtime_error("Failed to edit meal in database.");
            //getMeals();
        }
    } catch (const std::exception &e) {
        emit errorOccured(QString::fromStdString(e.what()));
        return false;
    }
    return true;
}

bool MealsController::deleteMeal(int id) {
    qDebug() << "[MealsController.cpp] deleteMeal() called with id: " << id;
    bool success = m_model->deleteMeal(id);
    if (success) {
        qDebug() << "[MealsController.cpp] Record successfully deleted from database with id: " << id;
        bool removed = m_listModel->removeMealById(id);
        qDebug() << "[MealsController.cpp] Item removed from model: " << removed;
    } else {
        qDebug() << "[MealsController.cpp] Failed to delete record from database with id:" << id;
    }
    return success;
}
