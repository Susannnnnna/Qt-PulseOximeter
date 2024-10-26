#ifndef BASECRUDMODEL_H
#define BASECRUDMODEL_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QList>
#include <QVariantMap>

class BaseCrudModel : public QObject
{
    Q_OBJECT
public:
    explicit BaseCrudModel(QObject *parent = nullptr);
    virtual ~BaseCrudModel() {}

    bool createTable(const QString &query);
    bool addData(const QString &query, const QVariantMap &values);
    QList<QVariantMap> getData(const QString &query);
    bool editData(const QString &query, const QVariantMap &values);
    bool deleteData(const QString &query, int id);

protected:
    QSqlDatabase db;
    QString tableName;

};

#endif // BASECRUDMODEL_H
