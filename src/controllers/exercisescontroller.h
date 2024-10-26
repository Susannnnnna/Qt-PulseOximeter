#ifndef EXERCISESCONTROLLER_H
#define EXERCISESCONTROLLER_H

#include <QObject>
#include <QDateTime>
#include "../models/exercisesmodel.h"

class ExercisesController : public QObject
{
    Q_OBJECT
public:
    explicit ExercisesController(ExercisesModel *model, QObject *parent = nullptr);

    Q_INVOKABLE bool addExercise(const QString &userId,
                                 QDateTime exerciseDate,
                                 const QString &exercise);
    Q_INVOKABLE QList<QVariantMap> getExercises();
    Q_INVOKABLE bool editExercise(int id,
                                  QDateTime exerciseDate,
                                  const QString &exercise);
    Q_INVOKABLE bool deleteExercise(int id);

private:
    ExercisesModel *m_model;

};

#endif // EXERCISESCONTROLLER_H
