import qs
import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import QtQuick.Layouts
import Quickshell

Item {
    id: root
    
    implicitWidth: rowLayout.implicitWidth
    implicitHeight: Appearance.sizes.barHeight

    RowLayout{
        id: rowLayout
        anchors.centerIn: parent
        spacing: 4

        MaterialSymbol {
            id: mobileIcon
            Layout.alignment: Qt.AlignVCenter
            fill: 0
            text: "mobile"
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton

        KDEConnectTooltip {
            hoverTarget: mouseArea
        }
    }
}
