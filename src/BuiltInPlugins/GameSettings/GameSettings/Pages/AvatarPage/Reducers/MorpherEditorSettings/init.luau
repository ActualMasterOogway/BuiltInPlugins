local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local function v3() --[[ Line: 7 ]] --[[ Name: getDefaultState ]]
    return {
        scaleBoundaries = {
            boundaries = {}
        }
    };
end;
return v2.createReducer(v3(), {
    ResetStore = function(_, _) --[[ Line: 16 ]] --[[ Name: ResetStore ]]
        -- upvalues: v3 (copy)
        return (v3());
    end, 
    SettingsSaveScaleBoundaries = function(v6, v7) --[[ Line: 20 ]] --[[ Name: SettingsSaveScaleBoundaries ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v6, {
            scaleBoundaries = v1.Dictionary.join(v6.scaleBoundaries, {
                boundaries = v7.rulesData.scales
            })
        });
    end
});