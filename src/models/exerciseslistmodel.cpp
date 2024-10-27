#include "exerciseslistmodel.h"

ExercisesListModel::ExercisesListModel(QObject *parent)
    : QAbstractListModel(parent) {}

int ExercisesListModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_exercises.size();
}

QVariant ExercisesListModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_exercises.size())
        return QVariant();

    const QVariantMap &meal = m_exercises.at(index.row());

    if (role == ItemIdRole) return meal["id"];
    if (role == Item1Role) return meal["exercise_date"];
    if (role == Item2Role) return meal["exercise"];
    return QVariant();
}

QHash<int, QByteArray> ExercisesListModel::roleNames() const {
    return {
        { ItemIdRole, "itemId" },
        { Item1Role, "item1" },
        { Item2Role, "item2" }
    };
}

void ExercisesListModel::setExercises(const QList<QVariantMap> &exercises) {
    beginResetModel();
    m_exercises = exercises;
    endResetModel();
    qDebug() << "Set exercises in model: " << m_exercises;
}

bool ExercisesListModel::removeExerciseById(int id) {
    for (int i = 0; i < m_exercises.size(); ++i) {
        if (m_exercises[i]["id"].toInt() == id) {
            beginRemoveRows(QModelIndex(), i, i);
            m_exercises.removeAt(i);
            endRemoveRows();
            qDebug() << "Item was removed form m_exercises, id: " << id;
            return true;
        }
    }
    qDebug() << "Item not found: " << id;
    return false;
}
