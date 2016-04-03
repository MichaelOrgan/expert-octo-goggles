import QtQuick 2.0
import VPlay 2.0
import "../editorElements"

PlatformerEntityBaseDraggable {
  id: spikeball
  entityType: "spikes"
  variationType: "ball"

  // set the size to the sprite's size
  width: image.width
  height: image.height

  // define colliderComponent for collision detection while dragging
  colliderComponent: collider

  SpriteSequenceVPlay {

     SpriteVPlay {
       frameCount:2
       frameRate: 1
       frameWidth: 32
       frameHeight: 40
       source: "../../assets/spikeball/spikeball.png"
     }
   }

  CircleCollider {
    id: collider

    // make the collider a little smaller than the sprite
    radius: parent.width
    x: 2
    y: 2

    // the bodyType is static
    bodyType: Body.Static

    // the collider should not be active in edit mode
    active: !inLevelEditingMode

    // Category5: solids
    categories: Box.Category5
    // Category1: player body, Category2: player feet sensor,
    // Category3: opponent body, Category4: opponent sensor
    collidesWith: Box.Category1 | Box.Category2 | Box.Category3 | Box.Category4
  }
}

