#include "exercisescontroller.h"
#include "qdatetime.h"

ExercisesController::ExercisesController(ExercisesModel *model, ExercisesListModel *listModel, QObject *parent)
    : QObject(parent), m_model(model), m_listModel(listModel) {}

bool ExercisesController::addExercise(const QString &userId,
                                      QDateTime exerciseDate,
                                      const QString &exercise) {
    bool success = m_model->addExercise(userId, exerciseDate, exercise);
    if (success) {
        getExercises();
        emit m_listModel->dataChanged();
    }
    return success;
}

void ExercisesController::getExercises() {
    QList<QVariantMap> exercises = m_model->getExercises();
    m_listModel->setExercises(exercises);
    emit m_listModel->dataChanged();
}

bool ExercisesController::editExercise(int id,
                                       QDateTime exerciseDate,
                                       const QString &exercise) {
    bool success = m_model->editExercise(id, exerciseDate, exercise);
    if (success) {
        getExercises();
    }
    return success;
}

bool ExercisesController::deleteExercise(int id) {
    bool success = m_model->deleteExercise(id);
    if (success) {
        m_listModel->removeExerciseById(id);
    }
    return success;
}
