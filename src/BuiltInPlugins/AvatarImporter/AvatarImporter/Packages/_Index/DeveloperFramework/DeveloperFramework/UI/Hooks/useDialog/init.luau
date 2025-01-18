local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.ReactRoblox);
local _ = require(l_Parent_0.Util.DialogAction);
local v4 = require(l_Parent_0.UI.Components.UseDialogLayout);
local v5 = require(l_Parent_0.UI.Components.UseDialogLayout.styles);
local v6 = require(l_Parent_0.UI.ContextServices.Localization);
local v7 = require(l_Parent_0.UI.Hooks.useDialogWidget);
local l_v5_Attribute_0 = v5:GetAttribute("MinimumDialogSize");
local v9 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkUseDialogDisableTitleBar);
local function v14(v10, v11) --[[ Line: 123 ]] --[[ Name: useDialogAction ]]
    -- upvalues: v6 (copy), v1 (copy)
    local v12 = v6.use();
    return (v1.useMemo(function() --[[ Line: 126 ]]
        -- upvalues: v10 (copy), v12 (copy), v11 (copy)
        if not v10 then
            return nil;
        else
            assert(v10, "Luau doesn't refine the type of `action` here");
            local l_Label_0 = v10.Label;
            return {
                Label = if typeof(l_Label_0) == "string" then l_Label_0 else if l_Label_0.Project then v12:getProjectText(l_Label_0.Project, l_Label_0.Scope, l_Label_0.Key) else v12:getText(l_Label_0.Scope, l_Label_0.Key), 
                Enabled = v10.Enabled == nil or v10.Enabled, 
                OnActivated = function() --[[ Line: 141 ]] --[[ Name: OnActivated ]]
                    -- upvalues: v10 (ref), v11 (ref)
                    if v10.HidesDialog and v11.current then
                        v11.current();
                    end;
                    if v10.OnActivated then
                        v10.OnActivated();
                    end;
                end
            };
        end;
    end, {
        v10, 
        v11
    }));
end;
return function(v15) --[[ Line: 155 ]] --[[ Name: useDialog ]]
    -- upvalues: v2 (copy), l_v5_Attribute_0 (copy), v1 (copy), v14 (copy), v7 (copy), v4 (copy), v9 (copy)
    assert(v2, "ReactRoblox is required for useDialog.");
    local v16 = if v15.Width then math.max(l_v5_Attribute_0.X, v15.Width) else l_v5_Attribute_0.X;
    local v17, v18 = v1.useState(Vector2.new(v16, l_v5_Attribute_0.Y));
    local v19 = v1.useRef(nil);
    local v20 = v14(v15.ActionPrimary, v19);
    local v21 = v14(v15.ActionSecondary, v19);
    local v22 = v14(v15.ActionTertiary, v19);
    local v23 = if v15.Contents then v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        [v1.Tag] = "X-FitY"
    }, v15.Contents) else nil;
    local v24, v25, v26 = v7({
        Contents = v1.createElement(v4, {
            Body = v15.Body, 
            Heading = v15.Heading, 
            Width = v16, 
            ActionPrimary = v20, 
            ActionSecondary = v21, 
            ActionTertiary = v22, 
            OnSizeChanged = v18, 
            [v1.Tag] = v15.Intent
        }, {
            Contents = v23
        }), 
        Size = v17, 
        DisableTitleBar = if v9() then v15.DisableTitleBar else nil, 
        Modal = v15.Modal, 
        OnClosed = v15.OnClosed, 
        Title = v15.Title, 
        WidgetRef = v15.WidgetRef
    });
    v19.current = v25;
    return v24, v25, v26;
end;