#ifndef MEALSLISTMODEL_H
#define MEALSLISTMODEL_H

#include <QAbstractListModel>
#include <QVariantMap>

class MealsListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit MealsListModel(QObject *parent = nullptr);

    enum MealRoles {
        ItemIdRole = Qt::UserRole + 1,
        Item1Role,
        Item2Role
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setMeals(const QList<QVariantMap> &meals);
    bool removeMealById(int id);

signals:
    void dataChanged();

private:
    QList<QVariantMap> m_meals;

};

#endif // MEALSLISTMODEL_H
