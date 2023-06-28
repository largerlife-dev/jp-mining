# jp-mining
 
jp-mining is a mining script for RedM, made for RSG-Core and has more features and a little more advanced than the ordinary script.

**Features;**
- Multiple Mining Locations
- 3 Different reward categories
- Wash rocks at any river and water area, to get the rewards
- Easy config file for modification
- 25% chance pickaxe will break!

```
CONFIG = {}

CONFIG.RareAward = {
    'diamond',
    'ruby',
    'emerald',
    'mediumnugget',
    'smallnugget',
    'largenugget'
}

CONFIG.UncommonAward = {
    'silver',
    'nitrate'
}

CONFIG.Normal = {
    'rocksalt',
    'iron',
    'coal',
    'aluminum',
    'copper',
}

CONFIG.MiningLocations = {
    {
        name = 'Mining',
        location = 'mining-1',
        coords = vector3(-1424.091, 1176.6002, 226.3431),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-2',
        coords = vector3(-1417.508, 1171.145, 226.57142),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-3',
        coords = vector3(2763.174, 1406.2044,68.444854),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-4',
        coords = vector3(2726.7871, 1384.9691, 68.878173),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-5',
        coords = vector3(2717.3491, 1314.0633, 69.75164),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-6',
        coords = vector3(835.76275, 1931.185, 259.84646),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-7',
        coords = vector3(835.62109, 1925.5421, 259.289),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-8',
        coords = vector3(831.66693, 1920.0919, 259.37493),
        showblip = true
    },
    {
        name = 'Mining',
        location = 'mining-9',
        coords = vector3(825.7395, 1922.6685, 259.20452),
        showblip = true
    },
}
```

You need to add these items into the RSG Shared items.lua, but that's only if you want to use the ones I've already added or you can create your own!

```
['copper']   = {['name'] = 'copper',   ['label'] = 'Copper',   ['weight'] = 100, ['type'] = 'item', ['image'] = 'copper.png',   ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'crafting material'},
    ['aluminum'] = {['name'] = 'aluminum', ['label'] = 'Aluminum', ['weight'] = 100, ['type'] = 'item', ['image'] = 'aluminum.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'crafting material'},
    ['iron']     = {['name'] = 'iron',     ['label'] = 'Iron',     ['weight'] = 100, ['type'] = 'item', ['image'] = 'iron.png',     ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'crafting material'},
    ['steel']    = {['name'] = 'steel',    ['label'] = 'Steel',    ['weight'] = 100, ['type'] = 'item', ['image'] = 'steel.png',    ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'crafting material'},
    ['wood']     = {['name'] = 'wood',     ['label'] = 'Wood',     ['weight'] = 100, ['type'] = 'item', ['image'] = 'wood.png',     ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'crafting material'},
    ['stone'] = {['name'] = 'stone', ['label'] = 'Stone', ['weight'] = 1, ['type'] = 'item', ['image'] = 'stone.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A common rock.'},
    ['rock'] = {['name'] = 'rock', ['label'] = 'Rock', ['weight'] = 1, ['type'] = 'item', ['image'] = 'rock.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A common rock.'},
    ['rocksalt'] = {['name'] = 'rocksalt', ['label'] = 'Rock Salt', ['weight'] = 1, ['type'] = 'item', ['image'] = 'rocksalt.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A type of salt found in rocks.'},
    ['silver'] = {['name'] = 'silver', ['label'] = 'Silver', ['weight'] = 1, ['type'] = 'item', ['image'] = 'silver.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A precious metal known for its beauty and value.'},
    ['coal'] = {['name'] = 'coal', ['label'] = 'Coal', ['weight'] = 1, ['type'] = 'item', ['image'] = 'coal.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A combustible black or brownish-black sedimentary rock.'},
    ['diamond'] = {['name'] = 'diamond', ['label'] = 'Diamond', ['weight'] = 1, ['type'] = 'item', ['image'] = 'diamond.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A rare and valuable gemstone.'},
    ['ruby'] = {['name'] = 'ruby', ['label'] = 'Ruby', ['weight'] = 1, ['type'] = 'item', ['image'] = 'ruby.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A precious stone of transparent red corundum.'},
    ['emerald'] = {['name'] = 'emerald', ['label'] = 'Emerald', ['weight'] = 1, ['type'] = 'item', ['image'] = 'emerald.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A precious stone of transparent green beryl.'},
```
