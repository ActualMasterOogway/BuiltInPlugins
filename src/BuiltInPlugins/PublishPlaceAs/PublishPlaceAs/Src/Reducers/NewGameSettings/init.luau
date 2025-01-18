local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Constants);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local v5 = nil;
if l_shouldShowDevPublishLocations_0() then
    v5 = {};
end;
local function v12(v6, v7) --[[ Line: 28 ]] --[[ Name: isEqualCheck ]]
    -- upvalues: v3 (copy)
    v6 = v6 or {};
    v7 = v7 or {};
    if v3.isEmpty(v6) ~= v3.isEmpty(v7) then
        return false;
    else
        for v8, v9 in pairs(v6) do
            if v7[v8] ~= v9 then
                return false;
            end;
        end;
        for v10, v11 in pairs(v7) do
            if v6[v10] ~= v11 then
                return false;
            end;
        end;
        return true;
    end;
end;
local v13 = {
    current = {}, 
    changed = {
        name = "Untitled Game", 
        creatorId = 0, 
        description = "", 
        genre = v1.GENRE_IDS[1], 
        playableDevices = {
            Computer = true, 
            Phone = true, 
            Tablet = true, 
            VR = true
        }, 
        teamCreateEnabled = true, 
        OptInLocations = v5, 
        isActive = false, 
        isFriendsOnly = false
    }, 
    errors = {}
};
return v2.createReducer(v13, {
    AddChange = function(v14, v15) --[[ Line: 64 ]] --[[ Name: AddChange ]]
        -- upvalues: v3 (copy), v12 (copy)
        local l_value_0 = v15.value;
        if l_value_0 == v14.current[v15.setting] then
            l_value_0 = v3.None;
        end;
        if type(l_value_0) == "table" and v12(l_value_0, v14.current[v15.setting]) then
            l_value_0 = v3.None;
        end;
        return v3.Dictionary.join(v14, {
            changed = v3.Dictionary.join(v14.changed, {
                [v15.setting] = l_value_0
            }), 
            errors = v3.Dictionary.join(v14.errors, {
                [v15.setting] = v3.None
            })
        });
    end, 
    AddErrors = function(v17, v18) --[[ Line: 83 ]] --[[ Name: AddErrors ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v17, {
            errors = v3.Dictionary.join(v17.errors, v18.errors)
        });
    end, 
    ResetInfo = function(v19, v20) --[[ Line: 89 ]] --[[ Name: ResetInfo ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v19, {
            current = v3.Dictionary.join(v19.current, v20.current), 
            changed = v3.Dictionary.join(v19.changed, v20.changed), 
            errors = v3.Dictionary.join(v19.errors, v20.errors)
        });
    end
});