  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html lang="kr">
  <head>
  <meta charset="UTF-8">
  </head>
  <body>
  <script src="https://unpkg.com/gojs@2.2.13/release/go.js"></script>
  <div id="allSampleContent" class="p-4 w-full">
    <script id="code">
    // use a V figure instead of MinusLine in the TreeExpanderButton
    go.Shape.defineFigureGenerator("ExpandedLine", (shape, w, h) => {
      return new go.Geometry()
            .add(new go.PathFigure(0, 0.25*h, false)
                  .add(new go.PathSegment(go.PathSegment.Line, .5 * w, 0.75*h))
                  .add(new go.PathSegment(go.PathSegment.Line, w, 0.25*h)));
    });

    // use a sideways V figure instead of PlusLine in the TreeExpanderButton
    go.Shape.defineFigureGenerator("CollapsedLine", (shape, w, h) => {
      return new go.Geometry()
            .add(new go.PathFigure(0.25*w, 0, false)
                  .add(new go.PathSegment(go.PathSegment.Line, 0.75*w, .5 * h))
                  .add(new go.PathSegment(go.PathSegment.Line, 0.25*w, h)));
    });

    function init() {

      // Since 2.2 you can also author concise templates with method chaining instead of GraphObject.make
      // For details, see https://gojs.net/latest/intro/buildingObjects.html
      const $ = go.GraphObject.make;  // for conciseness in defining templates

      myDiagram =
        $(go.Diagram, "myDiagramDiv",
          {
            allowMove: false,
            allowCopy: false,
            allowDelete: false,
            allowHorizontalScroll: false,
            layout:
              $(go.TreeLayout,
                {
                  alignment: go.TreeLayout.AlignmentStart,
                  angle: 0,
                  compaction: go.TreeLayout.CompactionNone,
                  layerSpacing: 16,
                  layerSpacingParentOverlap: 1,
                  nodeIndentPastParent: 1.0,
                  nodeSpacing: 0,
                  setsPortSpot: false,
                  setsChildPortSpot: false
                })
          });

      myDiagram.nodeTemplate =
        $(go.Node,
          { // no Adornment: instead change panel background color by binding to Node.isSelected
            selectionAdorned: false,
            // a custom function to allow expanding/collapsing on double-click
            // this uses similar logic to a TreeExpanderButton
            doubleClick: (e, node) => {
              var cmd = myDiagram.commandHandler;
              if (node.isTreeExpanded) {
                if (!cmd.canCollapseTree(node)) return;
              } else {
                if (!cmd.canExpandTree(node)) return;
              }
              e.handled = true;
              if (node.isTreeExpanded) {
                cmd.collapseTree(node);
              } else {
                cmd.expandTree(node);
              }
            }
          },
          $("TreeExpanderButton",
            { // customize the button's appearance
              "_treeExpandedFigure": "ExpandedLine",
              "_treeCollapsedFigure": "CollapsedLine",
              "ButtonBorder.fill": "whitesmoke",
              "ButtonBorder.stroke": null,
              "_buttonFillOver": "rgba(0,128,255,0.25)",
              "_buttonStrokeOver": null
            }),
          $(go.Panel, "Horizontal",
            { position: new go.Point(18, 0) },
            new go.Binding("background", "isSelected", s => s ? "lightblue" : "white").ofObject(),
            $(go.Picture,
              {
                width: 25, height: 25,
                margin: new go.Margin(0, 4, 0, 0),
                imageStretch: go.GraphObject.Uniform
              },
              // bind the picture source on two properties of the Node
              // to display open folder, closed folder, or document
              new go.Binding("source", "isTreeExpanded", imageConverter).ofObject(),
              new go.Binding("source", "isTreeLeaf", imageConverter).ofObject()),
            $(go.TextBlock,
              { font: '9pt Verdana, sans-serif' },
              new go.Binding("text", "key", s => s))
          )  // end Horizontal Panel
        );  // end Node

      // without lines
      myDiagram.linkTemplate = $(go.Link);

      // // with lines
      myDiagram.linkTemplate =
        $(go.Link,
          { selectable: false,
            routing: go.Link.Orthogonal,
            fromEndSegmentLength: 4,
            toEndSegmentLength: 4,
            fromSpot: new go.Spot(0.001, 1, 7, 0),
            toSpot: go.Spot.Left },
          $(go.Shape,
            { stroke: 'gray', strokeDashArray: [1,2] }));

      // create a random tree
      var nodeDataArray = [{ key: 0 }];
      var max = 49;
      var count = 0;
      while (count < max) {
        count = makeTree(3, count, max, nodeDataArray, nodeDataArray[0]);
      }
      
      console.log(nodeDataArray);
      tmp = [];
//       tmp.push({"key" : 0, "__gohashid" : 0});
//       tmp.push({"key" : 1, "__gohashid" : 1});
//       tmp.push({"key" : 2, "__gohashid" : 2, "parent" : 0});
      
	  <c:forEach var="dept" items="${list}">
		tmp.push({"key" : '${dept.name}', "__gohashid" : ${dept.hashid}, "parent" : '${dept.parent}'});
	  </c:forEach>

      /*
      Array<DataVO> dataList = service.getDataList();
      D_ID : 1
      
      */
//       myDiagram.model = new go.TreeModel(nodeDataArray);
      myDiagram.model = new go.TreeModel(tmp);
    } // init() end

    function makeTree(level, count, max, nodeDataArray, parentdata) {
      var numchildren = Math.floor(Math.random() * 10);
      for (var i = 0; i < numchildren; i++) {
        if (count >= max) return count;
        count++;
        var childdata = { key: count, parent: parentdata.key };
        nodeDataArray.push(childdata);
        if (level > 0 && Math.random() > 0.5) {
          count = makeTree(level - 1, count, max, nodeDataArray, childdata);
        }
      }
      return count;
    }

    // takes a property change on either isTreeLeaf or isTreeExpanded and selects the correct image to use
    function imageConverter(prop, picture) {
      var node = picture.part;
      if (node.isTreeLeaf) {
        return "images/document.svg";
      } else {
        if (node.isTreeExpanded) {
          return "images/openFolder.svg";
        } else {
          return "images/closedFolder.svg";
        }
      }
    }
    window.addEventListener('DOMContentLoaded', init);
  </script>
</div>
<div id="sample">
  <div id="myDiagramDiv" style="border: 1px solid black; width: 300px; height: 500px; position: relative; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); cursor: auto;"><canvas tabindex="0" width="281" height="498" style="position: absolute; top: 0px; left: 0px; z-index: 2; user-select: none; touch-action: none; width: 281px; height: 498px; cursor: auto;">This text is displayed if your browser does not support the Canvas HTML element.</canvas><div style="position: absolute; overflow: auto; width: 298px; height: 498px; z-index: 1;"><div style="position: absolute; width: 1px; height: 9010px;"></div></div></div>
</div>
</body>
</html>