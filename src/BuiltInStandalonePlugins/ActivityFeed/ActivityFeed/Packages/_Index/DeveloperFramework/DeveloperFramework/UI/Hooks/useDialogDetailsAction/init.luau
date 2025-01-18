local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local _ = require(l_Parent_0.Util.DialogAction);
return function(v4) --[[ Line: 56 ]] --[[ Name: useDialogDetailsAction ]]
    -- upvalues: v1 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    local v5, v6 = v1.useState(false);
    return v1.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: l_LOCALIZATION_PROJECT_NAME_0 (ref), v5 (copy), v6 (copy)
        return table.freeze({
            Label = {
                Project = l_LOCALIZATION_PROJECT_NAME_0, 
                Scope = "useDialogDetailsAction", 
                Key = v5 and "HideDetails" or "ShowDetails"
            }, 
            OnActivated = function() --[[ Line: 66 ]] --[[ Name: OnActivated ]]
                -- upvalues: v6 (ref)
                v6(function(v7) --[[ Line: 67 ]]
                    return not v7;
                end);
            end
        });
    end, {
        v5, 
        v6
    }), (v1.useCallback(function(v8) --[[ Line: 74 ]]
        -- upvalues: v5 (copy), v1 (ref), v4 (copy)
        if not v5 then
            return v8;
        else
            return v1.createElement(v1.Fragment, nil, {
                ContentsBeforeDetails = if v8 then v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    [v1.Tag] = "X-FitY"
                }, v8) else nil, 
                Details = if typeof(v4) == "string" then v1.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    Text = v4, 
                    [v1.Tag] = "X-FitY"
                }) else v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    [v1.Tag] = "X-FitY"
                }, v4)
            });
        end;
    end, {
        v5, 
        v4
    }));
end;