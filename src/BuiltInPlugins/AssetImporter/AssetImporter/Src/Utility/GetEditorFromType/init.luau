local l_Types_0 = script:FindFirstAncestor("AssetImporter").Src.Components.Properties.Types;
local v1 = require(l_Types_0.BooleanProperty);
local v2 = require(l_Types_0.EnumProperty);
local v3 = require(l_Types_0.NumberProperty);
local v4 = require(l_Types_0.StringProperty);
local v5 = require(l_Types_0.VectorProperty);
local v6 = {
    boolean = v1, 
    userdata = v2, 
    number = v3, 
    string = v4, 
    vector = v5
};
return function(v7) --[[ Line: 23 ]]
    -- upvalues: v6 (copy)
    local v8 = v6[type(v7)];
    assert(v8, table.concat({
        "Unsupported property type", 
        (type(v7))
    }));
    return v8;
end;