local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local l_Focus_0 = v1.ContextServices.Focus;
local l_UserInputService_0 = game:GetService("UserInputService");
local function _(v6, v7) --[[ Line: 13 ]] --[[ Name: withinBounds ]]
    local l_AbsolutePosition_0 = v7.AbsolutePosition;
    local v9 = l_AbsolutePosition_0 + v7.AbsoluteSize;
    local v10 = false;
    if v6.X >= l_AbsolutePosition_0.X then
        v10 = false;
        if v6.X <= v9.X then
            v10 = false;
            if v6.Y >= l_AbsolutePosition_0.Y then
                v10 = v6.Y <= v9.Y;
            end;
        end;
    end;
    return v10;
end;
return function(v12) --[[ Line: 26 ]] --[[ Name: useAggressiveHoverEndState ]]
    -- upvalues: l_Focus_0 (copy), v3 (copy), v2 (copy), l_UserInputService_0 (copy)
    local v13 = l_Focus_0:use():get();
    local v14 = v3(false);
    v2.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v14 (copy), v13 (copy), l_UserInputService_0 (ref), v12 (copy)
        if not v14.enabled then
            return nil;
        else
            local v20 = task.spawn(function() --[[ Line: 39 ]]
                -- upvalues: v13 (ref), l_UserInputService_0 (ref), v12 (ref), v14 (ref)
                while true do
                    local v15 = if v13:IsA("PluginGui") then v13:GetRelativeMousePosition() else l_UserInputService_0:GetMouseLocation();
                    if v12.current ~= nil then
                        local l_current_0 = v12.current;
                        local l_AbsolutePosition_1 = l_current_0.AbsolutePosition;
                        local v18 = l_AbsolutePosition_1 + l_current_0.AbsoluteSize;
                        local v19 = false;
                        if v15.X >= l_AbsolutePosition_1.X then
                            v19 = false;
                            if v15.X <= v18.X then
                                v19 = false;
                                if v15.Y >= l_AbsolutePosition_1.Y then
                                    v19 = v15.Y <= v18.Y;
                                end;
                            end;
                        end;
                        if v19 then
                            task.wait();
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                v14.disable();
            end);
            return function() --[[ Line: 54 ]]
                -- upvalues: v20 (copy)
                task.cancel(v20);
            end;
        end;
    end, {
        v14.enabled
    });
    return {
        hover = v14.enable, 
        isHovered = v14.enabled
    };
end;