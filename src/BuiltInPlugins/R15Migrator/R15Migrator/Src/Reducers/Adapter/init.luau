local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetAdapted);
local v5 = require(l_Actions_0.ResetAllAdapter);
local v6 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local function _() --[[ Line: 11 ]] --[[ Name: getInitialState ]]
    -- upvalues: v6 (copy)
    return {
        adapted = v6.GetAdapted()
    };
end;
return (v1.createReducer({
    adapted = v6.GetAdapted()
}, {
    [v4.name] = function(v8, v9) --[[ Line: 20 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            adapted = v9.adapted
        });
    end, 
    [v5.name] = function(v10) --[[ Line: 25 ]]
        -- upvalues: v2 (copy), v6 (copy)
        return v2.Dictionary.join(v10, {
            adapted = v6.GetAdapted()
        });
    end
}));