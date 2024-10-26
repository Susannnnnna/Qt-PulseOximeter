#include "exercisescontroller.h"
#include "qdatetime.h"

ExercisesController::ExercisesController(ExercisesModel *model, QObject *parent)
    : QObject(parent), m_model(model){}

bool ExercisesController::addExercise(const QString &userId,
                                      QDateTime exerciseDate,
                                      const QString &exercise) {
    return m_model->addExercise(userId, exerciseDate, exercise);
}

QList<QVariantMap> ExercisesController::getExercises() {
    return m_model->getExercises();
}

bool ExercisesController::editExercise(int id,
                                       QDateTime exerciseDate,
                                       const QString &exercise) {
    return m_model->editExercise(id, exerciseDate, exercise);
}

bool ExercisesController::deleteExercise(int id) {
    return m_model->deleteExercise(id);
}
