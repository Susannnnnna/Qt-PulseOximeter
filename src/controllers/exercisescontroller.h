#ifndef EXERCISESCONTROLLER_H
#define EXERCISESCONTROLLER_H

#include <QObject>
#include <QDateTime>
#include "../models/exercisesmodel.h"
#include "../models/exerciseslistmodel.h"

class ExercisesController : public QObject
{
    Q_OBJECT
public:
    explicit ExercisesController(ExercisesModel *model, ExercisesListModel *listModel, QObject *parent = nullptr);

    Q_INVOKABLE bool addExercise(const QString &userId,
                                 QDateTime exerciseDate,
                                 const QString &exercise);
    Q_INVOKABLE void getExercises();
    Q_INVOKABLE bool editExercise(int id,
                                  QDateTime exerciseDate,
                                  const QString &exercise);
    Q_INVOKABLE bool deleteExercise(int id);

private:
    ExercisesModel *m_model;
    ExercisesListModel *m_listModel;

};

#endif // EXERCISESCONTROLLER_H
