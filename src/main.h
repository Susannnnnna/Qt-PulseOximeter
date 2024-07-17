#ifndef MAIN_H
#define MAIN_H

#include <QObject>

class main : public QObject
{
    Q_OBJECT
public:
    explicit main(QObject *parent = nullptr);

signals:

};

#endif // MAIN_H
