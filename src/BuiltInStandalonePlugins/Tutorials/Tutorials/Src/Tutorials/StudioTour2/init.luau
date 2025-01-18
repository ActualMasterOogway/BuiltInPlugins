local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseLuaRibbon)();
local v2 = require(l_Parent_0.Src.Flags.getFFlagSpotlightManager)();
local v3 = game:DefineFastFlag("StudioTour2FixInsertCar", false);
local v4 = game:DefineFastFlag("FixStudioTour2ToolboxSpotlight", false);
local l_Workspace_0 = game:GetService("Workspace");
local v6 = {
    assetIds = {
        14215126016
    }, 
    positionOverride = Vector3.new(362.37298583984375, 4.114999771118164, 247.4949951171875, 0), 
    scriptWarningOverride = true
};
local function v15() --[[ Line: 21 ]] --[[ Name: locateCar ]]
    -- upvalues: l_Workspace_0 (copy), v3 (copy), v2 (copy)
    local l_Car_0 = l_Workspace_0:FindFirstChild("Car");
    if l_Car_0 then
        return l_Car_0;
    elseif v3 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
            -- upvalues: l_Workspace_0 (ref)
            local v8 = game:GetObjects((("rbxassetid://%*"):format(14215126016)))[1];
            v8:PivotTo(CFrame.new((Vector3.new(362.37298583984375, 4.114999771118164, 247.4949951171875, 0))));
            v8.Parent = l_Workspace_0;
            return v8;
        end);
        if l_status_0 and l_result_0 then
            return l_result_0;
        else
            warn("Could not insert car:", l_result_0);
            return nil;
        end;
    else
        local l_InsertService_0 = game:GetService("InsertService");
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: l_InsertService_0 (copy)
            return l_InsertService_0:LoadAsset(14215126016);
        end);
        if l_status_1 and l_result_1 then
            local l_Car_1 = l_result_1:FindFirstChild("Car");
            l_Car_1.PrimaryPart.Position = Vector3.new(362.37298583984375, 4.114999771118164, 247.4949951171875, 0);
            l_Car_1.Parent = l_Workspace_0;
            return l_Car_1;
        else
            if v2 then
                warn("Could not insert car", l_result_1);
            end;
            return nil;
        end;
    end;
end;
local function v19(v16) --[[ Line: 58 ]] --[[ Name: locateWedge ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_Part_0 = l_Workspace_0:FindFirstChild("Part");
    if l_Part_0 and l_Part_0.Shape == Enum.PartType.Wedge then
        v16.instances.wedge = l_Part_0;
        return l_Part_0;
    else
        local l_Part_1 = Instance.new("Part");
        l_Part_1.Shape = Enum.PartType.Wedge;
        l_Part_1.Position = Vector3.new(360, 1.5, 216, 0);
        l_Part_1.Parent = l_Workspace_0;
        v16.instances.wedge = l_Part_1;
        return l_Part_1;
    end;
end;
local function _(v20) --[[ Line: 73 ]] --[[ Name: getRibbonWidgetUri ]]
    return {
        DataModel = "Standalone", 
        PluginType = "Standalone", 
        PluginId = "Ribbon", 
        Category = "Widgets", 
        ItemId = v20
    };
end;
local function _(v22) --[[ Line: 83 ]] --[[ Name: getQtRibbonWidgetUri ]]
    return {
        PluginId = "QtRibbon", 
        Category = "Widgets", 
        ItemId = v22
    };
end;
local v24 = {
    PluginId = "Explorer", 
    Category = "Widgets", 
    ItemId = "Main"
};
local v25 = {
    PluginId = "Properties", 
    Category = "Widgets", 
    ItemId = "Main"
};
local v26 = {
    DataModel = "Edit", 
    PluginType = "Asset", 
    PluginId = "Toolbox", 
    Category = "Widgets", 
    ItemId = v4 and "Toolbox" or "Main"
};
return {
    id = "StudioTour2", 
    onStart = function(v27) --[[ Line: 113 ]] --[[ Name: onStart ]]
        -- upvalues: l_Workspace_0 (copy)
        v27.instances.camera = l_Workspace_0.CurrentCamera;
        for _, v29 in l_Workspace_0:GetDescendants() do
            if v29:IsA("BasePart") then
                v29.Locked = true;
            end;
        end;
    end, 
    onComplete = function() --[[ Line: 121 ]] --[[ Name: onComplete ]]
        -- upvalues: l_Workspace_0 (copy)
        for _, v31 in l_Workspace_0:GetDescendants() do
            if v31:IsA("BasePart") then
                v31.Locked = false;
            end;
        end;
    end, 
    steps = {
        {
            id = "moveCamera", 
            kind = "Input", 
            keys = {
                Enum.KeyCode.W, 
                Enum.KeyCode.A, 
                Enum.KeyCode.S, 
                Enum.KeyCode.D
            }, 
            topic = "navigation", 
            widgets = ""
        }, 
        {
            id = "panCamera", 
            kind = "Input", 
            keys = {
                Enum.KeyCode.E, 
                Enum.KeyCode.Q
            }, 
            topic = "navigation"
        }, 
        {
            id = "zoomCamera", 
            kind = "Input", 
            inputs = {
                Enum.UserInputType.MouseWheel
            }, 
            topic = "navigation"
        }, 
        {
            id = "rotateCamera", 
            kind = "Rotate", 
            topic = "navigation", 
            instanceId = "camera"
        }, 
        {
            id = "marketplace", 
            topic = "marketplace", 
            widgets = "Toolbox", 
            showNext = true, 
            spotlight = if v2 then {
                TargetWidgetUri = v26, 
                ShowBox = true, 
                ShowHighlight = true, 
                ShowShadows = true
            } else {
                target = "edit_builtin_Toolbox.rbxm_Toolbox", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            }, 
            toolboxLimits = v6
        }, 
        {
            id = "searchMarketplace", 
            kind = "ToolboxSearch", 
            search = "car", 
            toolboxLimits = v6, 
            topic = "marketplace", 
            widgets = "Toolbox"
        }, 
        {
            id = "insertMarketplace", 
            kind = "ToolboxInsert", 
            toolboxLimits = v6, 
            topic = "marketplace", 
            onSkip = function() --[[ Line: 187 ]] --[[ Name: onSkip ]]
                -- upvalues: v15 (copy)
                v15();
            end, 
            widgets = "Toolbox"
        }, 
        {
            id = "wedge", 
            kind = "Insert", 
            topic = "parts", 
            callout = if v1 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Part"
                }, 
                Offset = Vector2.new(5, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Part"
                }, 
                Offset = Vector2.new(0, 5)
            }, 
            spotlight = if v1 and v2 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Part"
                }, 
                ShowHighlight = true
            } else {
                target = "placePartActionRibbonControl", 
                showHighlight = true
            }, 
            instanceId = "wedge", 
            className = "Part", 
            properties = {
                Shape = Enum.PartType.Wedge
            }, 
            onBind = function() --[[ Line: 220 ]] --[[ Name: onBind ]]
                game:GetService("TutorialService"):SetTutorialCompletionStatus(true);
            end, 
            onSkip = function(v32) --[[ Line: 224 ]] --[[ Name: onSkip ]]
                -- upvalues: v19 (copy)
                local v33 = v19(v32);
                if v33 then
                    v33.Position = Vector3.new(343, 1.5, 250, 0);
                end;
            end, 
            onUnbind = function(v34) --[[ Line: 230 ]] --[[ Name: onUnbind ]]
                -- upvalues: v19 (copy)
                local v35 = v19(v34);
                task.delay(0.1, function() --[[ Line: 232 ]]
                    -- upvalues: v35 (copy)
                    v35.Position = Vector3.new(343, 1.5, 250, 0);
                end);
            end, 
            hideWidgets = "Toolbox", 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "move", 
            kind = "Move", 
            topic = "parts", 
            callout = if v1 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Move"
                }, 
                Offset = Vector2.new(0, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Move"
                }, 
                Offset = Vector2.new(0, 5)
            }, 
            spotlight = if v1 and v2 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Move"
                }, 
                ShowHighlight = true
            } else {
                target = "advTranslateAction", 
                showHighlight = true
            }, 
            position = Vector3.new(360, 1, 200, 0), 
            distance = 20, 
            instanceId = "wedge", 
            onSkip = function(v36) --[[ Line: 264 ]] --[[ Name: onSkip ]]
                -- upvalues: v19 (copy)
                local v37 = v19(v36);
                if v37 then
                    v37.Position = Vector3.new(360, 1.5, 216, 0);
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "rotate", 
            kind = "Rotate", 
            topic = "parts", 
            callout = if v1 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Rotate"
                }, 
                Offset = Vector2.new(0, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Rotate"
                }, 
                Offset = Vector2.new(0, 5)
            }, 
            spotlight = if v1 and v2 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Rotate"
                }, 
                ShowHighlight = true
            } else {
                target = "advRotateAction", 
                showHighlight = true
            }, 
            rotation = Vector3.new(180, 0, 180, 0), 
            distance = 30, 
            instanceId = "wedge", 
            onSkip = function(v38) --[[ Line: 297 ]] --[[ Name: onSkip ]]
                -- upvalues: v19 (copy)
                local v39 = v19(v38);
                if v39 then
                    v39.Rotation = Vector3.new(180, 0, 180, 0);
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "scale", 
            kind = "Scale", 
            topic = "parts", 
            callout = if v1 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Scale"
                }, 
                Offset = Vector2.new(0, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Scale"
                }, 
                Offset = Vector2.new(0, 5)
            }, 
            spotlight = if v1 and v2 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Scale"
                }, 
                ShowHighlight = true
            } else {
                target = "resizeAction", 
                showHighlight = true
            }, 
            minSize = Vector3.new(5, 3, 5, 0), 
            instanceId = "wedge", 
            onSkip = function(v40) --[[ Line: 329 ]] --[[ Name: onSkip ]]
                -- upvalues: v19 (copy)
                local v41 = v19(v40);
                if v41 then
                    v41.Position = Vector3.new(364, 3.5999999046325684, 216, 0);
                    v41.Size = Vector3.new(15, 5, 15, 0);
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "color", 
            kind = "Edit", 
            topic = "properties", 
            callout = if v1 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Color"
                }, 
                Offset = Vector2.new(5, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Color"
                }, 
                Offset = Vector2.new(0, 5)
            }, 
            spotlight = if v1 and v2 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Color"
                }, 
                ShowHighlight = true
            } else {
                target = "actionColorSelector", 
                showHighlight = true
            }, 
            className = "Part", 
            changes = {
                Color = true
            }, 
            onSkip = function(v42) --[[ Line: 364 ]] --[[ Name: onSkip ]]
                -- upvalues: v19 (copy)
                local v43 = v19(v42);
                if v43 then
                    v43.Color = Color3.fromRGB(129, 246, 136);
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "anchor", 
            kind = "Edit", 
            topic = "properties", 
            callout = if v1 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Anchor"
                }, 
                Offset = Vector2.new(0, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Anchor"
                }, 
                Offset = Vector2.new(0, 5)
            }, 
            spotlight = if v1 and v2 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Anchor"
                }, 
                ShowHighlight = true
            } else {
                target = "anchorAction", 
                showHighlight = true
            }, 
            className = "Part", 
            changes = {
                Anchored = true
            }, 
            onSkip = function(v44) --[[ Line: 398 ]] --[[ Name: onSkip ]]
                -- upvalues: v19 (copy)
                local v45 = v19(v44);
                if v45 then
                    v45.Anchored = true;
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "explorer", 
            callout = {
                TargetWidgetUri = v24, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 20)
            }, 
            spotlight = if v2 then {
                TargetWidgetUri = v24, 
                ShowBox = true, 
                ShowHighlight = true, 
                ShowShadows = true
            } else {
                target = "explorerWidgetPanel", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            }, 
            topic = "explorer", 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "workspace", 
            path = "Workspace", 
            topic = "explorer", 
            callout = {
                TargetWidgetUri = v24, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 20)
            }, 
            spotlight = if v2 then nil else {
                target = "explorerWidgetPanel", 
                rowName = "Workspace", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            }, 
            showNext = true, 
            onBind = function(v46) --[[ Line: 451 ]] --[[ Name: onBind ]]
                local l_dataModel_0 = v46.dataModel;
                l_dataModel_0:GetService("Selection"):Set({
                    l_dataModel_0:GetService("Workspace")
                });
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "select", 
            kind = "Select", 
            path = "Car", 
            topic = "selection", 
            callout = {
                TargetWidgetUri = v24, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 0)
            }, 
            onSkip = function() --[[ Line: 469 ]] --[[ Name: onSkip ]]
                -- upvalues: v15 (copy)
                local v48 = v15();
                if v48 then
                    game:GetService("Selection"):Set({
                        v48
                    });
                end;
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "focus", 
            topic = "selection", 
            kind = "Focus", 
            callout = {
                TargetWidgetUri = v24, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 20)
            }, 
            onSkip = function() --[[ Line: 488 ]] --[[ Name: onSkip ]]
                -- upvalues: v15 (copy)
                local v49 = v15();
                if v49 then
                    game:GetService("Selection"):Set({
                        v49
                    });
                end;
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "properties", 
            topic = "attributes", 
            callout = {
                TargetWidgetUri = v25, 
                SubjectAnchorPoint = Vector2.new(1, 1), 
                TargetAnchorPoint = Vector2.new(0, 1), 
                Offset = Vector2.new(-10, 0)
            }, 
            spotlight = if v2 then {
                TargetWidgetUri = v25, 
                ShowBox = true, 
                ShowHighlight = true, 
                ShowShadows = true
            } else {
                target = "propertiesWidgetPanel", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            }, 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "maxSpeed", 
            topic = "attributes", 
            kind = "Edit", 
            callout = {
                TargetWidgetUri = v25, 
                SubjectAnchorPoint = Vector2.new(1, 1), 
                TargetAnchorPoint = Vector2.new(0, 1), 
                Offset = Vector2.new(-10, 0)
            }, 
            className = "Model", 
            changes = {
                Attributes = {
                    MaxSpeed = true
                }
            }, 
            onSkip = function() --[[ Line: 538 ]] --[[ Name: onSkip ]]
                -- upvalues: v15 (copy)
                local v50 = v15();
                if v50 then
                    v50:SetAttribute("MaxSpeed", 60);
                end;
            end, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "playtest", 
            topic = "playtest", 
            kind = "StartPlaytest", 
            widgets = "Ribbon-Home,Explorer,Properties", 
            spotlight = if v2 then {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "LeftMezzanine/PlayControls/1"
                }, 
                ShowHighlight = true
            } else {
                target = "playGameActionGroupRibbonControl", 
                showHighlight = true
            }
        }, 
        {
            id = "avatar", 
            topic = "playtest", 
            kind = "Avatar", 
            state = Enum.HumanoidStateType.Seated, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "stopPlaytest", 
            topic = "playtest", 
            kind = "StopPlaytest", 
            widgets = "Ribbon-Home,Explorer,Properties"
        }
    }
};