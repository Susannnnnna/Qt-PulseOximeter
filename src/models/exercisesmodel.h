#ifndef EXERCISESMODEL_H
#define EXERCISESMODEL_H

#include <QObject>
#include "basecrudmodel.h"

class ExercisesModel : public BaseCrudModel
{
    Q_OBJECT
public:
    explicit ExercisesModel(QObject *parent = nullptr);

    bool addExercise(const QString &userId,
                     QDateTime exerciseDate,
                     const QString &exercise);
    QList<QVariantMap> getExercises();
    bool editExercise(int id,
                      QDateTime exerciseDate,
                      const QString &exercise);
    bool deleteExercise(int id);

};

#endif // EXERCISESMODEL_H
