local l_FirstAncestor_0 = script.Parent:FindFirstAncestor("AudioCompressorEditor");
local v1 = require(l_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useContext_0 = v1.useContext;
local v4 = require(l_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_Pane_0 = v4.UI.Pane;
local l_Checkbox_0 = v4.UI.Checkbox;
local v8 = v4.Util.LayoutOrderIterator.new();
local l_copy_0 = require(l_FirstAncestor_0.Packages.Dash).copy;
local _ = require(l_FirstAncestor_0.Src.Types);
return function(v11) --[[ Line: 33 ]] --[[ Name: TopControls ]]
    -- upvalues: l_useContext_0 (copy), l_ContextServices_0 (copy), l_useCallback_0 (copy), l_copy_0 (copy), v1 (copy), l_Checkbox_0 (copy), v8 (copy), l_Pane_0 (copy)
    local l_DataHook_0 = v11.DataHook;
    local v13 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v14 = l_useCallback_0(function() --[[ Line: 39 ]]
        -- upvalues: l_DataHook_0 (copy)
        l_DataHook_0.setBypass(not l_DataHook_0.bypass);
    end, {
        l_DataHook_0
    });
    local v17 = l_useCallback_0(function(v15) --[[ Line: 43 ]]
        -- upvalues: l_copy_0 (ref), v11 (copy)
        local v16 = l_copy_0(v11.DisplaySettings);
        v16[v15] = not v16[v15];
        if v11.SetDisplaySettings then
            v11.SetDisplaySettings(v16);
        end;
    end, {
        v11.DisplaySettings, 
        v11.SetDisplaySettings
    });
    local v18 = {};
    local function v20(v19) --[[ Line: 53 ]] --[[ Name: addBoolDisplaySetting ]]
        -- upvalues: v18 (copy), v1 (ref), l_Checkbox_0 (ref), v8 (ref), v13 (copy), v11 (copy), v17 (copy)
        v18[v19] = v1.createElement(l_Checkbox_0, {
            LayoutOrder = v8:getNextOrder(), 
            Text = v13:getText("Label", v19), 
            Checked = v11.DisplaySettings[v19], 
            OnClick = function() --[[ Line: 58 ]] --[[ Name: OnClick ]]
                -- upvalues: v17 (ref), v19 (copy)
                v17(v19);
            end
        });
    end;
    v18.Bypass = v1.createElement(l_Checkbox_0, {
        LayoutOrder = v8:getNextOrder(), 
        Text = v13:getText("Label", "Bypass"), 
        Checked = l_DataHook_0.bypass, 
        OnClick = v14
    });
    v18.Paused = v1.createElement("ImageButton", {
        LayoutOrder = v8:getNextOrder(), 
        Size = UDim2.fromOffset(25, 25), 
        Image = v11.DisplaySettings.IsPaused and "rbxasset://textures/AnimationEditor/button_control_play.png" or "rbxasset://textures/AnimationEditor/button_pause_white@2x.png", 
        [v1.Tag] = "TopButton", 
        [v1.Event.Activated] = function() --[[ Line: 78 ]]
            -- upvalues: v17 (copy)
            v17("IsPaused");
        end
    });
    v20("ShowEnvelope");
    v20("ShowInputWaveform");
    v20("ShowOutputWaveform");
    v20("ShowGainChange");
    if v11.DataHook.instanceType == "AudioCompressor" then
        v20("ShowSidechain");
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 25), 
        LayoutOrder = 1, 
        [v1.Tag] = "X-RowM"
    }, v18);
end;