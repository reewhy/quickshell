import qs
import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import QtQuick.Layouts

StyledPopup {
    id: root

    ColumnLayout {
        id: columnLayout
        anchors.centerIn: parent
        spacing: 4

        RowLayout {
            spacing: 5

            MaterialSymbol {
                fill: 0
                font.weight: Font.Medium
                text: KDEConnect.materialSymbol
                iconSize: Appearance.font.pixelSize.large
                color: Appearance.colors.colOnSurfaceVariant
            }
            StyledText {
                horizontalAlignment: Text.AlignLeft
                color: Appearance.colors.colOnSurfaceVariant
                text: `${KDEConnect.batteryPercentage}%`
                font.weight: Font.Medium
            }
        }
    }
}
