import QtQuick 2.4

Item {
    property var targetItem: parent
    property bool fixedAspectRatio: true // Else zoom from width and height
    property bool accordingToX: true // Else according to center

    property var targetItemGeometry
    property var childrenItemGeometry

    property bool isBegin: false

    function begin() {
        targetItemGeometry = new Object;
        targetItemGeometry["width"] = targetItem.width;
        targetItemGeometry["height"] = targetItem.height;

        var children = targetItem.children;
        var data = new Array;
        for(var index = 1; index < children.length; index++)
        {
            var currentItem = children[index];
            var buf = new Object;

            buf["item"] = currentItem;
            buf["x"] = currentItem.x;
            buf["y"] = currentItem.y;
            buf["centerX"] = currentItem.x + (currentItem.width / 2);
            buf["centerY"] = currentItem.y + (currentItem.height / 2);
            buf["width"] = currentItem.width;
            buf["height"] = currentItem.height;

            data.push(buf);
        }

        childrenItemGeometry = data;
        isBegin = true;
    }

    function resize() {
        if(isBegin)
        {
            var horizontalRatio, verticalRatio;

            horizontalRatio = targetItem.width / targetItemGeometry["width"];
            verticalRatio = targetItem.height / targetItemGeometry["height"];

            for(var index = 0; index < childrenItemGeometry.length; index++)
            {
                if(fixedAspectRatio)
                {
                    if(horizontalRatio > verticalRatio)
                    {
                        childrenItemGeometry[index]["item"].width  = childrenItemGeometry[index]["width"] * verticalRatio;
                        childrenItemGeometry[index]["item"].height = childrenItemGeometry[index]["height"] * verticalRatio;
                    }
                    else
                    {
                        childrenItemGeometry[index]["item"].width  = childrenItemGeometry[index]["width"] * horizontalRatio;
                        childrenItemGeometry[index]["item"].height = childrenItemGeometry[index]["height"] * horizontalRatio;
                    }
                }
                else
                {
                    childrenItemGeometry[index]["item"].width  = childrenItemGeometry[index]["width"] * horizontalRatio;
                    childrenItemGeometry[index]["item"].height = childrenItemGeometry[index]["height"] * verticalRatio;
                }

                if(accordingToX)
                {
                    childrenItemGeometry[index]["item"].x = childrenItemGeometry[index]["x"] * horizontalRatio;
                    childrenItemGeometry[index]["item"].y = childrenItemGeometry[index]["y"] * verticalRatio;
                }
                else
                {
                    childrenItemGeometry[index]["item"].x = childrenItemGeometry[index]["centerX"] * horizontalRatio - (childrenItemGeometry[index]["item"].width / 2);
                    childrenItemGeometry[index]["item"].y = childrenItemGeometry[index]["centerY"] * verticalRatio - (childrenItemGeometry[index]["item"].height / 2);
                }
            }
        }
    }

    Component.onCompleted: {
        begin();
    }

    Component {
        id: connections

        Connections {
            target: targetItem

            onWidthChanged: {
                resize();
            }
            onHeightChanged:
            {
                resize();
            }
        }
    }

    Loader {
        Component.onCompleted: {
            sourceComponent = connections;
        }
    }
}
