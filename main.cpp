#include <QtGui/QApplication>
//#include "qmlapplicationviewer.h"
#include <QSettings>
#include <QDeclarativeContext>
#include <QDeclarativeView>
#include "utils.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Utils u;

    //QmlApplicationViewer viewer;
    //viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    //viewer.setMainQmlFile(QLatin1String("qml/quteqaiku/main.qml"));

    QDeclarativeView viewer;
    viewer.rootContext()->setContextProperty("MainSettings", &u);
    viewer.setSource(QUrl::fromLocalFile("qml/quteqaiku/main.qml"));
    viewer.show();

    return app.exec();
}
