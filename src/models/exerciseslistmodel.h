#ifndef EXERCISESLISTMODEL_H
#define EXERCISESLISTMODEL_H

#include <QAbstractListModel>
#include <QVariantMap>

class ExercisesListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ExercisesListModel(QObject *parent = nullptr);

    enum ExerciseRole {
        ItemIdRole = Qt::UserRole + 1,
        Item1Role,
        Item2Role
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setExercises(const QList<QVariantMap> &exercises);
    bool removeExerciseById(int id);

signals:
    void dataChanged();

private:
    QList<QVariantMap> m_exercises;

};

#endif // EXERCISESLISTMODEL_H
