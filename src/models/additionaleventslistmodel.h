#ifndef ADDITIONALEVENTSLISTMODEL_H
#define ADDITIONALEVENTSLISTMODEL_H

#include <QAbstractListModel>
#include <QVariantMap>

class AdditionalEventsListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit AdditionalEventsListModel(QObject *parent = nullptr);

    enum AdditionalEventRole {
        ItemIdRole = Qt::UserRole + 1,
        Item1Role,
        Item2Role
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setAdditionalEvents(const QList<QVariantMap> &additionalEvents);
    bool removeAdditionalEventById(int id);

signals:
    void dataChanged();

private:
    QList<QVariantMap> m_additionalEvents;

};

#endif // ADDITIONALEVENTSLISTMODEL_H
