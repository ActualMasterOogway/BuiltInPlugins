local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.SetDefaultEulerAnglesOrder);
local v7 = require(l_Actions_0.SetDefaultRotationType);
local v8 = require(l_Actions_0.SetFrameRate);
local v9 = require(l_Actions_0.SetGridSpeed);
local v10 = require(l_Actions_0.SetShowAsSeconds);
local v11 = require(l_Actions_0.SetShowEvents);
local v12 = require(l_Actions_0.SetSnapMode);
local v13 = require(l_Actions_0.SetTimelineUnit);
local v14 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.SetPlaybackSpeed);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v17 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v18 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridSpeed);
local v19 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v20 = v1.PureComponent:extend("SettingsMenu");
v20.makeTimelineUnitMenu = function(v21) --[[ Line: 69 ]] --[[ Name: makeTimelineUnitMenu ]]
    -- upvalues: v19 (copy), v17 (copy)
    local l_props_0 = v21.props;
    local l_Localization_0 = l_props_0.Localization;
    local v24 = l_props_0.Plugin:get();
    if v19() then
        local function v26(v25) --[[ Line: 75 ]] --[[ Name: onItemClicked ]]
            -- upvalues: v24 (copy), v17 (ref), l_props_0 (copy)
            v24:SetSetting(v17.SETTINGS.TimelineUnit, v25.Data);
            l_props_0.SetTimelineUnit(v25.Data);
            l_props_0.Analytics:report("onTimeUnitChanged", v25.Data);
        end;
        local v27 = {
            Text = l_Localization_0:getText("Settings", "TimelineUnit")
        };
        for _, v29 in v17.TIMELINE_UNITS_ORDER do
            table.insert(v27, {
                Data = v17.TIMELINE_UNITS[v29], 
                Text = l_Localization_0:getText("Settings", v17.TIMELINE_UNITS[v29]), 
                Checked = l_props_0.TimelineUnit == v29, 
                OnItemClicked = v26
            });
        end;
        return v27;
    else
        local function v32(v30) --[[ Line: 94 ]] --[[ Name: onItemClicked ]]
            -- upvalues: v17 (ref), v24 (copy), l_props_0 (copy)
            local v31 = v30.Data == v17.TIMELINE_UNITS.Seconds;
            v24:SetSetting(v17.SETTINGS.ShowAsSeconds, v31);
            l_props_0.SetShowAsSeconds(v31);
            l_props_0.Analytics:report("onTimeUnitChanged", v30.Data);
        end;
        return {
            Text = l_Localization_0:getText("Settings", "TimelineUnit"); 
            {
                Data = v17.TIMELINE_UNITS.Seconds, 
                Text = l_Localization_0:getText("Settings", "Seconds"), 
                Checked = l_props_0.ShowAsSeconds, 
                OnItemClicked = v32
            }, 
            {
                Data = v17.TIMELINE_UNITS.Frames, 
                Text = l_Localization_0:getText("Settings", "Frames"), 
                Checked = not l_props_0.ShowAsSeconds, 
                OnItemClicked = v32
            }
        };
    end;
end;
v20.makePlaybackSpeedMenu = function(v33) --[[ Line: 119 ]] --[[ Name: makePlaybackSpeedMenu ]]
    -- upvalues: v17 (copy)
    local l_props_1 = v33.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_PlaybackSpeed_0 = l_props_1.PlaybackSpeed;
    local v37 = false;
    for _, v39 in pairs(v17.PLAYBACK_SPEEDS) do
        if v39 ~= v17.PLAYBACK_SPEEDS.CUSTOM and l_PlaybackSpeed_0 == v39 then
            v37 = true;
            break;
        end;
    end;
    local function v41(v40) --[[ Line: 132 ]] --[[ Name: onItemClicked ]]
        -- upvalues: l_props_1 (copy)
        l_props_1.SetPlaybackSpeed(v40.Data);
    end;
    return {
        Text = l_Localization_1:getText("Settings", "PlaybackSpeed") .. ": " .. string.format("%.2f", l_PlaybackSpeed_0):gsub("%.?0+$", "") .. "x"; 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_025, 
            Text = l_Localization_1:getText("Settings", "025x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_025, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_05, 
            Text = l_Localization_1:getText("Settings", "05x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_05, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_1, 
            Text = l_Localization_1:getText("Settings", "1x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_1, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_2, 
            Text = l_Localization_1:getText("Settings", "2x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_2, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_4, 
            Text = l_Localization_1:getText("Settings", "4x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_4, 
            OnItemClicked = v41
        }, 
        {
            Text = l_Localization_1:getText("Settings", "CustomPlaybackSpeed") .. "...", 
            Checked = not v37, 
            OnItemClicked = function() --[[ Line: 136 ]] --[[ Name: onCustomClicked ]]
                -- upvalues: l_props_1 (copy)
                if l_props_1.OnChangePlaybackSpeed then
                    l_props_1.OnChangePlaybackSpeed();
                end;
            end
        }
    };
end;
v20.makeFrameRateMenu = function(v42) --[[ Line: 184 ]] --[[ Name: makeFrameRateMenu ]]
    -- upvalues: v17 (copy)
    local l_props_2 = v42.props;
    local l_Localization_2 = l_props_2.Localization;
    local l_AnimationData_0 = l_props_2.AnimationData;
    if not l_AnimationData_0 or not l_AnimationData_0.Metadata then
        return {
            Text = l_Localization_2:getText("Settings", "FrameRate"), 
            Enabled = false
        };
    else
        local l_FrameRate_0 = l_props_2.FrameRate;
        local v47 = false;
        for _, v49 in pairs(v17.FRAMERATES) do
            if v49 ~= v17.FRAMERATES.CUSTOM and v49 == l_FrameRate_0 then
                v47 = true;
                break;
            end;
        end;
        local function v51(v50) --[[ Line: 205 ]] --[[ Name: onItemClicked ]]
            -- upvalues: l_props_2 (copy)
            l_props_2.SetFrameRate(v50.Data);
        end;
        return {
            Text = l_Localization_2:getText("Settings", "FrameRate") .. ": " .. l_FrameRate_0 .. " fps", 
            Enabled = false; 
            {
                Data = v17.FRAMERATES.FPS_24, 
                Text = l_Localization_2:getText("Settings", "24FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_24, 
                OnItemClicked = v51
            }, 
            {
                Data = v17.FRAMERATES.FPS_30, 
                Text = l_Localization_2:getText("Settings", "30FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_30, 
                OnItemClicked = v51
            }, 
            {
                Data = v17.FRAMERATES.FPS_60, 
                Text = l_Localization_2:getText("Settings", "60FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_60, 
                OnItemClicked = v51
            }, 
            {
                Data = v17.FRAMERATES.FPS_120, 
                Text = l_Localization_2:getText("Settings", "120FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_120, 
                OnItemClicked = v51
            }, 
            {
                Text = l_Localization_2:getText("Settings", "CustomFPS") .. "...", 
                Checked = not v47, 
                OnItemClicked = function() --[[ Line: 209 ]] --[[ Name: onCustomClicked ]]
                    -- upvalues: l_props_2 (copy)
                    if l_props_2.OnChangeFPS then
                        l_props_2.OnChangeFPS();
                    end;
                end
            }
        };
    end;
end;
v20.makeGridSpeedMenu = function(v52) --[[ Line: 250 ]] --[[ Name: makeGridSpeedMenu ]]
    -- upvalues: v17 (copy)
    local l_props_3 = v52.props;
    local l_Localization_3 = l_props_3.Localization;
    local _ = l_props_3.AnimationData;
    local l_GridSpeed_0 = l_props_3.GridSpeed;
    local v57 = true;
    for _, v59 in pairs(v17.GRIDSPEEDS) do
        if v59 == l_GridSpeed_0 and v59 ~= v17.GRIDSPEEDS.Custom then
            v57 = false;
        end;
    end;
    local function v61(v60) --[[ Line: 264 ]] --[[ Name: onItemClicked ]]
        -- upvalues: l_props_3 (copy)
        l_props_3.SetGridSpeed(v60.Data);
    end;
    local function v62() --[[ Line: 268 ]] --[[ Name: onCustomClicked ]]
        -- upvalues: l_props_3 (copy)
        if l_props_3.OnChangeGridSpeed then
            l_props_3.OnChangeGridSpeed();
        end;
    end;
    local l_l_GridSpeed_0_0 = l_GridSpeed_0;
    local v64 = l_props_3.RootInstance and l_props_3.RootInstance:FindFirstChildOfClass("Humanoid");
    if l_l_GridSpeed_0_0 == v17.GRIDSPEEDS.FromRig then
        l_l_GridSpeed_0_0 = if v64 then v64.WalkSpeed else 0;
    end;
    local v65 = {
        Text = l_Localization_3:getText("Settings", "GridSpeed", {
            speed = l_l_GridSpeed_0_0
        }), 
        Enabled = false; 
        {
            Data = v17.GRIDSPEEDS.Static, 
            Text = l_Localization_3:getText("Settings", "GridSpeedStatic"), 
            Checked = l_GridSpeed_0 == v17.GRIDSPEEDS.Static, 
            OnItemClicked = v61
        }, 
        {
            Data = v17.GRIDSPEEDS.Default, 
            Text = l_Localization_3:getText("Settings", "GridSpeedDefault"), 
            Checked = l_GridSpeed_0 == v17.GRIDSPEEDS.Default, 
            OnItemClicked = v61
        }
    };
    if v64 then
        table.insert(v65, {
            Data = v17.GRIDSPEEDS.FromRig, 
            Text = l_Localization_3:getText("Settings", "GridSpeedFromRig"), 
            Checked = l_GridSpeed_0 == v17.GRIDSPEEDS.FromRig, 
            OnItemClicked = v61
        });
    end;
    table.insert(v65, {
        Data = v17.GRIDSPEEDS.Custom, 
        Text = l_Localization_3:getText("Settings", "GridSpeedCustom"), 
        Checked = v57, 
        OnItemClicked = v62
    });
    return v65;
end;
v20.makeSnapMenu = function(v66) --[[ Line: 317 ]] --[[ Name: makeSnapMenu ]]
    -- upvalues: v17 (copy)
    local l_props_4 = v66.props;
    local l_Localization_4 = l_props_4.Localization;
    local v69 = l_props_4.Plugin:get();
    local l_SnapMode_0 = l_props_4.SnapMode;
    local function v72(v71) --[[ Line: 323 ]] --[[ Name: onItemClicked ]]
        -- upvalues: v69 (copy), v17 (ref), l_props_4 (copy)
        v69:SetSetting(v17.SETTINGS.SnapMode, v71.Data);
        l_props_4.SetSnapMode(v71.Data);
    end;
    return {
        Text = l_Localization_4:getText("Settings", "SnapMode"); 
        {
            Data = v17.SNAP_MODES.Keyframes, 
            Text = l_Localization_4:getText("Settings", "SnapKeyframes"), 
            Checked = l_SnapMode_0 == v17.SNAP_MODES.Keyframes, 
            OnItemClicked = v72
        }, 
        {
            Data = v17.SNAP_MODES.Frames, 
            Text = l_Localization_4:getText("Settings", "SnapFrames"), 
            Checked = l_SnapMode_0 == v17.SNAP_MODES.Frames, 
            OnItemClicked = v72
        }, 
        {
            Data = v17.SNAP_MODES.None, 
            Text = l_Localization_4:getText("Settings", "SnapNone"), 
            Checked = l_SnapMode_0 == v17.SNAP_MODES.None, 
            OnItemClicked = v72
        }
    };
end;
v20.makeDefaultRotationTypeMenu = function(v73) --[[ Line: 351 ]] --[[ Name: makeDefaultRotationTypeMenu ]]
    -- upvalues: v17 (copy)
    local l_props_5 = v73.props;
    local l_Localization_5 = l_props_5.Localization;
    local v76 = l_props_5.Plugin:get();
    local l_DefaultRotationType_0 = l_props_5.DefaultRotationType;
    local function v79(v78) --[[ Line: 357 ]] --[[ Name: onItemClicked ]]
        -- upvalues: v76 (copy), v17 (ref), l_props_5 (copy)
        v76:SetSetting(v17.SETTINGS.RotationType, v78.Data);
        l_props_5.SetDefaultRotationType(v78.Data);
    end;
    return {
        Text = l_Localization_5:getText("Settings", "DefaultRotationType"); 
        {
            Data = v17.TRACK_TYPES.EulerAngles, 
            Text = l_Localization_5:getText("Settings", "EulerAngles"), 
            Checked = l_DefaultRotationType_0 == v17.TRACK_TYPES.EulerAngles, 
            OnItemClicked = v79
        }, 
        {
            Data = v17.TRACK_TYPES.Quaternion, 
            Text = l_Localization_5:getText("Settings", "Quaternions"), 
            Checked = l_DefaultRotationType_0 == v17.TRACK_TYPES.Quaternion, 
            OnItemClicked = v79
        }
    };
end;
v20.makeEulerAnglesOrderMenu = function(v80) --[[ Line: 379 ]] --[[ Name: makeEulerAnglesOrderMenu ]]
    -- upvalues: v17 (copy)
    local l_props_6 = v80.props;
    local l_Localization_6 = l_props_6.Localization;
    local v83 = l_props_6.Plugin:get();
    local l_DefaultEulerAnglesOrder_0 = l_props_6.DefaultEulerAnglesOrder;
    local function v86(v85) --[[ Line: 385 ]] --[[ Name: onItemClicked ]]
        -- upvalues: v83 (copy), v17 (ref), l_props_6 (copy)
        v83:SetSetting(v17.SETTINGS.EulerAnglesOrder, v85.Data);
        l_props_6.SetDefaultEulerAnglesOrder(v85.Data);
    end;
    return {
        Text = l_Localization_6:getText("Settings", "DefaultEulerAnglesOrder"); 
        {
            Data = Enum.RotationOrder.XYZ, 
            Text = l_Localization_6:getText("Settings", "XYZ"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.XYZ, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.XZY, 
            Text = l_Localization_6:getText("Settings", "XZY"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.XZY, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.YXZ, 
            Text = l_Localization_6:getText("Settings", "YXZ"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.YXZ, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.YZX, 
            Text = l_Localization_6:getText("Settings", "YZX"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.YZX, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.ZXY, 
            Text = l_Localization_6:getText("Settings", "ZXY"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.ZXY, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.ZYX, 
            Text = l_Localization_6:getText("Settings", "ZYX"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.ZYX, 
            OnItemClicked = v86
        }
    };
end;
v20.makeShowEvents = function(v87) --[[ Line: 431 ]] --[[ Name: makeShowEvents ]]
    local l_props_7 = v87.props;
    return {
        Text = l_props_7.Localization:getText("Settings", "ShowEvents"), 
        Checked = l_props_7.ShowEvents, 
        OnItemClicked = function() --[[ Line: 435 ]] --[[ Name: onItemClicked ]]
            -- upvalues: l_props_7 (copy)
            l_props_7.SetShowEvents(not l_props_7.ShowEvents);
        end
    };
end;
v20.makeMenuActions = function(v89) --[[ Line: 446 ]] --[[ Name: makeMenuActions ]]
    -- upvalues: v18 (copy), v17 (copy)
    if v18() then
        return {
            v89:makeTimelineUnitMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeFrameRateMenu(), 
            v89:makePlaybackSpeedMenu(), 
            v89:makeGridSpeedMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeShowEvents(), 
            v89:makeSnapMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeDefaultRotationTypeMenu(), 
            v89:makeEulerAnglesOrderMenu()
        };
    else
        return {
            v89:makeTimelineUnitMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeFrameRateMenu(), 
            v89:makePlaybackSpeedMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeShowEvents(), 
            v89:makeSnapMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeDefaultRotationTypeMenu(), 
            v89:makeEulerAnglesOrderMenu()
        };
    end;
end;
v20.render = function(v90) --[[ Line: 477 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v14 (copy)
    local l_props_8 = v90.props;
    return l_props_8.ShowMenu and v1.createElement(v14, {
        Actions = v90:makeMenuActions(), 
        OnMenuOpened = l_props_8.OnMenuOpened
    }) or nil;
end;
local function v94(v92) --[[ Line: 489 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v19 (copy)
    local l_Status_0 = v92.Status;
    return {
        Analytics = v92.Analytics, 
        AnimationData = v92.AnimationData, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        FrameRate = l_Status_0.FrameRate, 
        GridSpeed = l_Status_0.GridSpeed, 
        PlaybackSpeed = l_Status_0.PlaybackSpeed, 
        RootInstance = l_Status_0.RootInstance, 
        ShowAsSeconds = if v19() then nil else l_Status_0.ShowAsSeconds, 
        ShowEvents = l_Status_0.ShowEvents, 
        SnapMode = l_Status_0.SnapMode, 
        TimelineUnit = l_Status_0.TimelineUnit
    };
end;
local function v105(v95) --[[ Line: 510 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy), v7 (copy), v8 (copy), v9 (copy), v15 (copy), v19 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy)
    return {
        SetDefaultEulerAnglesOrder = function(v96) --[[ Line: 512 ]] --[[ Name: SetDefaultEulerAnglesOrder ]]
            -- upvalues: v95 (copy), v6 (ref)
            v95(v6(v96));
        end, 
        SetDefaultRotationType = function(v97) --[[ Line: 516 ]] --[[ Name: SetDefaultRotationType ]]
            -- upvalues: v95 (copy), v7 (ref)
            v95(v7(v97));
        end, 
        SetFrameRate = function(v98) --[[ Line: 520 ]] --[[ Name: SetFrameRate ]]
            -- upvalues: v95 (copy), v8 (ref)
            v95(v8(v98));
        end, 
        SetGridSpeed = function(v99) --[[ Line: 524 ]] --[[ Name: SetGridSpeed ]]
            -- upvalues: v95 (copy), v9 (ref)
            v95(v9(v99));
        end, 
        SetPlaybackSpeed = function(v100) --[[ Line: 528 ]] --[[ Name: SetPlaybackSpeed ]]
            -- upvalues: v95 (copy), v15 (ref)
            v95(v15(v100));
        end, 
        SetShowAsSeconds = if v19() then nil else function(v101) --[[ Line: 534 ]]
            -- upvalues: v95 (copy), v10 (ref)
            v95(v10(v101));
        end, 
        SetShowEvents = function(v102) --[[ Line: 538 ]] --[[ Name: SetShowEvents ]]
            -- upvalues: v95 (copy), v11 (ref)
            v95(v11(v102));
        end, 
        SetSnapMode = function(v103) --[[ Line: 542 ]] --[[ Name: SetSnapMode ]]
            -- upvalues: v95 (copy), v12 (ref)
            v95(v12(v103));
        end, 
        SetTimelineUnit = function(v104) --[[ Line: 546 ]] --[[ Name: SetTimelineUnit ]]
            -- upvalues: v95 (copy), v13 (ref)
            v95(v13(v104));
        end
    };
end;
v20 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin
})(v20);
return v2.connect(v94, v105)(v20);