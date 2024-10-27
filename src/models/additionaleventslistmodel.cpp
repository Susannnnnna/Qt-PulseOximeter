#include "additionaleventslistmodel.h"

AdditionalEventsListModel::AdditionalEventsListModel(QObject *parent)
    : QAbstractListModel(parent) {}

int AdditionalEventsListModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_additionalEvents.size();
}

QVariant AdditionalEventsListModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_additionalEvents.size())
        return QVariant();

    const QVariantMap &additionalEvent = m_additionalEvents.at(index.row());

    if (role == ItemIdRole) return additionalEvent["id"];
    if (role == Item1Role) return additionalEvent["additional_event_date"];
    if (role == Item2Role) return additionalEvent["additional_event"];
    return QVariant();
}

QHash<int, QByteArray> AdditionalEventsListModel::roleNames() const {
    return {
        { ItemIdRole, "itemId" },
        { Item1Role, "item1" },
        { Item2Role, "item2" }
    };
}

void AdditionalEventsListModel::setAdditionalEvents(const QList<QVariantMap> &additionalEvents) {
    beginResetModel();
    m_additionalEvents = additionalEvents;
    endResetModel();
}

bool AdditionalEventsListModel::removeAdditionalEventById(int id) {
    for (int i = 0; i < m_additionalEvents.size(); ++i) {
        if (m_additionalEvents[i]["id"].toInt() == id) {
            beginRemoveRows(QModelIndex(), i, i);
            m_additionalEvents.removeAt(i);
            endRemoveRows();
            return true;
        }
    }
    return false;
}
