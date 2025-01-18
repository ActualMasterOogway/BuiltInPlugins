local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.ReactRoblox);
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_0.Util.StudioUri);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v6 = require(l_Parent_0.ContextServices);
local l_Design_0 = v6.Design;
local l_Localization_0 = v6.Localization;
local l_Plugin_0 = v6.Plugin;
local v10 = v6.ContextItem:createSimple("Menu");
local v11 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkMaterialPickerRenameGrabsMouseProp);
local v12 = require(l_Parent_0.SharedFlags.getFFlagStudioEnableInteractionTelemetry);
local v13 = require(l_Parent_0.SharedFlags.getFFlagStudioRibbonDeferInteractionTelemetry);
local v14 = {};
local v15 = 0;
local function v19(v16) --[[ Line: 48 ]] --[[ Name: closeMenus ]]
    -- upvalues: v14 (copy)
    for v17, v18 in v14 do
        if v16 == nil or v17 > v16 then
            v18.open = false;
            v18.panel.Enabled = false;
            v18.root:render(nil);
            task.spawn(function() --[[ Line: 56 ]]
                -- upvalues: v18 (copy)
                v18.Panels:SetSizeAsync(v18.uri, Vector2.new(0, 0));
            end);
        end;
    end;
end;
local function v28(v20, v21) --[[ Line: 63 ]] --[[ Name: getMenu ]]
    -- upvalues: v14 (copy), v11 (copy), v2 (copy), l_join_0 (copy), v19 (copy)
    if v14[v21] then
        return v14[v21];
    else
        local v22 = ("Menus/%*"):format(v21);
        local l_v20_QWidgetPluginGui_0 = v20:CreateQWidgetPluginGui(v22, {
            Id = v22, 
            InitialEnabled = false, 
            MinSize = Vector2.new(100, 100), 
            Modal = false, 
            Popup = if v11() then {
                PassesThroughMouseEvents = true
            } else {
                GrabsMouse = false
            }, 
            Resizable = true, 
            Size = Vector2.new(100, 100), 
            Title = v22
        });
        l_v20_QWidgetPluginGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        local v24 = v2.createRoot(l_v20_QWidgetPluginGui_0);
        local v25 = {
            depth = #v14 + 1, 
            uri = l_join_0(v20:GetUri(), {
                Category = "Panels", 
                ItemId = v22
            }), 
            panel = l_v20_QWidgetPluginGui_0, 
            root = v24, 
            open = false, 
            Panels = v20:GetPluginComponent("Panels")
        };
        v14[v21] = v25;
        if l_v20_QWidgetPluginGui_0:IsA("PluginGui") then
            l_v20_QWidgetPluginGui_0:BindToClose(function() --[[ Line: 100 ]]
                -- upvalues: v14 (ref), v25 (copy), v19 (ref)
                local v26 = nil;
                for v27 = #v14, 1, -1 do
                    if v14[v27].open then
                        v26 = v14[v27];
                        break;
                    end;
                end;
                if v25 == v26 then
                    v19();
                end;
            end);
        end;
        return v25;
    end;
end;
return function(v29) --[[ Line: 127 ]] --[[ Name: useMenu ]]
    -- upvalues: l_Plugin_0 (copy), l_Design_0 (copy), v10 (copy), l_Localization_0 (copy), v15 (ref), l_join_0 (copy), v28 (copy), v6 (copy), v1 (copy), v12 (copy), v13 (copy), v4 (copy), v19 (copy)
    local v30 = l_Plugin_0.use();
    local v31 = l_Design_0.use();
    local v32 = v10.use();
    local v33 = l_Localization_0.use();
    local v34 = if v32.get then v32:get() else {
        depth = 0, 
        menuOnLeft = false
    };
    return function(v35, v36, v37, v38) --[[ Line: 138 ]] --[[ Name: openMenu ]]
        -- upvalues: v15 (ref), v34 (copy), v30 (copy), l_join_0 (ref), v28 (ref), v6 (ref), v31 (copy), v33 (copy), v10 (ref), v1 (ref), v29 (copy), v12 (ref), v13 (ref), v4 (ref)
        v15 = v15 + 1;
        local v39 = v34.depth + 1;
        local v40 = v30:get();
        local l_v40_Uri_0 = v40:GetUri();
        local v42 = ("Menus/%*"):format(v39);
        local v43 = l_join_0(l_v40_Uri_0, {
            Category = "Panels", 
            ItemId = v42
        });
        local v44 = v28(v40, v39);
        local l_v40_PluginComponent_0 = v40:GetPluginComponent("Panels");
        v44.root:render(v6.provide({
            v31, 
            v33, 
            v30, 
            v10.new({
                depth = v39, 
                menuOnLeft = v38 or v34.menuOnLeft
            })
        }, {
            Main = v1.createElement("Frame", {
                [v1.Tag] = "Role-Surface100 X-Fill X-PadTabMenu"
            }, {
                Menu = v1.createElement(v29, {
                    WidgetUri = v36, 
                    Plugin = v40, 
                    Controls = v35, 
                    OnResize = function(v46) --[[ Line: 166 ]] --[[ Name: OnResize ]]
                        -- upvalues: l_v40_PluginComponent_0 (copy), v43 (copy)
                        local v47 = math.ceil((math.min(3000, v46.AbsoluteSize.X + 16)));
                        local v48 = math.ceil((math.min(3000, v46.AbsoluteSize.Y + 16)));
                        l_v40_PluginComponent_0:SetSizeAsync(v43, Vector2.new(v47, v48));
                    end, 
                    [v1.Tag] = "X-RowSpace150 X-Top X-Fit"
                }), 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v31:get()
                })
            })
        }));
        l_v40_PluginComponent_0:SetAttachmentAsync(v43, (l_join_0({
            TargetWidgetUri = v36, 
            TargetAnchorPoint = Vector2.new(0, 1), 
            SubjectAnchorPoint = Vector2.new(0, 0), 
            Offset = Vector2.new(0, 0)
        }, v37)));
        v44.panel.Enabled = true;
        v44.open = true;
        if v12() then
            if v13() then
                task.defer(function() --[[ Line: 192 ]]
                    -- upvalues: v40 (copy), v4 (ref), v36 (copy)
                    pcall(function() --[[ Line: 193 ]]
                        -- upvalues: v40 (ref), v4 (ref), v36 (ref)
                        v40:GetPluginComponent("InteractionTelemetry"):ReportInteractionAsync({
                            functionType = "Navigation", 
                            sourceType = "Widget", 
                            sourceData = v4.toString(v36)
                        });
                    end);
                end);
                return;
            else
                pcall(function() --[[ Line: 203 ]]
                    -- upvalues: v40 (copy), v4 (ref), v36 (copy)
                    v40:GetPluginComponent("InteractionTelemetry"):ReportInteractionAsync({
                        functionType = "Navigation", 
                        sourceType = "Widget", 
                        sourceData = v4.toString(v36)
                    });
                end);
            end;
        end;
    end, v19, v34;
end;