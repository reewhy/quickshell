import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import qs.modules.common.functions
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
    id: root
    
    ColumnLayout {
        anchors.fill: parent

        Flickable {
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentHeight: contentColumn.implicitHeight
            
            ColumnLayout {
                id: contentColumn
                anchors.fill: parent

                RowLayout {
                    id: rowLayout
                    Layout.fillWidth: true

                    StyledText {
                        horizontalAlignment: Text.AlignRight
                        color: Appearance.colors.colOnSurfaceVariant
                        text: `${KDEConnect.batteryPercentage}%`
                        font.weight: Font.Medium
                    }
                    MaterialSymbol {
                        fill: 0
                        font.weight: Font.Medium
                        text: KDEConnect.MaterialSymbol
                        iconSize: Appearance.font.pixelSize.large
                        color: Appearance.colors.colOnSurfaceVariant
                    }
                }
            }
        }
    }
}
