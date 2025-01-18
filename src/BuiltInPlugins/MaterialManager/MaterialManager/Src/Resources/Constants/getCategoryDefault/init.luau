local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Flags);
local v3 = {
    Materials = {
        Ceramic = Enum.Material.CeramicTiles, 
        Concrete = Enum.Material.Concrete, 
        Fabric = Enum.Material.Fabric, 
        Ground = Enum.Material.Ground, 
        Metal = Enum.Material.Metal, 
        Organic = Enum.Material.Ice, 
        Paper = Enum.Material.Cardboard, 
        Plastic = Enum.Material.Plastic, 
        Rock = Enum.Material.Rock, 
        Stone = Enum.Material.Slate, 
        Synthetic = Enum.Material.Rubber, 
        Wood = Enum.Material.Wood
    }
};
return function(v4) --[[ Line: 22 ]]
    -- upvalues: v3 (copy)
    local v5 = nil;
    v5 = v3;
    for _, v7 in v4 do
        v5 = v5[v7];
        if not v5 then
            return v5;
        end;
    end;
    if type(v5) == "table" then
        return nil;
    else
        return v5;
    end;
end;