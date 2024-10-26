#include "mealslistmodel.h"

MealsListModel::MealsListModel(QObject *parent)
    : QAbstractListModel(parent) {}

int MealsListModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_meals.size();
}

QVariant MealsListModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_meals.size())
        return QVariant();

    const QVariantMap &meal = m_meals.at(index.row());

    if (role == ItemIdRole) return meal["id"];
    if (role == Item1Role) return meal["meal_date"];
    if (role == Item2Role) return meal["meal"];
    return QVariant();
}

QHash<int, QByteArray> MealsListModel::roleNames() const {
    return {
        { ItemIdRole, "itemId" },
        { Item1Role, "item1" },
        { Item2Role, "item2" }
    };
}

void MealsListModel::setMeals(const QList<QVariantMap> &meals) {
    beginResetModel();
    m_meals = meals;
    endResetModel();
    qDebug() << "Set meals in model: " << m_meals;
}

bool MealsListModel::removeMealById(int id) {
    for (int i = 0; i < m_meals.size(); ++i) {
        if (m_meals[i]["id"].toInt() == id) {
            beginRemoveRows(QModelIndex(), i, i);
            m_meals.removeAt(i);
            endRemoveRows();
            qDebug() << "Item was removed form m_meals, id: " << id;
            return true;
        }
    }
    qDebug() << "Item not found: " << id;
    return false;
}
