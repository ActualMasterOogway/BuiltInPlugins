local l_Parent_0 = script.Parent.Parent.Parent;
local l_map_0 = require(l_Parent_0.Packages.Dash).map;
local v2 = {
    Enum.Material.Asphalt, 
    Enum.Material.Basalt, 
    Enum.Material.Brick, 
    Enum.Material.Cobblestone, 
    Enum.Material.Concrete, 
    Enum.Material.CorrodedMetal, 
    Enum.Material.CrackedLava, 
    Enum.Material.DiamondPlate, 
    Enum.Material.Fabric, 
    Enum.Material.Foil, 
    Enum.Material.Glacier, 
    Enum.Material.Granite, 
    Enum.Material.Grass, 
    Enum.Material.Ground, 
    Enum.Material.Ice, 
    Enum.Material.LeafyGrass, 
    Enum.Material.Limestone, 
    Enum.Material.Marble, 
    Enum.Material.Metal, 
    Enum.Material.Mud, 
    Enum.Material.Pavement, 
    Enum.Material.Pebble, 
    Enum.Material.Plastic, 
    Enum.Material.Rock, 
    Enum.Material.Salt, 
    Enum.Material.Sand, 
    Enum.Material.Sandstone, 
    Enum.Material.Slate, 
    Enum.Material.SmoothPlastic, 
    Enum.Material.Snow, 
    Enum.Material.Wood, 
    Enum.Material.WoodPlanks
};
return {
    getIcons = function() --[[ Line: 43 ]] --[[ Name: getIcons ]]
        -- upvalues: l_map_0 (copy), v2 (copy)
        return l_map_0(v2, function(v3) --[[ Line: 44 ]]
            return (("rbxasset://textures/MaterialGenerator/Materials/%*.png"):format(v3.Name));
        end);
    end, 
    getNames = function() --[[ Line: 50 ]] --[[ Name: getNames ]]
        -- upvalues: l_map_0 (copy), v2 (copy)
        return l_map_0(v2, function(v4) --[[ Line: 51 ]]
            return v4.Name;
        end);
    end
};