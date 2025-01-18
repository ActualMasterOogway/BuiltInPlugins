local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = {
    editPlaceId = 0, 
    editDevProductId = nil
};
return v2.createReducer(v3, {
    ResetStore = function(_, _) --[[ Line: 15 ]] --[[ Name: ResetStore ]]
        -- upvalues: v3 (copy)
        return v3;
    end, 
    SetEditPlaceId = function(v6, v7) --[[ Line: 19 ]] --[[ Name: SetEditPlaceId ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v6, {
            editPlaceId = v7.editPlaceId
        });
    end, 
    SetEditDevProductId = function(v8, v9) --[[ Line: 25 ]] --[[ Name: SetEditDevProductId ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v8, {
            editDevProductId = v9.editDevProductId ~= nil and v9.editDevProductId or v1.None
        });
    end
});