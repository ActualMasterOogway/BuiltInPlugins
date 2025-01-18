local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseLuaRibbon)();
local v2 = require(l_Parent_0.Src.Flags.getFFlagSpotlightManager)();
local l_Workspace_0 = game:GetService("Workspace");
local l_Selection_0 = game:GetService("Selection");
local v5 = {
    assetIds = {
        17274156146
    }, 
    positionOverride = Vector3.new(-363.5830078125, 18.009000778198242, 74.072998046875, 0), 
    scriptWarningOverride = true
};
local function _(v6) --[[ Line: 20 ]] --[[ Name: getRibbonWidgetUri ]]
    return {
        DataModel = "Standalone", 
        PluginType = "Standalone", 
        PluginId = "Ribbon", 
        Category = "Widgets", 
        ItemId = v6
    };
end;
local function _(v8) --[[ Line: 30 ]] --[[ Name: getQtRibbonWidgetUri ]]
    return {
        PluginId = "QtRibbon", 
        Category = "Widgets", 
        ItemId = v8
    };
end;
local v10 = {
    PluginId = "Explorer", 
    Category = "Widgets", 
    ItemId = "Main"
};
local v11 = {
    PluginId = "Properties", 
    Category = "Widgets", 
    ItemId = "Main"
};
local v12 = {
    DataModel = "Edit", 
    PluginType = "Asset", 
    PluginId = "Toolbox", 
    Category = "Widgets", 
    ItemId = "Toolbox"
};
local function v17() --[[ Line: 58 ]] --[[ Name: locateBall ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_Ball_0 = l_Workspace_0:FindFirstChild("Ball");
    if l_Ball_0 then
        return l_Ball_0;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
            -- upvalues: l_Workspace_0 (ref)
            local v14 = game:GetObjects((("rbxassetid://%*"):format(17274156146)))[1];
            v14:SetPrimaryPartCFrame(CFrame.new((Vector3.new(-363.5830078125, 18.009000778198242, 74.072998046875, 0))));
            v14.Parent = l_Workspace_0;
            return v14;
        end);
        if l_status_0 and l_result_0 then
            return l_result_0;
        else
            warn("Could not insert ball:", l_result_0);
            return nil;
        end;
    end;
end;
local function v20(v18) --[[ Line: 79 ]] --[[ Name: findOrCreateWedge ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_Part_0 = l_Workspace_0:FindFirstChild("Part");
    if l_Part_0 == nil or not l_Part_0:IsA("BasePart") or l_Part_0.Shape ~= Enum.PartType.Wedge then
        l_Part_0 = Instance.new("Part");
        l_Part_0.Shape = Enum.PartType.Wedge;
        l_Part_0.Rotation = Vector3.new(0, -90, 0, 0);
        l_Part_0.Size = Vector3.new(40, 15, 25, 0);
        l_Part_0.Position = Vector3.new(-846.4910278320312, -185.8280029296875, 67.01200103759766, 0);
        l_Part_0.Parent = l_Workspace_0;
    end;
    v18.instances.wedge = l_Part_0;
    return l_Part_0;
end;
return {
    id = "StudioTour3", 
    onStart = function(v21) --[[ Line: 95 ]] --[[ Name: onStart ]]
        -- upvalues: l_Workspace_0 (copy)
        v21.instances.camera = l_Workspace_0.CurrentCamera;
        for _, v23 in l_Workspace_0:GetDescendants() do
            if v23:IsA("BasePart") then
                v23.Locked = true;
            end;
        end;
    end, 
    onComplete = function() --[[ Line: 103 ]] --[[ Name: onComplete ]]
        -- upvalues: l_Workspace_0 (copy)
        for _, v25 in l_Workspace_0:GetDescendants() do
            if v25:IsA("BasePart") then
                v25.Locked = false;
            end;
        end;
    end, 
    steps = {
        {
            id = "intro1", 
            topic = "introduction", 
            showNext = true, 
            cameraFocus = Vector3.new(-363.5830078125, 18.009000778198242, 74.072998046875, 0), 
            cameraOffset = Vector3.new(80, 30, -20, 0), 
            cameraMoveDuration = 0
        }, 
        {
            id = "intro2", 
            topic = "introduction", 
            showNext = true
        }, 
        {
            id = "rotateCamera", 
            kind = "Rotate", 
            topic = "navigation", 
            instanceId = "camera"
        }, 
        {
            id = "moveCamera", 
            kind = "Input", 
            keys = {
                Enum.KeyCode.W, 
                Enum.KeyCode.A, 
                Enum.KeyCode.S, 
                Enum.KeyCode.D
            }, 
            topic = "navigation"
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
            id = "marketplace", 
            topic = "marketplace", 
            widgets = "Toolbox", 
            showNext = true, 
            spotlight = if v2 then {
                TargetWidgetUri = v12, 
                ShowBox = true, 
                ShowHighlight = true, 
                ShowShadows = true
            } else {
                target = "edit_builtin_Toolbox.rbxm_Toolbox", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            }, 
            toolboxLimits = v5
        }, 
        {
            id = "searchMarketplace", 
            kind = "ToolboxSearch", 
            search = "ball", 
            toolboxLimits = v5, 
            topic = "marketplace", 
            widgets = "Toolbox"
        }, 
        {
            id = "insertMarketplace", 
            kind = "ToolboxInsert", 
            toolboxLimits = v5, 
            topic = "marketplace", 
            onSkip = function() --[[ Line: 181 ]] --[[ Name: onSkip ]]
                -- upvalues: v17 (copy)
                v17();
            end, 
            widgets = "Toolbox"
        }, 
        {
            id = "playtest", 
            topic = "playtest", 
            kind = "StartPlaytest", 
            widgets = "Ribbon-Home", 
            hideWidgets = "Toolbox"
        }, 
        {
            id = "avatar", 
            topic = "playtest", 
            kind = "Avatar", 
            state = Enum.HumanoidStateType.Seated, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "stopPlaytest", 
            topic = "playtest", 
            kind = "StopPlaytest", 
            widgets = "Ribbon-Home"
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
            cameraFocus = Vector3.new(-843.9910278320312, -192.8280029296875, 68.51200103759766, 0), 
            cameraOffset = Vector3.new(20, 20, 5, 0), 
            instanceId = "wedge", 
            className = "Part", 
            properties = {
                Shape = Enum.PartType.Wedge
            }, 
            onBind = function() --[[ Line: 235 ]] --[[ Name: onBind ]]
                game:GetService("TutorialService"):SetTutorialCompletionStatus(true);
            end, 
            onSkip = function(v26) --[[ Line: 239 ]] --[[ Name: onSkip ]]
                -- upvalues: v20 (copy)
                v20(v26);
            end, 
            onUnbind = function(v27) --[[ Line: 242 ]] --[[ Name: onUnbind ]]
                -- upvalues: l_Workspace_0 (copy)
                v27.instances.wedge = l_Workspace_0:FindFirstChild("Part");
            end, 
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
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(0, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Move"
                }, 
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
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
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
                ShowHighlight = true
            } else {
                target = "advTranslateAction", 
                targetAnchorPoint = Vector2.new(0, 1), 
                subjectAnchorPoint = Vector2.new(0, 0), 
                showHighlight = true
            }, 
            position = Vector3.new(-851.3300170898438, -193.0449981689453, 60.763999938964844, 0), 
            distance = 80, 
            instanceId = "wedge", 
            onSkip = function(v28) --[[ Line: 280 ]] --[[ Name: onSkip ]]
                -- upvalues: v20 (copy)
                v20(v28).Position = Vector3.new(-843.9910278320312, -192.8280029296875, 68.51200103759766, 0);
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
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(0, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Rotate"
                }, 
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
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
            rotation = Vector3.new(0, -90, 0, 0), 
            distance = 30, 
            instanceId = "wedge", 
            onSkip = function(v29) --[[ Line: 315 ]] --[[ Name: onSkip ]]
                -- upvalues: v20 (copy)
                v20(v29).Rotation = Vector3.new(0, -90, 0, 0);
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
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(0, 20)
            } else {
                TargetWidgetUri = {
                    PluginId = "QtRibbon", 
                    Category = "Widgets", 
                    ItemId = "Scale"
                }, 
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
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
            minSize = Vector3.new(15, 5, 10, 0), 
            instanceId = "wedge", 
            onSkip = function(v30) --[[ Line: 349 ]] --[[ Name: onSkip ]]
                -- upvalues: v20 (copy)
                local v31 = v20(v30);
                v31.Position = Vector3.new(-846.4910278320312, -185.8280029296875, 67.01200103759766, 0);
                v31.Size = Vector3.new(40, 15, 25, 0);
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
            onSkip = function(v32) --[[ Line: 382 ]] --[[ Name: onSkip ]]
                -- upvalues: v20 (copy)
                v20(v32).Color = Color3.fromRGB(129, 246, 136);
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
            onSkip = function(v33) --[[ Line: 414 ]] --[[ Name: onSkip ]]
                -- upvalues: v20 (copy)
                v20(v33).Anchored = true;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "explorer", 
            callout = {
                TargetWidgetUri = v10, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 20)
            }, 
            spotlight = if v2 then {
                TargetWidgetUri = v10, 
                ShowBox = true, 
                ShowHighlight = true, 
                ShowShadows = true
            } else {
                target = "explorerWidgetPanel", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            }, 
            topic = "properties", 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "select", 
            kind = "Select", 
            path = "Ball", 
            topic = "properties", 
            callout = {
                TargetWidgetUri = v10, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 20)
            }, 
            onSkip = function() --[[ Line: 456 ]] --[[ Name: onSkip ]]
                -- upvalues: v17 (copy), l_Selection_0 (copy)
                local v34 = v17();
                if v34 then
                    l_Selection_0:Set({
                        v34
                    });
                end;
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "focus", 
            topic = "properties", 
            kind = "Focus", 
            onSkip = function() --[[ Line: 468 ]] --[[ Name: onSkip ]]
                -- upvalues: v17 (copy), l_Selection_0 (copy)
                local v35 = v17();
                if v35 then
                    l_Selection_0:Set({
                        v35
                    });
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "properties", 
            topic = "properties", 
            callout = {
                TargetWidgetUri = v11, 
                SubjectAnchorPoint = Vector2.new(1, 1), 
                TargetAnchorPoint = Vector2.new(0, 1), 
                Offset = Vector2.new(-10, 0)
            }, 
            spotlight = if v2 then {
                TargetWidgetUri = v11, 
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
            id = "speed", 
            topic = "properties", 
            kind = "Edit", 
            callout = {
                TargetWidgetUri = v11, 
                SubjectAnchorPoint = Vector2.new(1, 1), 
                TargetAnchorPoint = Vector2.new(0, 1), 
                Offset = Vector2.new(-10, 0)
            }, 
            className = "Model", 
            changes = {
                Attributes = {
                    Speed = true
                }
            }, 
            onSkip = function() --[[ Line: 517 ]] --[[ Name: onSkip ]]
                -- upvalues: v17 (copy)
                local v36 = v17();
                if v36 then
                    v36:SetAttribute("Speed", 250);
                end;
            end, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "save", 
            topic = "summary", 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "playtest2", 
            topic = "summary", 
            kind = "StartPlaytest", 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "stopPlaytest2", 
            topic = "summary", 
            kind = "StopPlaytest", 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "complete", 
            topic = "summary", 
            widgets = "Ribbon-Home,Explorer,Properties"
        }
    }
};