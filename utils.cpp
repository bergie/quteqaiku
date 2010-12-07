#include "utils.h"

Utils::Utils(QObject *parent) :
    QObject(parent)
{
    QCoreApplication::setApplicationName("QuteQaiku");
    QCoreApplication::setOrganizationName("Qaiku");
    QCoreApplication::setOrganizationDomain("qaiku.com");
}


void Utils::saveSetting(QString key, QVariant value){
    set.setValue(key, value);
}

QVariant Utils::readSetting(QString key)
{
    return set.value(key);
}
