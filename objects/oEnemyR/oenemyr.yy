{
  "spriteId": {
    "name": "sEnemyR",
    "path": "sprites/sEnemyR/sEnemyR.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": {
    "name": "sEnemyR",
    "path": "sprites/sEnemyR/sEnemyR.yy",
  },
  "persistent": false,
  "parentObjectId": {
    "name": "oEnemy",
    "path": "objects/oEnemy/oEnemy.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [
    {"x":0.0,"y":0.0,},
    {"x":32.0,"y":0.0,},
    {"x":32.0,"y":32.0,},
    {"x":0.0,"y":32.0,},
  ],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":7,"eventType":7,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":1,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"oEnemy","path":"objects/oEnemy/oEnemy.yy",},"objectId":{"name":"oEnemy","path":"objects/oEnemy/oEnemy.yy",},"value":"irandom_range(6,10)","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"hp_max","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"irandom_range((6*size),(10*size))","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"size","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"2","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"hitcount","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"0","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"hp_cur","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"hp_max-hitcount","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"flash","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"0","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"hitFrom","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"0","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"deal_dmg","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"1","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"knockback","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"3","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy",
  },
  "resourceVersion": "1.0",
  "name": "oEnemyR",
  "tags": [],
  "resourceType": "GMObject",
}