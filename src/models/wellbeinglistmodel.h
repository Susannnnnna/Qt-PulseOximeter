#ifndef WELLBEINGLISTMODEL_H
#define WELLBEINGLISTMODEL_H

#include <QAbstractListModel>
#include <QVariantMap>

class WellbeingListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit WellbeingListModel(QObject *parent = nullptr);

    enum WellbeingRole {
        ItemIdRole = Qt::UserRole + 1,
        Item1Role,
        Item2Role,
        Item3Role,
        Item4Role,
        Item5Role,
        Item6Role
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setWellbeing(const QList<QVariantMap> &wellbeing);
    bool removeWellbeingById(int id);

signals:
    void dataChanged();

private:
    QList<QVariantMap> m_wellbeing;

};

#endif // WELLBEINGLISTMODEL_H
