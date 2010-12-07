#ifndef UTILS_H
#define UTILS_H

#include <QtGui/QApplication>
#include <QObject>
#include <QSettings>

class Utils : public QObject
{
    Q_OBJECT
public:
    explicit Utils(QObject *parent = 0);

signals:

public slots:

    void saveSetting(QString key, QVariant value);
    QVariant readSetting(QString key);

private:

    QSettings set;

};

#endif // UTILS_H
