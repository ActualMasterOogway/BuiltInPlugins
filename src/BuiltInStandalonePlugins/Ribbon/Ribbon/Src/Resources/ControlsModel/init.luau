local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaRibbonAnchorLockModes)();
local l_fromAction_0 = v1.fromAction;
local l_fromSetting_0 = v1.fromSetting;
local function v6(...) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), l_fromAction_0 (copy)
    return v1.toString(l_fromAction_0(...));
end;
local function v7(...) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), l_fromSetting_0 (copy)
    return v1.toString(l_fromSetting_0(...));
end;
local l_AddExitClientAction_0 = game:GetFastFlag("AddExitClientAction");
local v9 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddPauseResumeStepForwardDebugButtonsLuaRibbon)();
local v10 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddTestModeDropDown)();
local v11 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagRibbonSpinboxStyleUpdate)();
local v12 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagRibbonEnableSliderLua)();
local v13 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddPlayerSetting)();
local v14 = {};
local v15 = {};
if v9 then
    v15[v7("RunTools", "TestMode")] = {
        Type = "Enum", 
        Values = {
            {
                Id = "Test", 
                Text = v10 and "Setting_TestingMode_Test" or "Test"
            }, 
            {
                Id = "TestHere", 
                Text = v10 and "Setting_TestingMode_TestHere" or "Test Here"
            }, 
            {
                Id = "Run", 
                Text = v10 and "Setting_TestingMode_Run" or "Run"
            }, 
            {
                Id = "TeamTest", 
                Text = v10 and "Setting_TestingMode_TeamTest" or "Team Test"
            }, 
            {
                Id = "ServerAndClients", 
                Text = v10 and "Setting_TestingMode_ServerAndClients" or "Server and Clients"
            }, 
            {
                Id = "DebugPlugin", 
                Text = v10 and "Setting_TestingMode_DebugPlugin" or "Debug Plugin"
            }
        }
    };
end;
v15[v7("RunTools", "RunMode")] = {
    Type = "Enum", 
    Values = {
        {
            Id = "Play", 
            Action = l_fromAction_0("RunTools", "Play"), 
            Size = "Small"
        }, 
        {
            Id = "PlayHere", 
            Action = l_fromAction_0("RunTools", "PlayHere"), 
            Size = "Small"
        }, 
        {
            Id = "Run", 
            Action = l_fromAction_0("RunTools", "Run"), 
            Size = "Small"
        }, 
        {
            Id = "TeamTest", 
            Action = l_fromAction_0("RunTools", "TeamTest"), 
            Size = "Small"
        }, 
        {
            Id = "ServerAndClients/1", 
            Action = l_fromAction_0("RunTools", "ServerAndClients"), 
            Size = "Small"
        }
    }
};
v15[v6("RunTools", "ServerAndClients")] = {
    Icon = "StartServerAndClient"
};
v15[v6("RunTools", "Play")] = {
    Icon = "Play", 
    ForceRefreshAfterBind = true
};
v15[v6("RunTools", "PlayHere")] = {
    Icon = "PlayHere"
};
v15[v6("RunTools", "Run")] = {
    Icon = "Run"
};
v15[v6("RunTools", "TeamTest")] = {
    Icon = "TeamTest"
};
v15[v6("RunTools", "CleanupTeamTest")] = {
    Icon = "ExitGame"
};
v15[v6("RunTools", "Pause")] = {
    Icon = "Pause"
};
v15[v6("RunTools", "Resume")] = {
    Icon = "Resume"
};
if v9 then
    v15[v7("RunTools", "PauseMode")] = {
        Type = "Enum", 
        Values = {
            {
                Id = "PausePhysicsAll", 
                Action = l_fromAction_0("RunTools", "PausePhysicsAll"), 
                Size = "Small"
            }, 
            {
                Id = "PausePhysicsCurrent", 
                Action = l_fromAction_0("RunTools", "PausePhysicsCurrent"), 
                Size = "Small"
            }
        }
    };
    v15[v7("RunTools", "ResumeMode")] = {
        Type = "Enum", 
        Values = {
            {
                Id = "ResumePhysicsAll", 
                Action = l_fromAction_0("RunTools", "ResumePhysicsAll"), 
                Size = "Small"
            }, 
            {
                Id = "ResumePhysicsCurrent", 
                Action = l_fromAction_0("RunTools", "ResumePhysicsCurrent"), 
                Size = "Small"
            }
        }
    };
    v15[v7("RunTools", "StepForwardMode")] = {
        Type = "Enum", 
        Values = {
            {
                Id = "StepForwardPhysicsAll", 
                Action = l_fromAction_0("RunTools", "StepForwardPhysicsAll"), 
                Size = "Small"
            }, 
            {
                Id = "StepForwardPhysicsCurrent", 
                Action = l_fromAction_0("RunTools", "StepForwardPhysicsCurrent"), 
                Size = "Small"
            }
        }
    };
    v15[v6("RunTools", "PausePhysicsCurrent")] = {
        Icon = "Pause"
    };
    v15[v6("RunTools", "PausePhysicsAll")] = {
        Icon = "Pause"
    };
    v15[v6("RunTools", "ResumePhysicsCurrent")] = {
        Icon = "Resume"
    };
    v15[v6("RunTools", "ResumePhysicsAll")] = {
        Icon = "Resume"
    };
    v15[v6("RunTools", "StepForwardPhysicsCurrent")] = {
        Icon = "Placeholder"
    };
    v15[v6("RunTools", "StepForwardPhysicsAll")] = {
        Icon = "Placeholder"
    };
    v15[v7("RunTools", "AddClients")] = {
        Icon = v13 and "AddClient" or "Placeholder", 
        Text = "AddClients", 
        Tooltip = "AddClientsTooltip"
    };
    v15[v6("RunTools", "LaunchTestMode")] = {
        Icon = "Play"
    };
end;
if l_AddExitClientAction_0 then
    v15[v6("RunTools", "ExitClient")] = {
        Icon = "ExitGame"
    };
end;
v15[v6("RunTools", "Stop")] = {
    Icon = "StopActive"
};
v15[v6("RunTools", "ToggleDM")] = {
    Icon = "ClientServer"
};
v15[v6("RunTools", "CleanupServerAndClients")] = {
    Icon = "ExitTestSession"
};
v15[v6("Assistant", "Toggle")] = {
    Icon = "AI"
};
v15[v6("ShareGame", "Toggle")] = {
    Icon = "Share"
};
v15[v6("ConnectionIndicator", "Toggle")] = {
    Icon = "Status_Green"
};
v15[v6("Notifications", "Toggle")] = {
    Icon = "Notification"
};
v15[v6("UpdateAvailable", "Toggle")] = {
    Icon = "Update", 
    RibbonOverrideText = "Action_UpdateAvailable"
};
v15[v6("LogoutMenu", "Toggle")] = {
    Icon = "ArrowDown", 
    IconSide = "Right"
};
v15[v6("BuilderTools", "Select")] = {
    Icon = "Select"
};
v15[v6("BuilderTools", "Move")] = {
    Icon = "Move"
};
v15[v6("BuilderTools", "Rotate")] = {
    Icon = "Rotate"
};
v15[v6("BuilderTools", "Scale")] = {
    Icon = "Scale"
};
v15[v6("BuilderTools", "Transform")] = {
    Icon = "Transform"
};
v15[v6("BuilderTools", "SelectColor")] = {
    Icon = "Color"
};
v15[v6("TerrainTools", "Toggle")] = {
    Icon = "Terrain"
};
v15[v6("Character", "Toggle")] = {
    Icon = "Character"
};
v15[v6("MaterialManager", "Toggle")] = {
    Icon = "Material"
};
v15[v7("BuilderTools", "Group")] = {
    Type = "Enum", 
    Text = "Setting_Group", 
    Tooltip = "Tooltip_Group", 
    Values = {
        {
            Id = "GroupAsModel", 
            Action = l_fromAction_0("BuilderTools", "GroupAsModel")
        }, 
        {
            Id = "GroupAsFolder", 
            Action = l_fromAction_0("BuilderTools", "GroupAsFolder")
        }
    }
};
v15[v6("BuilderTools", "GroupAsModel")] = {
    Icon = "Group"
};
v15[v6("BuilderTools", "GroupAsFolder")] = {
    Icon = "GroupAsAFolder"
};
if v3 then
    v15[v6("BuilderTools", "Anchor")] = {
        Icon = "Anchor"
    };
    v15[v6("BuilderTools", "Lock")] = {
        Icon = "Lock"
    };
    v15[v6("BuilderTools", "AnchorTool")] = {
        Icon = "AnchorTool"
    };
    v15[v6("BuilderTools", "LockTool")] = {
        Icon = "LockTool"
    };
    v15[v7("BuilderTools", "AnchorMode")] = {
        Type = "Enum", 
        Text = "Setting_Anchor", 
        RibbonOverrideText = "AnchorToolRibbonAction", 
        Values = {
            {
                Id = "Anchor", 
                Action = l_fromAction_0("BuilderTools", "Anchor")
            }, 
            {
                Id = "AnchorTool", 
                Action = l_fromAction_0("BuilderTools", "AnchorTool")
            }
        }
    };
    v15[v7("BuilderTools", "LockMode")] = {
        Type = "Enum", 
        Text = "Setting_Lock", 
        RibbonOverrideText = "LockToolRibbonAction", 
        Values = {
            {
                Id = "Lock", 
                Action = l_fromAction_0("BuilderTools", "Lock")
            }, 
            {
                Id = "LockTool", 
                Action = l_fromAction_0("BuilderTools", "LockTool")
            }
        }
    };
else
    v15[v6("BuilderTools", "Lock")] = {
        Text = "Lock", 
        Icon = "Lock", 
        Enabled = false, 
        NoBinding = true
    };
    v15[v6("BuilderTools", "LockMode")] = {
        RibbonOverrideText = "LockToolRibbonAction"
    };
    v15[v6("BuilderTools", "Anchor")] = {
        Icon = "Anchor"
    };
    v15[v6("BuilderTools", "AnchorMode")] = {
        RibbonOverrideText = "AnchorToolRibbonAction", 
        NoBinding = true
    };
end;
v15[v6("BuilderTools", "EditPivot")] = {
    Icon = "EditPivot"
};
v15[v6("BuilderTools", "ResetPivot")] = {
    Icon = "ResetPivot"
};
v15[v6("BuilderTools", "Align")] = {
    Icon = "AlignTool"
};
v15[v6("BuilderTools", "UnionSelection")] = {
    Icon = "UnionOperation"
};
v15[v6("BuilderTools", "IntersectSelection")] = {
    Icon = "IntersectOperation"
};
v15[v6("BuilderTools", "SeparateSelection")] = {
    Icon = "SeparateOperation"
};
v15[v6("BuilderTools", "NegateSelection")] = {
    Icon = "NegateOperation"
};
v15[v6("Properties", "Toggle")] = {
    Icon = "Properties"
};
v15[v6("Explorer", "Toggle")] = {
    Icon = "Explorer"
};
v15[v6("Toolbox", "Toggle")] = {
    Icon = "Toolbox"
};
v15[v7("RunTools", "PlayersMode")] = {
    Type = "Number", 
    Increment = 1, 
    Maximum = 8, 
    Minimum = -1, 
    Precision = 0, 
    FormatStringKey = if v11 then nil else "PlayersFormat", 
    Icon = v13 and "Player" or v11 and "AddCollaborator" or nil, 
    IsShort = v11 and true or nil
};
if v13 then
    v15[v7("RunTools", "AddPlayer")] = {
        Type = "Number", 
        Increment = 1, 
        Maximum = 8, 
        Minimum = 0, 
        Precision = 0, 
        FormatStringKey = if v11 then nil else "PlayersFormat", 
        Icon = v11 and "Player" or nil, 
        IsShort = v11 and true or nil
    };
end;
v15[v7("BuilderTools", "MoveGridSize")] = {
    Type = "Number", 
    Increment = 0.2, 
    Maximum = 2048, 
    Minimum = 0, 
    Precision = 3, 
    FormatStringKey = "StudsFormat"
};
v15[v7("BuilderTools", "RotateGridSize")] = {
    Type = "Number", 
    Increment = 5, 
    Maximum = 180, 
    Minimum = 0, 
    Precision = 3, 
    FormatStringKey = "DegreesFormat"
};
local v16 = {
    {
        Id = "ScreenGui", 
        Action = l_fromAction_0("BuilderTools", "Insert/ScreenGui")
    }, 
    {
        Id = "SurfaceGui", 
        Action = l_fromAction_0("BuilderTools", "Insert/SurfaceGui")
    }, 
    {
        Id = "AdGui", 
        Action = l_fromAction_0("BuilderTools", "Insert/AdGui")
    }, 
    {
        Id = "BillboardGui", 
        Action = l_fromAction_0("BuilderTools", "Insert/BillboardGui")
    }
};
v15[v7("BuilderTools", "InsertGui")] = {
    Type = "Enum", 
    Text = "Setting_GUI", 
    Tooltip = "Tooltip_GUI", 
    Values = v16
};
v15[v6("BuilderTools", "Insert/ScreenGui")] = {
    Icon = "GUI"
};
v15[v6("BuilderTools", "Insert/SurfaceGui")] = {
    Icon = "SurfaceGUI"
};
v15[v6("BuilderTools", "Insert/AdGui")] = {
    Icon = "Placeholder"
};
v15[v6("BuilderTools", "Insert/BillboardGui")] = {
    Icon = "BillboardGUI"
};
local v17 = {
    {
        Id = "ImageLabel", 
        Action = l_fromAction_0("BuilderTools", "Insert/ImageLabel")
    }, 
    {
        Id = "TextLabel", 
        Action = l_fromAction_0("BuilderTools", "Insert/TextLabel")
    }
};
v15[v7("BuilderTools", "InsertUILabel")] = {
    Type = "Enum", 
    Text = "Setting_Label", 
    Values = v17
};
v15[v6("BuilderTools", "Insert/TextLabel")] = {
    Icon = "TextLabel"
};
v15[v6("BuilderTools", "Insert/ImageLabel")] = {
    Icon = "ImageLabel"
};
v15[v7("BuilderTools", "InsertUIFrame")] = {
    Type = "Enum", 
    Text = "Setting_Frame", 
    Values = {
        {
            Id = "Frame", 
            Action = l_fromAction_0("BuilderTools", "Insert/Frame")
        }, 
        {
            Id = "CanvasGroup", 
            Action = l_fromAction_0("BuilderTools", "Insert/CanvasGroup")
        }, 
        {
            Id = "ScrollingFrame", 
            Action = l_fromAction_0("BuilderTools", "Insert/ScrollingFrame")
        }, 
        {
            Id = "VideoFrame", 
            Action = l_fromAction_0("BuilderTools", "Insert/VideoFrame")
        }, 
        {
            Id = "ViewportFrame", 
            Action = l_fromAction_0("BuilderTools", "Insert/ViewportFrame")
        }
    }
};
v15[v6("BuilderTools", "Insert/CanvasGroup")] = {
    Icon = "CanvasGroup"
};
v15[v6("BuilderTools", "Insert/VideoFrame")] = {
    Icon = "VideoFrame"
};
v15[v6("BuilderTools", "Insert/ViewportFrame")] = {
    Icon = "ViewportFrame"
};
v15[v6("BuilderTools", "Insert/Frame")] = {
    Icon = "Frame"
};
v15[v6("BuilderTools", "Insert/ScrollingFrame")] = {
    Icon = "ScrollingFrame"
};
local v18 = {
    {
        Id = "ImageButton", 
        Action = l_fromAction_0("BuilderTools", "Insert/ImageButton")
    }, 
    {
        Id = "TextButton", 
        Action = l_fromAction_0("BuilderTools", "Insert/TextButton")
    }, 
    {
        Id = "TextBox", 
        Action = l_fromAction_0("BuilderTools", "Insert/TextBox")
    }
};
v15[v7("BuilderTools", "InsertUIInput")] = {
    Type = "Enum", 
    Text = "Setting_Input", 
    Values = v18
};
v15[v6("BuilderTools", "Insert/TextButton")] = {
    Icon = "TextButton"
};
v15[v6("BuilderTools", "Insert/TextBox")] = {
    Icon = "TextBox"
};
v15[v6("BuilderTools", "Insert/ImageButton")] = {
    Icon = "ImageButton"
};
v15[v7("BuilderTools", "InsertUIAppearance")] = {
    Type = "Enum", 
    Text = "Setting_Appearance", 
    Values = {
        {
            Id = "UICorner", 
            Action = l_fromAction_0("BuilderTools", "Insert/UICorner")
        }, 
        {
            Id = "UIGradient", 
            Action = l_fromAction_0("BuilderTools", "Insert/UIGradient")
        }, 
        {
            Id = "UIPadding", 
            Action = l_fromAction_0("BuilderTools", "Insert/UIPadding")
        }, 
        {
            Id = "UIStroke", 
            Action = l_fromAction_0("BuilderTools", "Insert/UIStroke")
        }
    }
};
v15[v6("BuilderTools", "Insert/UICorner")] = {
    Icon = "UICorner"
};
v15[v6("BuilderTools", "Insert/UIGradient")] = {
    Icon = "UIGradient"
};
v15[v6("BuilderTools", "Insert/UIPadding")] = {
    Icon = "UIPadding"
};
v15[v6("BuilderTools", "Insert/UIStroke")] = {
    Icon = "UIStroke"
};
local v19 = {
    {
        Id = "UIGridLayout", 
        Action = l_fromAction_0("BuilderTools", "Insert/UIGridLayout")
    }, 
    {
        Id = "UIListLayout", 
        Action = l_fromAction_0("BuilderTools", "Insert/UIListLayout")
    }, 
    {
        Id = "UIPageLayout", 
        Action = l_fromAction_0("BuilderTools", "Insert/UIPageLayout")
    }, 
    {
        Id = "UITableLayout", 
        Action = l_fromAction_0("BuilderTools", "Insert/UITableLayout")
    }, 
    {
        Id = "UIFlexItem", 
        Action = l_fromAction_0("BuilderTools", "Insert/UIFlexItem")
    }
};
v15[v7("BuilderTools", "InsertUILayout")] = {
    Type = "Enum", 
    Text = "Setting_Layout", 
    Values = v19
};
v15[v6("BuilderTools", "Insert/UIGridLayout")] = {
    Icon = "UIGridLayout"
};
v15[v6("BuilderTools", "Insert/UIListLayout")] = {
    Icon = "UIListLayout"
};
v15[v6("BuilderTools", "Insert/UIPageLayout")] = {
    Icon = "UIPageLayout"
};
v15[v6("BuilderTools", "Insert/UITableLayout")] = {
    Icon = "UITableLayout"
};
v15[v6("BuilderTools", "Insert/UIFlexItem")] = {
    Icon = "Placeholder"
};
v15[v7("BuilderTools", "InsertUIConstraint")] = {
    Type = "Enum", 
    Text = "Setting_UIConstraint", 
    Values = {
        {
            Id = "UIAspectRatioConstraint", 
            Action = l_fromAction_0("BuilderTools", "Insert/UIAspectRatioConstraint")
        }, 
        {
            Id = "UIScale", 
            Action = l_fromAction_0("BuilderTools", "Insert/UIScale")
        }, 
        {
            Id = "UISizeConstraint", 
            Action = l_fromAction_0("BuilderTools", "Insert/UISizeConstraint")
        }, 
        {
            Id = "UITextSizeConstraint", 
            Action = l_fromAction_0("BuilderTools", "Insert/UITextSizeConstraint")
        }
    }
};
v15[v6("BuilderTools", "Insert/UIAspectRatioConstraint")] = {
    Icon = "UIAspectRatioConstraint"
};
v15[v6("BuilderTools", "Insert/UIScale")] = {
    Icon = "UIScale"
};
v15[v6("BuilderTools", "Insert/UISizeConstraint")] = {
    Icon = "UISizeConstraint"
};
v15[v6("BuilderTools", "Insert/UITextSizeConstraint")] = {
    Icon = "UITextSizeConstraint"
};
v15[v6("AvatarSetup", "Toggle")] = {
    Icon = "Setup"
};
v15[v6("AnimationEditor", "Toggle")] = {
    Icon = "Animation"
};
v15[v6("AccessoryFittingTool", "Toggle")] = {
    Icon = "Accessory"
};
v15[v6("AccessoryFittingTool", "Create")] = {
    Icon = "Layered"
};
v15[v6("R15Migrator", "Toggle")] = {
    Icon = "R6toR15"
};
v15[v6("ScriptTools", "Back")] = {
    Icon = "Back"
};
v15[v6("ScriptTools", "Forward")] = {
    Icon = "Fwd"
};
v15[v7("ScriptTools", "CreateScript")] = {
    Type = "Enum", 
    Text = "Setting_Script", 
    Tooltip = "Tooltip_Script", 
    Values = {
        {
            Id = "Script", 
            Action = l_fromAction_0("ScriptTools", "Insert/Script")
        }, 
        {
            Id = "LocalScript", 
            Action = l_fromAction_0("ScriptTools", "Insert/LocalScript")
        }, 
        {
            Id = "ModuleScript", 
            Action = l_fromAction_0("ScriptTools", "Insert/ModuleScript")
        }
    }
};
v15[v6("ScriptTools", "Insert/Script")] = {
    Icon = "Script"
};
v15[v6("ScriptTools", "Insert/LocalScript")] = {
    Icon = "LocalScript"
};
v15[v6("ScriptTools", "Insert/ModuleScript")] = {
    Icon = "ModuleScript"
};
v15[v7("ScriptTools", "FormatScript")] = {
    Type = "Enum", 
    Text = "Setting_Format", 
    Tooltip = "Tooltip_Format", 
    Values = {
        {
            Id = "FormatSelection", 
            Action = l_fromAction_0("ScriptTools", "FormatSelection")
        }, 
        {
            Id = "FormatDocument", 
            Action = l_fromAction_0("ScriptTools", "FormatDocument")
        }
    }
};
v15[v6("ScriptTools", "FormatSelection")] = {
    Icon = "FormatSelection"
};
v15[v6("ScriptTools", "FormatDocument")] = {
    Icon = "FormatDocument"
};
v15[v7("ScriptTools", "Find")] = {
    Type = "Enum", 
    Text = "Setting_Find", 
    Values = {
        {
            Id = "Find", 
            Action = l_fromAction_0("ScriptTools", "Find")
        }, 
        {
            Id = "FindAll", 
            Action = l_fromAction_0("ScriptTools", "FindAll")
        }
    }
};
v15[v6("ScriptTools", "Find")] = {
    Icon = "Find"
};
v15[v6("ScriptTools", "FindAll")] = {
    Icon = "FindAll"
};
v15[v6("ScriptTools", "GoToLine")] = {
    Icon = "GoToLine"
};
v15[v6("CommandBar", "Toggle")] = {
    Icon = "Command"
};
v15[v6("Output", "Toggle")] = {
    Icon = "Output"
};
v15[v6("Breakpoints", "Toggle")] = {
    Icon = "Breakpoints"
};
v15[v6("CallStack", "Toggle")] = {
    Icon = "CallStack"
};
v15[v6("Watch", "Toggle")] = {
    Icon = "Watch"
};
v15[v6("ScriptTools", "StepOut")] = {
    Icon = "StepOut"
};
v15[v6("ScriptTools", "StepOver")] = {
    Icon = "StepOver"
};
v15[v6("ScriptTools", "StepInto")] = {
    Icon = "StepInto"
};
v15[v6("Analysis", "Toggle")] = {
    Icon = "Analysis"
};
v15[v6("Performance", "Toggle")] = {
    Icon = "Performance"
};
v15[v6("CodeSnippets", "Toggle")] = {
    Icon = "CodeSnippet"
};
v15[v7("BuilderTools", "DraggerMode")] = {
    Type = "Enum", 
    Tooltip = "Tooltip_Mode", 
    Values = {
        {
            Id = "Geometric", 
            Text = "Geometric", 
            Icon = "Geometric"
        }, 
        {
            Id = "Physical", 
            Text = "Physical", 
            Icon = "Physical"
        }
    }
};
v15[v7("BuilderTools", "PartShape")] = {
    Type = "Enum", 
    Text = "Setting_Part", 
    Tooltip = "Tooltip_Part", 
    Values = {
        {
            Id = "Block", 
            Action = l_fromAction_0("BuilderTools", "Insert/Block")
        }, 
        {
            Id = "Sphere", 
            Action = l_fromAction_0("BuilderTools", "Insert/Sphere")
        }, 
        {
            Id = "Wedge", 
            Action = l_fromAction_0("BuilderTools", "Insert/Wedge")
        }, 
        {
            Id = "CornerWedge", 
            Action = l_fromAction_0("BuilderTools", "Insert/CornerWedge")
        }, 
        {
            Id = "Cylinder", 
            Action = l_fromAction_0("BuilderTools", "Insert/Cylinder")
        }
    }
};
v15[v6("BuilderTools", "Insert/Block")] = {
    Icon = "Part"
};
v15[v6("BuilderTools", "Insert/Sphere")] = {
    Icon = "Part_Sphere"
};
v15[v6("BuilderTools", "Insert/Wedge")] = {
    Icon = "Part_Wedge"
};
v15[v6("BuilderTools", "Insert/CornerWedge")] = {
    Icon = "Part_CornerWedge"
};
v15[v6("BuilderTools", "Insert/Cylinder")] = {
    Icon = "Part_Cylinder"
};
v15[v7("BuilderTools", "EffectType")] = {
    Type = "Enum", 
    Text = "Setting_Effect", 
    Values = {
        {
            Id = "Beam", 
            Action = l_fromAction_0("BuilderTools", "Insert/Beam")
        }, 
        {
            Id = "Explosion", 
            Action = l_fromAction_0("BuilderTools", "Insert/Explosion")
        }, 
        {
            Id = "Fire", 
            Action = l_fromAction_0("BuilderTools", "Insert/Fire")
        }, 
        {
            Id = "Highlight", 
            Action = l_fromAction_0("BuilderTools", "Insert/Highlight")
        }, 
        {
            Id = "ParticleEmitter", 
            Action = l_fromAction_0("BuilderTools", "Insert/ParticleEmitter")
        }, 
        {
            Id = "Smoke", 
            Action = l_fromAction_0("BuilderTools", "Insert/Smoke")
        }, 
        {
            Id = "Sparkles", 
            Action = l_fromAction_0("BuilderTools", "Insert/Sparkles")
        }, 
        {
            Id = "Trail", 
            Action = l_fromAction_0("BuilderTools", "Insert/Trail")
        }, 
        {
            Id = "PointLight", 
            Action = l_fromAction_0("BuilderTools", "Insert/PointLight")
        }, 
        {
            Id = "SpotLight", 
            Action = l_fromAction_0("BuilderTools", "Insert/SpotLight")
        }, 
        {
            Id = "SurfaceLight", 
            Action = l_fromAction_0("BuilderTools", "Insert/SurfaceLight")
        }
    }
};
v15[v6("BuilderTools", "Insert/Beam")] = {
    Icon = "Effect_Beam"
};
v15[v6("BuilderTools", "Insert/Explosion")] = {
    Icon = "Effect_Explosion"
};
v15[v6("BuilderTools", "Insert/Fire")] = {
    Icon = "Effect_Fire"
};
v15[v6("BuilderTools", "Insert/Highlight")] = {
    Icon = "Effect_Highlight"
};
v15[v6("BuilderTools", "Insert/ParticleEmitter")] = {
    Icon = "Effect_ParticleEmitter"
};
v15[v6("BuilderTools", "Insert/PointLight")] = {
    Icon = "Effect_PointLight"
};
v15[v6("BuilderTools", "Insert/Smoke")] = {
    Icon = "Effect_Smoke"
};
v15[v6("BuilderTools", "Insert/Sparkles")] = {
    Icon = "Effect_Sparkles"
};
v15[v6("BuilderTools", "Insert/SpotLight")] = {
    Icon = "Effect_SpotLight"
};
v15[v6("BuilderTools", "Insert/SurfaceLight")] = {
    Icon = "Effect_SurfaceLight"
};
v15[v6("BuilderTools", "Insert/Trail")] = {
    Icon = "Effect_Trail"
};
v15[v7("BuilderTools", "ConstraintType")] = {
    Type = "Enum", 
    Text = "Setting_Constraint", 
    Tooltip = "Tooltip_Constraint", 
    Rows = 9, 
    Values = {
        {
            Id = "ConstraintAlignPosition", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintAlignPosition")
        }, 
        {
            Id = "ConstraintAlignOrientation", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintAlignOrientation")
        }, 
        {
            Id = "ConstraintAngularVelocity", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintAngularVelocity")
        }, 
        {
            Id = "ConstraintAttachment", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintAttachment")
        }, 
        {
            Id = "ConstraintBallInSocket", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintBallInSocket")
        }, 
        {
            Id = "ConstraintCylindrical", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintCylindrical")
        }, 
        {
            Id = "ConstraintHinge", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintHinge")
        }, 
        {
            Id = "ConstraintLinearVelocity", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintLinearVelocity")
        }, 
        {
            Id = "ConstraintLineForce", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintLineForce")
        }, 
        {
            Id = "ConstraintNoCollision", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintNoCollision")
        }, 
        {
            Id = "ConstraintPlane", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintPlane")
        }, 
        {
            Id = "ConstraintPrismatic", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintPrismatic")
        }, 
        {
            Id = "ConstraintRigid", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintRigid")
        }, 
        {
            Id = "ConstraintRod", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintRod")
        }, 
        {
            Id = "ConstraintRope", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintRope")
        }, 
        {
            Id = "ConstraintSpring", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintSpring")
        }, 
        {
            Id = "ConstraintTorque", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintTorque")
        }, 
        {
            Id = "ConstraintTorsionSpring", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintTorsionSpring")
        }, 
        {
            Id = "ConstraintUniversal", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintUniversal")
        }, 
        {
            Id = "ConstraintVectorForce", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintVectorForce")
        }, 
        {
            Id = "ConstraintWeld", 
            Action = l_fromAction_0("BuilderTools", "Insert/ConstraintWeld")
        }
    }
};
v15[v6("BuilderTools", "Insert/ConstraintAlignOrientation")] = {
    Icon = "Constraint_AlignOrientation"
};
v15[v6("BuilderTools", "Insert/ConstraintAlignPosition")] = {
    Icon = "Constraint_AlignPosition"
};
v15[v6("BuilderTools", "Insert/ConstraintAngularVelocity")] = {
    Icon = "Constraint_AngularVelocity"
};
v15[v6("BuilderTools", "Insert/ConstraintAttachment")] = {
    Icon = "Constraint_Attachment"
};
v15[v6("BuilderTools", "Insert/ConstraintBallInSocket")] = {
    Icon = "Constraint_BallInSocket"
};
v15[v6("BuilderTools", "Insert/ConstraintCylindrical")] = {
    Icon = "Constraint_Cylindrical"
};
v15[v6("BuilderTools", "Insert/ConstraintHinge")] = {
    Icon = "Constraint_Hinge"
};
v15[v6("BuilderTools", "Insert/ConstraintLinearVelocity")] = {
    Icon = "Constraint_LinearVelocity"
};
v15[v6("BuilderTools", "Insert/ConstraintLineForce")] = {
    Icon = "Constraint_LineForce"
};
v15[v6("BuilderTools", "Insert/ConstraintNoCollision")] = {
    Icon = "Constraint_NoCollision"
};
v15[v6("BuilderTools", "Insert/ConstraintPlane")] = {
    Icon = "Constraint_Plane"
};
v15[v6("BuilderTools", "Insert/ConstraintPrismatic")] = {
    Icon = "Constraint_Prismatic"
};
v15[v6("BuilderTools", "Insert/ConstraintRigid")] = {
    Icon = "Constraint_Rigid"
};
v15[v6("BuilderTools", "Insert/ConstraintRod")] = {
    Icon = "Constraint_Rod"
};
v15[v6("BuilderTools", "Insert/ConstraintRope")] = {
    Icon = "Constraint_Rope"
};
v15[v6("BuilderTools", "Insert/ConstraintSpring")] = {
    Icon = "Constraint_Spring"
};
v15[v6("BuilderTools", "Insert/ConstraintTorque")] = {
    Icon = "Constraint_Torque"
};
v15[v6("BuilderTools", "Insert/ConstraintTorsionSpring")] = {
    Icon = "Constraint_TorsionSpring"
};
v15[v6("BuilderTools", "Insert/ConstraintUniversal")] = {
    Icon = "Constraint_Universal"
};
v15[v6("BuilderTools", "Insert/ConstraintVectorForce")] = {
    Icon = "Constraint_VectorForce"
};
v15[v6("BuilderTools", "Insert/ConstraintWeld")] = {
    Icon = "Constraint_WeldConstraint"
};
v15[v7("BuilderTools", "Collisions")] = {
    Size = "Small"
};
v15[v7("BuilderTools", "PivotSnap")] = {
    Size = "Small"
};
v15[v7("BuilderTools", "RotateGrid")] = {
    Size = "Small"
};
v15[v7("BuilderTools", "MoveGrid")] = {
    Size = "Small"
};
v15[v7("BuilderTools", "JoinSurfaces")] = {
    Size = "Small"
};
if v12 then
    v15[v7("Audio", "Main Volume")] = {
        Minimum = 0, 
        Maximum = 1
    };
end;
v14.GetModel = function(v20) --[[ Line: 1282 ]] --[[ Name: GetModel ]]
    -- upvalues: v15 (copy), v1 (copy)
    if v20 then
        return v15[v1.toString(v20)];
    else
        return nil;
    end;
end;
return v14;