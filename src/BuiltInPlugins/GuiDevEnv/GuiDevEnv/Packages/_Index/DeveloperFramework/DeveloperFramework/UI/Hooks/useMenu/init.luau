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
local v12 = {};
local v13 = 0;
local function v17(v14) --[[ Line: 45 ]] --[[ Name: closeMenus ]]
    -- upvalues: v12 (copy)
    for v15, v16 in v12 do
        if v14 == nil or v15 > v14 then
            v16.open = false;
            v16.panel.Enabled = false;
            v16.root:render(nil);
            task.spawn(function() --[[ Line: 53 ]]
                -- upvalues: v16 (copy)
                v16.Panels:SetSizeAsync(v16.uri, Vector2.new(0, 0));
            end);
        end;
    end;
end;
local function v26(v18, v19) --[[ Line: 60 ]] --[[ Name: getMenu ]]
    -- upvalues: v12 (copy), v11 (copy), v2 (copy), l_join_0 (copy), v17 (copy)
    if v12[v19] then
        return v12[v19];
    else
        local v20 = ("Menus/%*"):format(v19);
        local l_v18_QWidgetPluginGui_0 = v18:CreateQWidgetPluginGui(v20, {
            Id = v20, 
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
            Title = v20
        });
        l_v18_QWidgetPluginGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        local v22 = v2.createRoot(l_v18_QWidgetPluginGui_0);
        local v23 = {
            depth = #v12 + 1, 
            uri = l_join_0(v18:GetUri(), {
                Category = "Panels", 
                ItemId = v20
            }), 
            panel = l_v18_QWidgetPluginGui_0, 
            root = v22, 
            open = false, 
            Panels = v18:GetPluginComponent("Panels")
        };
        v12[v19] = v23;
        if l_v18_QWidgetPluginGui_0:IsA("PluginGui") then
            l_v18_QWidgetPluginGui_0:BindToClose(function() --[[ Line: 97 ]]
                -- upvalues: v12 (ref), v23 (copy), v17 (ref)
                local v24 = nil;
                for v25 = #v12, 1, -1 do
                    if v12[v25].open then
                        v24 = v12[v25];
                        break;
                    end;
                end;
                if v23 == v24 then
                    v17();
                end;
            end);
        end;
        return v23;
    end;
end;
return function(v27) --[[ Line: 124 ]] --[[ Name: useMenu ]]
    -- upvalues: l_Plugin_0 (copy), l_Design_0 (copy), v10 (copy), l_Localization_0 (copy), v13 (ref), l_join_0 (copy), v26 (copy), v6 (copy), v1 (copy), v4 (copy), v17 (copy)
    local v28 = l_Plugin_0.use();
    local v29 = l_Design_0.use();
    local v30 = v10.use();
    local v31 = l_Localization_0.use();
    local v32 = if v30.get then v30:get() else {
        depth = 0, 
        menuOnLeft = false
    };
    return function(v33, v34, v35, v36) --[[ Line: 135 ]] --[[ Name: openMenu ]]
        -- upvalues: v13 (ref), v32 (copy), v28 (copy), l_join_0 (ref), v26 (ref), v6 (ref), v29 (copy), v31 (copy), v10 (ref), v1 (ref), v27 (copy), v4 (ref)
        v13 = v13 + 1;
        local v37 = v32.depth + 1;
        local v38 = v28:get();
        local l_v38_Uri_0 = v38:GetUri();
        local v40 = ("Menus/%*"):format(v37);
        local v41 = l_join_0(l_v38_Uri_0, {
            Category = "Panels", 
            ItemId = v40
        });
        local v42 = v26(v38, v37);
        local l_v38_PluginComponent_0 = v38:GetPluginComponent("Panels");
        v42.root:render(v6.provide({
            v29, 
            v31, 
            v28, 
            v10.new({
                depth = v37, 
                menuOnLeft = v36 or v32.menuOnLeft
            })
        }, {
            Main = v1.createElement("Frame", {
                [v1.Tag] = "Role-Surface100 X-Fill X-PadTabMenu"
            }, {
                Menu = v1.createElement(v27, {
                    WidgetUri = v34, 
                    Plugin = v38, 
                    Controls = v33, 
                    OnResize = function(v44) --[[ Line: 163 ]] --[[ Name: OnResize ]]
                        -- upvalues: l_v38_PluginComponent_0 (copy), v41 (copy)
                        local v45 = math.ceil((math.min(3000, v44.AbsoluteSize.X + 16)));
                        local v46 = math.ceil((math.min(3000, v44.AbsoluteSize.Y + 16)));
                        l_v38_PluginComponent_0:SetSizeAsync(v41, Vector2.new(v45, v46));
                    end, 
                    [v1.Tag] = "X-RowSpace150 X-Top X-Fit"
                }), 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v29:get()
                })
            })
        }));
        l_v38_PluginComponent_0:SetAttachmentAsync(v41, (l_join_0({
            TargetWidgetUri = v34, 
            TargetAnchorPoint = Vector2.new(0, 1), 
            SubjectAnchorPoint = Vector2.new(0, 0), 
            Offset = Vector2.new(0, 0)
        }, v35)));
        v42.panel.Enabled = true;
        v42.open = true;
        task.defer(function() --[[ Line: 187 ]]
            -- upvalues: v38 (copy), v4 (ref), v34 (copy)
            pcall(function() --[[ Line: 188 ]]
                -- upvalues: v38 (ref), v4 (ref), v34 (ref)
                v38:GetPluginComponent("InteractionTelemetry"):ReportInteractionAsync({
                    functionType = "Navigation", 
                    sourceType = "Widget", 
                    sourceData = v4.toString(v34)
                });
            end);
        end);
    end, v17, v32;
end;