local l_HttpService_0 = game:GetService("HttpService");
local v1 = nil;
pcall(function() --[[ Line: 58 ]]
    -- upvalues: v1 (ref)
    v1 = game:GetService("StudioWidgetsService");
end);
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v3 = require(l_Parent_0.Util.React);
local v4 = require(l_Parent_0.Util.ReactRoblox);
local v5 = require(l_Parent_0.UI.ContextServices.Design);
local v6 = require(l_Parent_0.UI.ContextServices.Focus);
local v7 = require(l_Parent_0.UI.ContextServices.Localization);
local v8 = require(l_Parent_0.UI.ContextServices.Mouse);
local v9 = require(l_Parent_0.UI.ContextServices.Plugin);
local v10 = require(l_Parent_0.UI.ContextServices.provide);
local v11 = require(l_Parent_0.Style.Themes.StudioTheme);
local v12 = require(l_Parent_0.TestHelpers.isTestEnvironment);
local v13 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkMouseContextForUseDialogWidget);
return function(v14) --[[ Line: 96 ]] --[[ Name: useDialogWidget ]]
    -- upvalues: v4 (copy), v5 (copy), v7 (copy), v8 (copy), v9 (copy), v3 (copy), l_HttpService_0 (copy), v1 (ref), v10 (copy), v13 (copy), v6 (copy), v12 (copy), v11 (copy)
    assert(v4, "useDialogWidget requires ReactRoblox");
    local v15 = v5.use();
    local v16 = v7.use();
    local v17 = v8.use();
    local v18 = v9.use();
    local v19 = v18:get();
    local v20, v21 = v3.useState({
        root = nil, 
        widget = nil
    });
    local v22, v23 = v3.useState(false);
    local v24 = v3.useCallback(function() --[[ Line: 112 ]]
        -- upvalues: v23 (copy)
        v23(true);
    end, {
        v23
    });
    local v25 = v3.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v23 (copy)
        v23(false);
    end, {
        v23
    });
    v3.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: l_HttpService_0 (ref), v19 (copy), v14 (copy), v4 (ref), v21 (copy)
        local v26 = "Dialog" .. l_HttpService_0:GenerateGUID();
        local l_v19_QWidgetPluginGui_0 = v19:CreateQWidgetPluginGui(v26, {
            Id = v26, 
            InitialEnabled = false, 
            Modal = v14.Modal, 
            Size = v14.Size, 
            DisableTitleBar = v14.DisableTitleBar
        });
        l_v19_QWidgetPluginGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        local v28 = v4.createRoot(l_v19_QWidgetPluginGui_0);
        v21({
            root = v28, 
            widget = l_v19_QWidgetPluginGui_0
        });
        return function() --[[ Line: 138 ]]
            -- upvalues: v21 (ref), v28 (copy), l_v19_QWidgetPluginGui_0 (copy)
            v21({
                root = nil, 
                widget = nil
            });
            v28:unmount();
            l_v19_QWidgetPluginGui_0:Destroy();
        end;
    end, {
        v14.Modal, 
        v14.DisableTitleBar
    });
    v3.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v14 (copy), v20 (copy)
        if v14.WidgetRef then
            v14.WidgetRef.current = v20.widget;
        end;
        return function() --[[ Line: 153 ]]
            -- upvalues: v14 (ref)
            if v14.WidgetRef then
                v14.WidgetRef.current = nil;
            end;
        end;
    end, {
        v14.WidgetRef, 
        v20.widget
    });
    v3.useEffect(function() --[[ Line: 161 ]]
        -- upvalues: v20 (copy), v1 (ref), v14 (copy)
        if v20.widget and v1 then
            v1:GetWidgetFromPluginGui(v20.widget):SetFixedSize(v14.Size.X, v14.Size.Y);
        end;
    end, {
        v20.widget, 
        v14.Size
    });
    local v29 = if v14.Title then v14.Title else "Roblox Studio";
    v3.useEffect(function() --[[ Line: 169 ]]
        -- upvalues: v20 (copy), v29 (copy)
        if v20.widget then
            v20.widget.Name = v29;
            if v20.widget:IsA("PluginGui") then
                v20.widget.Title = v29;
            end;
        end;
    end, {
        v20.widget, 
        v29
    });
    v3.useEffect(function() --[[ Line: 180 ]]
        -- upvalues: v20 (copy), v22 (copy)
        if v20.widget then
            v20.widget.Enabled = v22;
        end;
    end, {
        v20.widget, 
        v22
    });
    v3.useEffect(function() --[[ Line: 187 ]]
        -- upvalues: v20 (copy), v14 (copy), v25 (copy)
        if v20.widget and v20.widget:IsA("PluginGui") then
            v20.widget:BindToClose(function() --[[ Line: 190 ]]
                -- upvalues: v14 (ref), v25 (ref)
                if v14.OnClosed then
                    v14.OnClosed();
                end;
                v25();
            end);
        end;
        return function() --[[ Line: 197 ]]
            -- upvalues: v20 (ref)
            if v20.widget and v20.widget:IsA("PluginGui") then
                v20.widget:BindToClose();
            end;
        end;
    end, {
        v20.widget, 
        v25, 
        v14.OnClosed
    });
    if v20.widget and v20.root then
        if v22 then
            v20.root:render(v10(if v13() then {
                v15, 
                v6.new(v20.widget), 
                v16, 
                v17, 
                v18, 
                if v12() then v11.mock() else v11.new()
            } else {
                v15, 
                v6.new(v20.widget), 
                v16, 
                v18, 
                if v12() then v11.mock() else v11.new()
            }, v3.createElement(v3.Fragment, nil, {
                v3.createElement(v3.Fragment, nil, v14.Contents); 
                StyleLink = v3.createElement("StyleLink", {
                    StyleSheet = v15:get()
                })
            })));
        else
            v20.root:render(nil);
        end;
    end;
    return v24, v25, v22;
end;