local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Resources_0 = l_script_FirstAncestor_0.Src.Resources;
local v4 = v2.Util.LayoutOrderIterator.new();
local v5 = require(l_script_FirstAncestor_0.Src.Components.ControlsWidgets.Button);
local v6 = require(l_script_FirstAncestor_0.Src.Components.ControlsWidgets.Thumbstick);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ControlsWidgets.Trigger);
local v8 = require(l_script_FirstAncestor_0.Src.Components.MappingsWidgets.CrossLayoutMappings);
local v9 = require(l_script_FirstAncestor_0.Src.Components.MappingsWidgets.ButtonMapping);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 = v10.THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK;
local v12 = require(l_script_FirstAncestor_0.Packages.Dash);
local v13 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ThemeSwitcher_0 = v2.Style.ThemeSwitcher;
local l_joinTags_0 = v2.Styling.joinTags;
local v16 = {
    selectedGamepadId = 101, 
    LayoutOrder = nil, 
    activeInputs = {}, 
    displayMappings = false
};
local v17 = {
    Generic = require(l_Resources_0.DeviceControlData.Generic), 
    PS4 = require(l_Resources_0.DeviceControlData.Playstation4), 
    PS5 = require(l_Resources_0.DeviceControlData.Playstation5), 
    XboxOne = require(l_Resources_0.DeviceControlData.XBox), 
    Quest2 = require(l_Resources_0.DeviceControlData.Quest2), 
    Quest3 = require(l_Resources_0.DeviceControlData.Quest3)
};
return v1.memo(function(v18) --[[ Line: 50 ]] --[[ Name: DeviceBlueprint ]]
    -- upvalues: v13 (copy), v16 (copy), v1 (copy), l_ThemeSwitcher_0 (copy), v10 (copy), v17 (copy), l_joinTags_0 (copy), v4 (copy), v12 (copy), v6 (copy), l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 (copy), v5 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v19 = v13.Dictionary.join(v16, v18);
    local v20, v21 = v1.useState(l_ThemeSwitcher_0.getThemeName());
    local v22, v23 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v21 (copy), l_ThemeSwitcher_0 (ref), v23 (copy)
        local v24 = nil;
        pcall(function() --[[ Line: 59 ]]
            -- upvalues: v24 (ref), v21 (ref), l_ThemeSwitcher_0 (ref)
            v24 = settings().Studio.ThemeChanged:Connect(function() --[[ Line: 60 ]]
                -- upvalues: v21 (ref), l_ThemeSwitcher_0 (ref)
                v21(l_ThemeSwitcher_0.getThemeName());
            end);
        end);
        task.delay(0.1, function() --[[ Line: 67 ]]
            -- upvalues: v23 (ref)
            v23(true);
        end);
        return function() --[[ Line: 71 ]]
            -- upvalues: v24 (ref)
            v24:disconnect();
        end;
    end, {
        v21, 
        v23
    });
    local v25 = v17[v10.GAMEPAD_ID_TO_TYPE[v19.selectedGamepadId]];
    local l_createElement_0 = v1.createElement;
    local v27 = "Frame";
    local v28 = {
        [v1.Tag] = "Component-DeviceBlueprint Width-Scaling CX-Invisible", 
        LayoutOrder = v19.LayoutOrder
    };
    local v29 = {};
    local l_createElement_1 = v1.createElement;
    local v31 = "Frame";
    local v32 = {
        [v1.Tag] = l_joinTags_0("Width-Scaling", v19.displayMappings and "Mappings-Visible" or nil)
    };
    local v33 = {};
    local v34 = false;
    if v25 ~= nil then
        v34 = v22 and v1.createElement("ImageLabel", {
            [v1.Tag] = "Width-Scaling CX-Invisible", 
            Image = if v20 == "Dark" then v25.DeviceImage.srcDark else v25.DeviceImage.srcLight, 
            LayoutOrder = v4:getNextOrder()
        });
    end;
    v33.GamepadBlueprint = v34;
    v34 = false;
    if v25 ~= nil then
        v34 = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            [v1.Tag] = "Width-Scaling", 
            LayoutOrder = v4:getNextOrder()
        }, v12.map(v12.filter(v13.Dictionary.join({}, v25), function(v35) --[[ Line: 101 ]]
            return v35.keyCode ~= nil;
        end), function(v36) --[[ Line: 104 ]]
            -- upvalues: v1 (ref), v6 (ref), v19 (copy), l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 (ref), v5 (ref), v7 (ref)
            if v36.type == "Thumbstick" then
                return {
                    Thumbstick = v1.createElement(v6, {
                        Position = v36.Position, 
                        keyCode = v36.keyCode, 
                        inputState = v19.activeInputs[v36.keyCode], 
                        clickInputState = v19.activeInputs[l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0[v36.keyCode]], 
                        relativeSocketSize = v36.relativeSocketSize, 
                        relativeStickSize = v36.relativeStickSize
                    })
                };
            elseif v36.type == "Button" then
                return {
                    Button = v1.createElement(v5, {
                        Position = v36.Position, 
                        Size = v36.Size, 
                        keyCode = v36.keyCode, 
                        inputState = v19.activeInputs[v36.keyCode]
                    })
                };
            elseif v36.type == "Trigger" then
                return {
                    Trigger = v1.createElement(v7, {
                        Position = v36.Position, 
                        Size = v36.Size, 
                        keyCode = v36.keyCode, 
                        inputState = v19.activeInputs[v36.keyCode], 
                        Visible = v19.displayMappings
                    })
                };
            else
                return nil;
            end;
        end));
    end;
    v33.GamepadControls = v34;
    v33.LabelsOverlay = if v19.displayMappings and v25 ~= nil then v1.createElement("Frame", {
        [v1.Tag] = "Width-Scaling", 
        BackgroundTransparency = 1, 
        LayoutOrder = v4:getNextOrder(), 
        Interactable = false
    }, {
        v12.map(v12.filter(v13.Dictionary.join({}, v25), function(v37) --[[ Line: 149 ]]
            return v37.arrowDestination ~= nil;
        end), function(v38) --[[ Line: 152 ]]
            -- upvalues: v1 (ref), v8 (ref), v9 (ref)
            if v38.type == "CrossLayoutMappings" then
                return v1.createElement(v8, {
                    upKeyName = v38.upKeyName, 
                    downKeyName = v38.downKeyName, 
                    leftKeyName = v38.leftKeyName, 
                    rightKeyName = v38.rightKeyName, 
                    centerKeyName = v38.centerKeyName, 
                    Position = v38.Position, 
                    arrowDestination = v38.arrowDestination, 
                    arrowBendPoint = v38.arrowBendPoint, 
                    side = v38.side
                });
            elseif v38.type == "ButtonMapping" then
                return v1.createElement(v9, {
                    Position = v38.Position, 
                    keyName = v38.keyName, 
                    side = v38.side, 
                    arrowStart = v38.Position, 
                    arrowDestination = v38.arrowDestination, 
                    arrowBendPoint = v38.arrowBendPoint
                });
            else
                return nil;
            end;
        end)
    }) else nil;
    v29.ControllerLayout = l_createElement_1(v31, v32, v33);
    return l_createElement_0(v27, v28, v29);
end);