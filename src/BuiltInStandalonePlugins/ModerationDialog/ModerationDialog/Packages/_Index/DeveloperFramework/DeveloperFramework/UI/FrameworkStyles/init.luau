local l_Parent_0 = script.Parent.Parent;
local l_SharedFlags_0 = l_Parent_0.SharedFlags;
local v2 = require(l_SharedFlags_0.getFFlagDevFrameworkColorPicker);
local function _() --[[ Line: 12 ]] --[[ Name: newDefaults ]]
    return {
        Default = {}
    };
end;
local v4 = {};
local v5 = require(l_Parent_0.Parent.Dash);
local l_assign_0 = v5.assign;
local l_collect_0 = v5.collect;
local v8 = {
    ColorPicker = if v2() then {
        Default = {}
    } else v5.None
};
v4.new = function() --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: l_collect_0 (copy), l_Parent_0 (copy), v8 (copy), l_assign_0 (copy)
    local v11 = l_collect_0(l_Parent_0.UI.Components:GetChildren(), function(_, v10) --[[ Line: 45 ]]
        -- upvalues: v8 (ref)
        if v10:IsA("ModuleScript") and v8[v10.Name] == nil then
            return v10.Name, {
                Default = {}
            };
        else
            return nil;
        end;
    end);
    l_assign_0(v11, v8);
    return v11;
end;
return v4;