local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_deepEqual_0 = require(l_Parent_0.Packages.Framework).Util.deepEqual;
local v4 = require(l_Parent_0.Src.Util.isEmpty);
local v5 = require(l_Parent_0.Src.Util.AssetOverrides);
local v6 = require(l_Parent_0.Src.Util.Float);
local v7 = require(l_Parent_0.Src.Util.Scales);
local v8 = {
    universeAvatarAssetOverrides = v5.isEqual, 
    universeAvatarMinScales = v7.isEqual, 
    universeAvatarMaxScales = v7.isEqual, 
    OptInLocations = l_deepEqual_0, 
    thumbnails = l_deepEqual_0, 
    workspaceGravity = v6.createIsEqualWithTolerance(0.001), 
    workspaceJumpHeight = v6.createIsEqualWithTolerance(0.001), 
    workspaceJumpPower = v6.createIsEqualWithTolerance(0.001)
};
local function v16(v9, v10) --[[ Line: 37 ]] --[[ Name: isEqualCheck ]]
    -- upvalues: v4 (copy)
    if v9 == nil or v10 == nil then
        return v9 == v10;
    elseif v4(v9) ~= v4(v10) then
        return false;
    else
        local v11 = true;
        for v12, v13 in pairs(v9) do
            if v10[v12] ~= v13 then
                v11 = false;
                break;
            end;
        end;
        for v14, v15 in pairs(v10) do
            if v9[v14] ~= v15 then
                return false;
            end;
        end;
        return v11;
    end;
end;
local function v17() --[[ Line: 63 ]] --[[ Name: getDefaultState ]]
    return {
        Current = {}, 
        Changed = {}, 
        Errors = {}, 
        Warnings = {}
    };
end;
return v2.createReducer(v17(), {
    ResetStore = function(_, _) --[[ Line: 73 ]] --[[ Name: ResetStore ]]
        -- upvalues: v17 (copy)
        return (v17());
    end, 
    AddChange = function(v20, v21) --[[ Line: 77 ]] --[[ Name: AddChange ]]
        -- upvalues: v16 (copy), v8 (copy), v1 (copy)
        local l_value_0 = v21.value;
        local v25 = if type(l_value_0) == "table" then v16 else function(v23, v24) --[[ Line: 82 ]]
            return v23 == v24;
        end;
        if (if v8[v21.setting] then v8[v21.setting] else v25)(v20.Current[v21.setting], l_value_0) then
            l_value_0 = v1.None;
        end;
        return v1.Dictionary.join(v20, {
            Changed = v1.Dictionary.join(v20.Changed, {
                [v21.setting] = l_value_0
            }), 
            Errors = v1.Dictionary.join(v20.Errors, {
                [v21.setting] = v1.None
            })
        });
    end, 
    AddErrors = function(v26, v27) --[[ Line: 103 ]] --[[ Name: AddErrors ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v26, {
            Errors = v1.Dictionary.join(v26.Errors, v27.errors)
        });
    end, 
    DiscardError = function(v28, v29) --[[ Line: 109 ]] --[[ Name: DiscardError ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v28, {
            Errors = v1.Dictionary.join(v28.Errors, {
                [v29.error] = v1.None
            })
        });
    end, 
    DiscardChanges = function(v30, _) --[[ Line: 117 ]] --[[ Name: DiscardChanges ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v30, {
            Changed = {}
        });
    end, 
    DiscardErrors = function(v32, _) --[[ Line: 123 ]] --[[ Name: DiscardErrors ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v32, {
            Errors = {}, 
            Warnings = {}
        });
    end, 
    SetCurrentSettings = function(v34, v35) --[[ Line: 130 ]] --[[ Name: SetCurrentSettings ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v34, {
            Current = v35.settings
        });
    end, 
    AppendSettings = function(v36, v37) --[[ Line: 136 ]] --[[ Name: AppendSettings ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v36, {
            Current = v1.Dictionary.join(v36.Current, v37.settings)
        });
    end, 
    AddWarning = function(v38, v39) --[[ Line: 142 ]] --[[ Name: AddWarning ]]
        -- upvalues: v1 (copy)
        if not v1.List.find(v38.Warnings, v39.key) then
            return v1.Dictionary.join(v38, {
                Warnings = v1.List.join(v38.Warnings, {
                    v39.key
                })
            });
        else
            return v38;
        end;
    end, 
    DiscardWarning = function(v40, v41) --[[ Line: 152 ]] --[[ Name: DiscardWarning ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v40, {
            Warnings = v1.List.removeValue(v40.Warnings, v41.key)
        });
    end
});