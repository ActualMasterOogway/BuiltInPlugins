local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.RoactRodux);
local v4 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.ContextServices.WorldRootPhysics);
local v8 = require(l_Parent_1.Src.Actions.AddChange);
local v9 = require(l_Parent_0.Util.formatNumberForDisplay);
local v10 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v11 = require(l_Parent_0.Components.PresetsBar);
local v12 = require(l_Parent_0.Components.JumpSelect);
local v13 = require(l_Parent_0.Components.NumberInputRow);
local l_UI_0 = v4.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Separator_0 = l_UI_0.Separator;
local l_Name_0 = script.Name;
local function v29(v19, v20) --[[ Line: 43 ]] --[[ Name: loadSettings ]]
    local l_game_0 = v19:getState().Metadata.game;
    local l_worldRootPhysicsController_0 = v20.worldRootPhysicsController;
    return {
        function(v23) --[[ Line: 49 ]]
            -- upvalues: l_worldRootPhysicsController_0 (copy), l_game_0 (copy)
            v23.workspaceGravity = l_worldRootPhysicsController_0:getGravity(l_game_0);
        end, 
        function(v24) --[[ Line: 53 ]]
            -- upvalues: l_worldRootPhysicsController_0 (copy), l_game_0 (copy)
            v24.workspaceUseJumpPower = l_worldRootPhysicsController_0:getUseJumpPower(l_game_0);
        end, 
        function(v25) --[[ Line: 58 ]]
            -- upvalues: l_worldRootPhysicsController_0 (copy), l_game_0 (copy)
            v25.workspaceJumpPower = l_worldRootPhysicsController_0:getJumpPower(l_game_0);
        end, 
        function(v26) --[[ Line: 63 ]]
            -- upvalues: l_worldRootPhysicsController_0 (copy), l_game_0 (copy)
            v26.workspaceJumpHeight = l_worldRootPhysicsController_0:getJumpHeight(l_game_0);
        end, 
        function(v27) --[[ Line: 68 ]]
            -- upvalues: l_worldRootPhysicsController_0 (copy), l_game_0 (copy)
            v27.workspaceWalkSpeed = l_worldRootPhysicsController_0:getWalkspeed(l_game_0);
        end, 
        function(v28) --[[ Line: 73 ]]
            -- upvalues: l_worldRootPhysicsController_0 (copy), l_game_0 (copy)
            v28.workspaceMaxSlopeAngle = l_worldRootPhysicsController_0:getMaxSlopeAngle(l_game_0);
        end
    };
end;
local function v41(v30, v31) --[[ Line: 81 ]] --[[ Name: saveSettings ]]
    local v32 = v30:getState();
    local l_game_1 = v32.Metadata.game;
    local l_worldRootPhysicsController_1 = v31.worldRootPhysicsController;
    return {
        function() --[[ Line: 87 ]]
            -- upvalues: v32 (copy), l_worldRootPhysicsController_1 (copy), l_game_1 (copy)
            local l_workspaceUseJumpPower_0 = v32.Settings.Changed.workspaceUseJumpPower;
            if l_workspaceUseJumpPower_0 ~= nil then
                l_worldRootPhysicsController_1:setUseJumpPower(l_game_1, l_workspaceUseJumpPower_0);
            end;
            if l_worldRootPhysicsController_1:getUseJumpPower(l_game_1) then
                local l_workspaceJumpPower_0 = v32.Settings.Changed.workspaceJumpPower;
                if l_workspaceJumpPower_0 ~= nil then
                    l_worldRootPhysicsController_1:setJumpPower(l_game_1, l_workspaceJumpPower_0);
                    return;
                end;
            else
                local l_workspaceJumpHeight_0 = v32.Settings.Changed.workspaceJumpHeight;
                if l_workspaceJumpHeight_0 ~= nil then
                    l_worldRootPhysicsController_1:setJumpHeight(l_game_1, l_workspaceJumpHeight_0);
                end;
            end;
        end, 
        function() --[[ Line: 111 ]]
            -- upvalues: v32 (copy), l_worldRootPhysicsController_1 (copy), l_game_1 (copy)
            local l_workspaceGravity_0 = v32.Settings.Changed.workspaceGravity;
            if l_workspaceGravity_0 ~= nil then
                l_worldRootPhysicsController_1:setGravity(l_game_1, l_workspaceGravity_0);
            end;
        end, 
        function() --[[ Line: 118 ]]
            -- upvalues: v32 (copy), l_worldRootPhysicsController_1 (copy), l_game_1 (copy)
            local l_workspaceWalkSpeed_0 = v32.Settings.Changed.workspaceWalkSpeed;
            if l_workspaceWalkSpeed_0 ~= nil then
                l_worldRootPhysicsController_1:setWalkspeed(l_game_1, l_workspaceWalkSpeed_0);
            end;
        end, 
        function() --[[ Line: 125 ]]
            -- upvalues: v32 (copy), l_worldRootPhysicsController_1 (copy), l_game_1 (copy)
            local l_workspaceMaxSlopeAngle_0 = v32.Settings.Changed.workspaceMaxSlopeAngle;
            if l_workspaceMaxSlopeAngle_0 ~= nil then
                l_worldRootPhysicsController_1:setMaxSlopeAngle(l_game_1, l_workspaceMaxSlopeAngle_0);
            end;
        end
    };
end;
local function v44(v42, _) --[[ Line: 136 ]] --[[ Name: loadValuesToProps ]]
    return {
        WorkspaceUseJumpPower = v42("workspaceUseJumpPower"), 
        WorkspaceJumpPower = v42("workspaceJumpPower"), 
        WorkspaceJumpHeight = v42("workspaceJumpHeight"), 
        WorkspaceGravity = v42("workspaceGravity"), 
        WorkspaceWalkSpeed = v42("workspaceWalkSpeed"), 
        WorkspaceMaxSlopeAngle = v42("workspaceMaxSlopeAngle")
    };
end;
local function v46(v45) --[[ Line: 148 ]] --[[ Name: dispatchChanges ]]
    return {
        WorkspaceUseJumpPowerChanged = v45("workspaceUseJumpPower"), 
        WorkspaceJumpPowerChanged = v45("workspaceJumpPower"), 
        WorkspaceJumpHeightChanged = v45("workspaceJumpHeight"), 
        WorkspaceGravityChanged = v45("workspaceGravity"), 
        WorkspaceWalkSpeedChanged = v45("workspaceWalkSpeed"), 
        WorkspaceMaxSlopeAngleChanged = v45("workspaceMaxSlopeAngle")
    };
end;
local v47 = v2.PureComponent:extend("World");
v47.render = function(v48) --[[ Line: 161 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v11 (copy), l_Separator_0 (copy), v13 (copy), v9 (copy), v12 (copy), l_TitledFrame_0 (copy), l_TextLabel_0 (copy), v10 (copy), v29 (copy), v41 (copy), l_Name_0 (copy)
    local l_Localization_0 = v48.props.Localization;
    local function v75() --[[ Line: 165 ]] --[[ Name: createChildren ]]
        -- upvalues: v48 (copy), v2 (ref), v11 (ref), l_Separator_0 (ref), v13 (ref), v9 (ref), v12 (ref), l_TitledFrame_0 (ref), l_TextLabel_0 (ref)
        local l_props_0 = v48.props;
        local l_Localization_1 = l_props_0.Localization;
        local v52 = l_props_0.WorldRootPhysics:get();
        local v53 = l_props_0.WorkspaceGravity or 0;
        local l_WorkspaceGravityChanged_0 = l_props_0.WorkspaceGravityChanged;
        local l_WorkspaceUseJumpPower_0 = l_props_0.WorkspaceUseJumpPower;
        local l_WorkspaceUseJumpPowerChanged_0 = l_props_0.WorkspaceUseJumpPowerChanged;
        local v57 = l_props_0.WorkspaceWalkSpeed or 0;
        local l_WorkspaceWalkSpeedChanged_0 = l_props_0.WorkspaceWalkSpeedChanged;
        local v59 = l_props_0.WorkspaceMaxSlopeAngle or 0;
        local l_WorkspaceMaxSlopeAngleChanged_0 = l_props_0.WorkspaceMaxSlopeAngleChanged;
        local v61 = nil;
        local v62 = nil;
        local l_WorkspaceJumpPowerChanged_0 = l_props_0.WorkspaceJumpPowerChanged;
        local l_WorkspaceJumpHeightChanged_0 = l_props_0.WorkspaceJumpHeightChanged;
        if l_WorkspaceUseJumpPower_0 then
            v62 = l_props_0.WorkspaceJumpPower or 0;
            v61 = v52.calculateJumpHeight(v53, v62);
        else
            v61 = l_props_0.WorkspaceJumpHeight or 0;
            v62 = v52.calculateJumpPower(v53, v61);
        end;
        return {
            Presets = v2.createElement(v11, {
                LayoutOrder = 1, 
                ApplyPreset = function(v65) --[[ Line: 193 ]] --[[ Name: ApplyPreset ]]
                    -- upvalues: v53 (copy), v62 (ref), v57 (copy), v59 (copy), l_WorkspaceGravityChanged_0 (copy), l_WorkspaceUseJumpPowerChanged_0 (copy), l_WorkspaceJumpPowerChanged_0 (copy), l_WorkspaceJumpHeightChanged_0 (copy), v52 (copy), l_WorkspaceWalkSpeedChanged_0 (copy), l_WorkspaceMaxSlopeAngleChanged_0 (copy)
                    local v66 = v65.Gravity or v53;
                    local v67 = v65.JumpPower or v62;
                    local v68 = v65.Walkspeed or v57;
                    local v69 = v65.MaxSlopeAngle or v59;
                    l_WorkspaceGravityChanged_0(v66);
                    l_WorkspaceUseJumpPowerChanged_0(true);
                    l_WorkspaceJumpPowerChanged_0(v67);
                    l_WorkspaceJumpHeightChanged_0(v52.calculateJumpHeight(v66, v67));
                    l_WorkspaceWalkSpeedChanged_0(v68);
                    l_WorkspaceMaxSlopeAngleChanged_0(v69);
                end
            }), 
            Separator1 = v2.createElement(l_Separator_0, {
                LayoutOrder = 2
            }), 
            Gravity = v2.createElement(v13, {
                LayoutOrder = 3, 
                Title = l_Localization_1:getText("General", "TitleGravity"), 
                Label = l_Localization_1:getText("General", "GravityWorkspaceGravity"), 
                Value = v53, 
                MinValue = 0, 
                MaxValue = 1000, 
                OnUpdate = function(v70) --[[ Line: 220 ]] --[[ Name: OnUpdate ]]
                    -- upvalues: l_WorkspaceGravityChanged_0 (copy), l_WorkspaceUseJumpPower_0 (copy), l_WorkspaceJumpHeightChanged_0 (copy), v52 (copy), v62 (ref), l_WorkspaceJumpPowerChanged_0 (copy), v61 (ref)
                    l_WorkspaceGravityChanged_0(v70);
                    if l_WorkspaceUseJumpPower_0 then
                        l_WorkspaceJumpHeightChanged_0(v52.calculateJumpHeight(v70, v62));
                        return;
                    else
                        l_WorkspaceJumpPowerChanged_0(v52.calculateJumpPower(v70, v61));
                        return;
                    end;
                end, 
                UnitsFormatFunction = function(v71) --[[ Line: 228 ]] --[[ Name: UnitsFormatFunction ]]
                    -- upvalues: l_Localization_1 (copy), v9 (ref)
                    return l_Localization_1:getText("General", "UnitsMetersPerSecondSquared1", {
                        v9(v71)
                    });
                end
            }), 
            Separator2 = v2.createElement(l_Separator_0, {
                LayoutOrder = 4
            }), 
            JumpSelect = v2.createElement(v12, {
                LayoutOrder = 5, 
                UseJumpPower = l_WorkspaceUseJumpPower_0, 
                JumpPower = v62, 
                JumpHeight = v61, 
                SetUseJumpPower = l_WorkspaceUseJumpPowerChanged_0, 
                SetJumpPower = function(v72) --[[ Line: 247 ]] --[[ Name: SetJumpPower ]]
                    -- upvalues: l_WorkspaceJumpPowerChanged_0 (copy), l_WorkspaceJumpHeightChanged_0 (copy), v52 (copy), v53 (copy)
                    l_WorkspaceJumpPowerChanged_0(v72);
                    l_WorkspaceJumpHeightChanged_0(v52.calculateJumpHeight(v53, v72));
                end, 
                SetJumpHeight = function(v73) --[[ Line: 251 ]] --[[ Name: SetJumpHeight ]]
                    -- upvalues: l_WorkspaceJumpHeightChanged_0 (copy), l_WorkspaceJumpPowerChanged_0 (copy), v52 (copy), v53 (copy)
                    l_WorkspaceJumpHeightChanged_0(v73);
                    l_WorkspaceJumpPowerChanged_0(v52.calculateJumpPower(v53, v73));
                end
            }), 
            WalkSpeed = v2.createElement(v13, {
                LayoutOrder = 6, 
                Title = l_Localization_1:getText("General", "TitleWalk"), 
                Label = l_Localization_1:getText("General", "WalkSpeed"), 
                Value = v57, 
                MinValue = 0, 
                MaxValue = 1e999, 
                OnUpdate = l_WorkspaceWalkSpeedChanged_0, 
                UnitsFormatFunction = function(v74) --[[ Line: 266 ]] --[[ Name: UnitsFormatFunction ]]
                    -- upvalues: l_Localization_1 (copy), v9 (ref)
                    return l_Localization_1:getText("General", "UnitsMetersPerSecond1", {
                        v9(v74)
                    });
                end
            }), 
            JumpDistance = v2.createElement(l_TitledFrame_0, {
                LayoutOrder = 7, 
                Title = ""
            }, {
                JumpDistanceLabel = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 1, 
                    Style = "Normal", 
                    Text = l_Localization_1:getText("General", "JumpDistance")
                }), 
                JumpDistanceValue = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2, 
                    Style = "SubText", 
                    Text = v9(v52.calculateJumpDistance(v53, v62, v57))
                }), 
                JumpDistanceMetricValue = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 3, 
                    Style = "SubText", 
                    Text = l_Localization_1:getText("General", "UnitsMeters1", {
                        v9(v52.convertStudsToMeters(v52.calculateJumpDistance(v53, v62, v57)))
                    })
                })
            }), 
            MaxSlopeAngle = v2.createElement(v13, {
                LayoutOrder = 8, 
                Title = l_Localization_1:getText("General", "TitleSlope"), 
                Label = l_Localization_1:getText("General", "SlopeAngle"), 
                Value = v59, 
                MinValue = 0, 
                MaxValue = 89, 
                OnUpdate = l_WorkspaceMaxSlopeAngleChanged_0, 
                UnitsFormatFunction = nil
            })
        };
    end;
    return v2.createElement(v10, {
        SettingsLoadJobs = v29, 
        SettingsSaveJobs = v41, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v75
    });
end;
v47 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    WorldRootPhysics = v7
})(v47);
local v76 = require(l_Parent_1.Src.Networking.settingFromState);
v47 = v3.connect(function(v77, _) --[[ Line: 336 ]]
    -- upvalues: v76 (copy), v44 (copy)
    if not v77 then
        return;
    else
        return (v44(function(v79) --[[ Line: 340 ]]
            -- upvalues: v76 (ref), v77 (copy)
            return v76(v77.Settings, v79);
        end, v77));
    end;
end, function(v80) --[[ Line: 345 ]]
    -- upvalues: v8 (copy), v46 (copy)
    return (v46(function(v81) --[[ Line: 346 ]]
        -- upvalues: v80 (copy), v8 (ref)
        return function(v82) --[[ Line: 347 ]]
            -- upvalues: v80 (ref), v8 (ref), v81 (copy)
            v80(v8(v81, v82));
        end;
    end));
end)(v47);
v47.LocalizationId = l_Name_0;
return v47;