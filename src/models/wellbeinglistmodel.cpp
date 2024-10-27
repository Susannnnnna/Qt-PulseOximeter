#include "wellbeinglistmodel.h"

WellbeingListModel::WellbeingListModel(QObject *parent)
    : QAbstractListModel(parent) {}

int WellbeingListModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_wellbeing.size();
}

QVariant WellbeingListModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_wellbeing.size())
        return QVariant();

    const QVariantMap &wellbeing = m_wellbeing.at(index.row());

    if (role == ItemIdRole) return wellbeing["id"];
    if (role == Item1Role) return wellbeing["wellbeing_date"];
    if (role == Item2Role) return wellbeing["sleep"];
    if (role == Item3Role) return wellbeing["wellbeing"];
    if (role == Item4Role) return wellbeing["skinCondition"];
    if (role == Item5Role) return wellbeing["distraction"];
    if (role == Item6Role) return wellbeing["comments"];
    return QVariant();
}

QHash<int, QByteArray> WellbeingListModel::roleNames() const {
    return {
        { ItemIdRole, "itemId" },
        { Item1Role, "item1" },
        { Item2Role, "item2" },
        { Item3Role, "item3" },
        { Item4Role, "item4" },
        { Item5Role, "item5" },
        { Item6Role, "item6" }
    };
}

void WellbeingListModel::setWellbeing(const QList<QVariantMap> &wellbeing) {
    beginResetModel();
    m_wellbeing = wellbeing;
    endResetModel();
}

bool WellbeingListModel::removeWellbeingById(int id) {
    for (int i = 0; i < m_wellbeing.size(); ++i) {
        if (m_wellbeing[i]["id"].toInt() == id) {
            beginRemoveRows(QModelIndex(), i, i);
            m_wellbeing.removeAt(i);
            endRemoveRows();
            return true;
        }
    }
    return false;
}
