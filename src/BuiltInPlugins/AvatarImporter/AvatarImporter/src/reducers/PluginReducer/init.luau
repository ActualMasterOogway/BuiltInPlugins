local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.src.Constants);
local l_actions_0 = l_Parent_0.src.actions;
local v5 = require(l_actions_0.ClosePlugin);
local v6 = require(l_actions_0.TogglePlugin);
local v7 = require(l_actions_0.SetScreen);
local v8 = require(l_actions_0.SetOriginalAvatarType);
return v1.createReducer({
    enabled = false, 
    screen = v3.SCREENS.AVATAR, 
    avatarType = nil
}, {
    [v5.name] = function(v9, v10) --[[ Line: 21 ]]
        -- upvalues: v3 (copy), v2 (copy)
        if v9.screen ~= v3.SCREENS.LOADING or v10.force then
            return v2.Dictionary.join(v9, {
                enabled = false
            });
        else
            return v9;
        end;
    end, 
    [v6.name] = function(v11) --[[ Line: 31 ]]
        -- upvalues: v2 (copy), v3 (copy)
        return v2.Dictionary.join(v11, {
            enabled = not v11.enabled, 
            screen = v3.SCREENS.AVATAR
        });
    end, 
    [v7.name] = function(v12, v13) --[[ Line: 38 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            screen = v13.screen
        });
    end, 
    [v8.name] = function(v14, v15) --[[ Line: 44 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            avatarType = v15.avatarType
        });
    end
});