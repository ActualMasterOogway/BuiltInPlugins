local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.RootContainerInputContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0 = v5.NUMBER_OF_HORIZONTAL_BARS_TRIGGER;
local v10 = 1 / (l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0 * 2);
local l_getFFlagEnableGrayHoverDeviceEmulator_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableGrayHoverDeviceEmulator;
local function _(v12, v13) --[[ Line: 33 ]] --[[ Name: calculateBarWidth ]]
    local v14 = 0.8472978603872034 / (v13 / 2);
    return 0.37 + 0.63 * (math.exp(v14 * (v12 - 1)) - 1) / (math.exp(v14 * (v13 - 1)) - 1);
end;
return v3.memo(function(v16) --[[ Line: 44 ]] --[[ Name: Trigger ]]
    -- upvalues: v3 (copy), v6 (copy), v7 (copy), l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0 (copy), l_CollectionService_0 (copy), l_StudioDeviceEmulator_0 (copy), l_getFFlagEnableGrayHoverDeviceEmulator_0 (copy), l_joinTags_0 (copy), v10 (copy), l_RunService_0 (copy)
    local v17 = v3.useContext(v6);
    local l_InputChanged_0 = v17.InputChanged;
    local l_InputEnded_0 = v17.InputEnded;
    local v20 = v3.useRef(nil);
    local v21 = v3.useRef(nil);
    local l_gamepadId_0 = v3.useContext(v7).gamepadId;
    local v23 = v3.useRef(nil);
    local v24 = v3.useRef({});
    local v25 = v3.useRef(nil);
    local v26 = v3.useRef(Vector3.zero);
    local v27, v28 = v3.useState(false);
    local v33 = v3.useCallback(function(v29) --[[ Line: 58 ]]
        -- upvalues: v26 (copy), l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0 (ref), v24 (copy), l_CollectionService_0 (ref)
        v26.current = v29;
        local v30 = math.floor(v29.Z * l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0);
        if not v24.current then
            return;
        else
            for v31 = 1, l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0 do
                local v32 = v24.current[v31];
                if v32 then
                    if v31 <= v30 and not l_CollectionService_0:HasTag(v32, "SelectedBlue") then
                        l_CollectionService_0:AddTag(v32, "SelectedBlue");
                    elseif v30 < v31 and l_CollectionService_0:HasTag(v32, "SelectedBlue") then
                        l_CollectionService_0:RemoveTag(v32, "SelectedBlue");
                    end;
                end;
            end;
            return;
        end;
    end, {});
    local v37 = v3.useCallback(function(v34) --[[ Line: 77 ]]
        -- upvalues: v25 (copy), v23 (copy), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v16 (copy), v33 (copy)
        if v25.current then
            v25.current:Disconnect();
            v25.current = nil;
        end;
        local _ = nil;
        local v36 = Vector3.new(0, 0, (math.clamp(if v34 and v23.current then (v34 - v23.current.AbsolutePosition.Y) / v23.current.AbsoluteSize.Y else 0, 0, 1)));
        pcall(function() --[[ Line: 91 ]]
            -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v16 (ref), v36 (copy)
            l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v16.keyCode, v36, Vector3.zero);
        end);
        v33(v36);
    end, {
        l_gamepadId_0, 
        v16.keyCode
    });
    v3.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: v33 (copy), v16 (copy)
        v33(v16.inputState or Vector3.new(0, 0, 0, 0));
    end, {
        v16.inputState
    });
    local v49 = v3.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: v27 (copy), l_getFFlagEnableGrayHoverDeviceEmulator_0 (ref), l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0 (ref), v3 (ref), l_joinTags_0 (ref), v10 (ref), v24 (copy)
        local v38 = {};
        local v39 = v27 and l_getFFlagEnableGrayHoverDeviceEmulator_0() and "Hover" or nil;
        for v40 = 1, l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0 do
            local v41 = "Bar" .. v40;
            local l_createElement_0 = v3.createElement;
            local v43 = "Frame";
            local v44 = {
                [v3.Tag] = l_joinTags_0("HorizontalBar", "data-testid=HorizontalBar", v39)
            };
            local l_new_0 = UDim2.new;
            local l_l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0_0 = l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0;
            local v47 = 0.8472978603872034 / (l_l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0_0 / 2);
            v44.Size = l_new_0(0.37 + 0.63 * (math.exp(v47 * (v40 - 1)) - 1) / (math.exp(v47 * (l_l_NUMBER_OF_HORIZONTAL_BARS_TRIGGER_0_0 - 1)) - 1), 0, v10, 0);
            v44.ref = function(v48) --[[ Line: 111 ]] --[[ Name: ref ]]
                -- upvalues: v24 (ref), v40 (copy)
                if v48 and v24.current then
                    v24.current[v40] = v48;
                end;
            end;
            v44.LayoutOrder = v40;
            v38[v41] = l_createElement_0(v43, v44);
        end;
        return v38;
    end, {
        v27
    });
    local v51 = v3.useCallback(function(v50) --[[ Line: 125 ]]
        -- upvalues: v37 (copy)
        if v50.UserInputType == Enum.UserInputType.MouseMovement then
            v37(v50.Position.Y);
        end;
    end, {
        v37
    });
    local v54 = v3.useCallback(function(v52) --[[ Line: 131 ]]
        -- upvalues: v20 (copy), v21 (copy), v25 (copy), l_RunService_0 (ref), v26 (copy), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v16 (copy), v33 (copy)
        if v52.UserInputType == Enum.UserInputType.MouseButton1 and v20.current ~= nil and v21.current ~= nil then
            v20.current:Disconnect();
            v20.current = nil;
            v21.current:Disconnect();
            v21.current = nil;
            v25.current = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 142 ]]
                -- upvalues: v26 (ref), v25 (ref), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v16 (ref), v33 (ref)
                if (not v26.current or v26.current.Z <= 0) and v25.current then
                    v25.current:Disconnect();
                    v25.current = nil;
                end;
                local v53 = Vector3.new(0, 0, (math.clamp(v26.current.Z - 0.15, 0, 1)));
                pcall(function() --[[ Line: 152 ]]
                    -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v16 (ref), v53 (copy)
                    l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v16.keyCode, v53, Vector3.zero);
                end);
                v33(v53);
            end);
        end;
    end, {
        v37, 
        v16.inputState
    });
    local v57 = v3.useCallback(function(_, v56) --[[ Line: 166 ]]
        -- upvalues: v20 (copy), l_InputChanged_0 (copy), l_InputEnded_0 (copy), v23 (copy), v37 (copy), v51 (copy), v21 (copy), v54 (copy)
        if v20.current == nil and l_InputChanged_0 ~= nil and l_InputEnded_0 ~= nil and v56.UserInputType == Enum.UserInputType.MouseButton1 and v23.current ~= nil then
            v37(v56.Position.Y);
            v20.current = l_InputChanged_0:Connect(v51);
            v21.current = l_InputEnded_0:Connect(v54);
        end;
    end, {
        v54, 
        v51, 
        v23.current, 
        v37
    });
    return v3.createElement("Frame", {
        Position = v16.Position, 
        Size = v16.Size, 
        [v3.Tag] = l_joinTags_0("TriggerFrame", "data-testid=TriggerFrame"), 
        ref = function(v58) --[[ Line: 187 ]] --[[ Name: ref ]]
            -- upvalues: v23 (copy)
            if v58 then
                v23.current = v58;
            end;
        end, 
        Visible = v16.Visible, 
        [v3.Event.InputBegan] = v57, 
        [v3.Event.MouseEnter] = l_getFFlagEnableGrayHoverDeviceEmulator_0() and function() --[[ Line: 195 ]]
            -- upvalues: v28 (copy)
            v28(true);
        end or nil, 
        [v3.Event.MouseLeave] = l_getFFlagEnableGrayHoverDeviceEmulator_0() and function() --[[ Line: 200 ]]
            -- upvalues: v28 (copy)
            v28(false);
        end or nil
    }, v49);
end);