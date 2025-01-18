local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Packages.Dev.ReactTestingLibrary);
local v5 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
local l_render_0 = v4.render;
local l_screen_0 = v4.screen;
local l_Pane_0 = v1.UI.Pane;
local v9 = require(l_script_FirstAncestor_0.Src.Util.mockContext);
local v10 = require(l_script_FirstAncestor_0.Src.Components.App);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v27 = {
    MountApp = function(v14) --[[ Line: 25 ]] --[[ Name: MountApp ]]
        -- upvalues: v9 (copy), v2 (copy), l_Pane_0 (copy), v10 (copy), l_render_0 (copy)
        local v15 = v9({
            AppContainer = v2.createElement(l_Pane_0, {
                Size = UDim2.new(0, 500, 1, 0)
            }, {
                App = v2.createElement(v10)
            })
        }, v14);
        l_render_0(v15);
    end, 
    SelectTab = function(v16) --[[ Line: 37 ]] --[[ Name: SelectTab ]]
        -- upvalues: l_screen_0 (copy), v4 (copy)
        local l_Parent_0 = l_screen_0.getByText((("Studio.Test.Tabs.%*:[]"):format(v16))).Parent.Parent;
        v4.fireEvent.click(l_Parent_0);
    end, 
    SelectTool = function(v18) --[[ Line: 43 ]] --[[ Name: SelectTool ]]
        -- upvalues: l_screen_0 (copy), v4 (copy)
        local l_Parent_1 = l_screen_0.getByText((("Studio.Test.BaseTool.%*:[]"):format(v18))).Parent.Parent;
        v4.fireEvent.click(l_Parent_1);
    end, 
    UseBrush = function(v20, v21) --[[ Line: 49 ]] --[[ Name: UseBrush ]]
        v21._options = {
            cycles = 1
        };
        v20.Move:Fire();
        v21:startOperation({
            cycles = 1
        });
    end, 
    UseBrushWithMouse = function(v22, v23) --[[ Line: 60 ]] --[[ Name: UseBrushWithMouse ]]
        -- upvalues: v3 (copy)
        v22.Move:Fire();
        v22.Button1Down:Fire();
        v3.act(function() --[[ Line: 63 ]]
            -- upvalues: v23 (copy)
            v23._operation._budget = nil;
            wait(1);
        end);
        v22.Button1Up:Fire();
    end, 
    GetSettingsContainer = function(v24, v25) --[[ Line: 70 ]] --[[ Name: GetSettingsContainer ]]
        -- upvalues: l_screen_0 (copy)
        local l_Property_0 = l_screen_0.getByText((("Studio.Test.%*.%*:[]"):format(v24, v25))).Parent.Parent.Parent.Property;
        if l_Property_0:FindFirstChild("PropertyCell") then
            return l_Property_0.PropertyCell.Content;
        else
            return l_Property_0.Content;
        end;
    end
};
v27.SetNumber = function(v28, v29, v30) --[[ Line: 80 ]] --[[ Name: SetNumber ]]
    -- upvalues: v27 (copy), v4 (copy)
    local l_FirstChildWhichIsA_0 = v27.GetSettingsContainer(v28, v29):FindFirstChildWhichIsA("TextBox", true);
    l_FirstChildWhichIsA_0:CaptureFocus();
    v4.fireEvent.change(l_FirstChildWhichIsA_0, {
        target = {
            Text = tostring(v30)
        }
    });
    l_FirstChildWhichIsA_0:ReleaseFocus();
end;
v27.SetVector = function(v32, v33, v34) --[[ Line: 89 ]] --[[ Name: SetVector ]]
    -- upvalues: v27 (copy), v4 (copy)
    local l_Children_0 = v27.GetSettingsContainer(v32, v33):GetChildren();
    local v36 = {};
    for _, v38 in l_Children_0 do
        if v38:IsA("Frame") then
            table.insert(v36, v38:FindFirstChildWhichIsA("TextBox", true));
        end;
    end;
    table.sort(v36, function(v39, v40) --[[ Line: 100 ]]
        return v39.LayoutOrder < v40.LayoutOrder;
    end);
    v36[1]:CaptureFocus();
    v4.fireEvent.change(v36[1], {
        target = {
            Text = tostring(v34.X)
        }
    });
    v36[1]:ReleaseFocus();
    v36[2]:CaptureFocus();
    v4.fireEvent.change(v36[2], {
        target = {
            Text = tostring(v34.Y)
        }
    });
    v36[2]:ReleaseFocus();
    v36[3]:CaptureFocus();
    v4.fireEvent.change(v36[3], {
        target = {
            Text = tostring(v34.Z)
        }
    });
    v36[3]:ReleaseFocus();
end;
v27.SetTabbedEnum = function(v41, v42, v43) --[[ Line: 117 ]] --[[ Name: SetTabbedEnum ]]
    -- upvalues: v27 (copy), v4 (copy)
    local l_TextButton_0 = v27.GetSettingsContainer(v41, v42):FindFirstChild(v43, true).Contents.TextButton;
    v4.fireEvent.click(l_TextButton_0);
end;
v27.ToggleCheckbox = function(v45, v46) --[[ Line: 125 ]] --[[ Name: ToggleCheckbox ]]
    -- upvalues: v27 (copy), v4 (copy)
    local l_FirstChildWhichIsA_1 = v27.GetSettingsContainer(v45, v46):FindFirstChildWhichIsA("TextButton", true);
    v4.fireEvent.click(l_FirstChildWhichIsA_1);
end;
v27.SetMaterial = function(v48, v49, v50) --[[ Line: 132 ]] --[[ Name: SetMaterial ]]
    -- upvalues: v27 (copy), v4 (copy)
    for _, v52 in (v27.GetSettingsContainer(v48, v49):FindFirstChildWhichIsA("ScrollingFrame", true)) do
        if v52:FindFirstChildWhichIsA("MeshPart").Material == v50 then
            v4.fireEvent.click(v52);
        end;
    end;
end;
v27.SetDropdown = function(v53, v54, v55, v56) --[[ Line: 145 ]] --[[ Name: SetDropdown ]]
    -- upvalues: v27 (copy), v4 (copy), l_screen_0 (copy)
    local l_FirstChildWhichIsA_2 = v27.GetSettingsContainer(v53, v54):FindFirstChildWhichIsA("TextButton", true);
    v4.fireEvent.click(l_FirstChildWhichIsA_2);
    local l_FirstAncestorWhichIsA_0 = l_screen_0.getByText((("Studio.Test.%*.%*:[]"):format(v55, v56))):FindFirstAncestorWhichIsA("TextButton");
    v4.fireEvent.click(l_FirstAncestorWhichIsA_0);
end;
v27.OpenDropdown = function(v59, v60) --[[ Line: 160 ]] --[[ Name: OpenDropdown ]]
    -- upvalues: v27 (copy), v4 (copy)
    local l_FirstChildWhichIsA_3 = v27.GetSettingsContainer(v59, v60):FindFirstChildWhichIsA("TextButton", true);
    v4.fireEvent.click(l_FirstChildWhichIsA_3);
end;
v27.SetSlope = function(v62, v63, v64, v65) --[[ Line: 167 ]] --[[ Name: SetSlope ]]
    -- upvalues: v27 (copy), v4 (copy)
    local v66 = v27.GetSettingsContainer(v62, v63);
    local l_FirstChildWhichIsA_4 = v66:FindFirstChild("MinSlope", true):FindFirstChildWhichIsA("TextBox", true);
    local l_FirstChildWhichIsA_5 = v66:FindFirstChild("MaxSlope", true):FindFirstChildWhichIsA("TextBox", true);
    l_FirstChildWhichIsA_4:CaptureFocus();
    v4.fireEvent.change(l_FirstChildWhichIsA_4, {
        target = {
            Text = tostring(v64)
        }
    });
    l_FirstChildWhichIsA_4:ReleaseFocus();
    l_FirstChildWhichIsA_5:CaptureFocus();
    v4.fireEvent.change(l_FirstChildWhichIsA_5, {
        target = {
            Text = tostring(v65)
        }
    });
    l_FirstChildWhichIsA_5:ReleaseFocus();
end;
v27.MoveUpperKnob = function(v69) --[[ Line: 182 ]] --[[ Name: MoveUpperKnob ]]
    -- upvalues: l_screen_0 (copy), v5 (copy)
    local l_FirstChild_0 = l_screen_0.getByText("Studio.Test.Category.ElevationSettings:[]").Parent.Parent:FindFirstChild("UpperKnob", true);
    local l_AbsolutePosition_0 = l_FirstChild_0.AbsolutePosition;
    local l_AbsoluteSize_0 = l_FirstChild_0.AbsoluteSize;
    local v73 = l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2;
    local v74 = l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y / 2;
    v5.VirtualInput.Mouse.SendMouseMoveEvent(v73, v74);
    v5.VirtualInput.Mouse.sendMouseButtonEvent(v73, v74, 0, true, 0);
    v5.VirtualInput.Mouse.SendMouseMoveEvent(v73, v74 + v69);
    v5.VirtualInput.Mouse.sendMouseButtonEvent(v73, v74 + v69, 0, false, 0);
end;
v27.MoveLowerKnob = function(v75) --[[ Line: 197 ]] --[[ Name: MoveLowerKnob ]]
    -- upvalues: l_screen_0 (copy), v5 (copy)
    local l_FirstChild_1 = l_screen_0.getByText("Studio.Test.Category.ElevationSettings:[]").Parent.Parent:FindFirstChild("LowerKnob", true);
    local l_AbsolutePosition_1 = l_FirstChild_1.AbsolutePosition;
    local l_AbsoluteSize_1 = l_FirstChild_1.AbsoluteSize;
    local v79 = l_AbsolutePosition_1.X + l_AbsoluteSize_1.X / 2;
    local v80 = l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y / 2;
    v5.VirtualInput.Mouse.SendMouseMoveEvent(v79, v80);
    v5.VirtualInput.Mouse.sendMouseButtonEvent(v79, v80, 0, true, 0);
    v5.VirtualInput.Mouse.SendMouseMoveEvent(v79, v80 + v75);
    v5.VirtualInput.Mouse.sendMouseButtonEvent(v79, v80 + v75, 0, false, 0);
end;
v27.RemoveMaterial = function() --[[ Line: 212 ]] --[[ Name: RemoveMaterial ]]
    -- upvalues: l_screen_0 (copy), v4 (copy)
    local l_FirstChildWhichIsA_6 = l_screen_0.getByText("Studio.Test.Category.ElevationSettings:[]").Parent.Parent:FindFirstChild("Delete", true):FindFirstChildWhichIsA("TextButton", true);
    v4.fireEvent.click(l_FirstChildWhichIsA_6);
end;
v27.AddMaterial = function() --[[ Line: 221 ]] --[[ Name: AddMaterial ]]
    -- upvalues: l_screen_0 (copy), v4 (copy)
    local l_FirstChildWhichIsA_7 = l_screen_0.getByText("Studio.Test.Category.ElevationSettings:[]").Parent.Parent:FindFirstChild("AddMaterial", true):FindFirstChildWhichIsA("TextButton", true);
    v4.fireEvent.click(l_FirstChildWhichIsA_7);
end;
v27.ClickButton = function(v83, v84) --[[ Line: 230 ]] --[[ Name: ClickButton ]]
    -- upvalues: l_screen_0 (copy), v4 (copy)
    local l_FirstAncestorWhichIsA_1 = l_screen_0.getByText((("Studio.Test.%*.%*:[]"):format(v83, v84))):FindFirstAncestorWhichIsA("TextButton");
    v4.fireEvent.click(l_FirstAncestorWhichIsA_1);
end;
v27.ClickTerrainType = function(v86) --[[ Line: 236 ]] --[[ Name: ClickTerrainType ]]
    -- upvalues: l_screen_0 (copy), v4 (copy)
    local l_FirstAncestorWhichIsA_2 = l_screen_0.getByText((("Studio.Test.TerrainType.%*:[]"):format(v86))):FindFirstAncestorWhichIsA("TextButton");
    v4.fireEvent.click(l_FirstAncestorWhichIsA_2);
end;
v27.ClickPlacement = function(v88) --[[ Line: 242 ]] --[[ Name: ClickPlacement ]]
    v88.Move:Fire();
    v88.Button1Down:Fire();
    v88.Button1Up:Fire();
end;
v27.ScrollUp = function() --[[ Line: 248 ]] --[[ Name: ScrollUp ]]
    -- upvalues: v3 (copy), v5 (copy), l_VirtualInputManager_0 (copy)
    v3.act(function() --[[ Line: 249 ]]
        -- upvalues: v5 (ref), l_VirtualInputManager_0 (ref)
        v5.VirtualInput.Mouse.SendMouseWheelEvent(350, 150, true);
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v27.ScrollDown = function() --[[ Line: 255 ]] --[[ Name: ScrollDown ]]
    -- upvalues: v3 (copy), v5 (copy), l_VirtualInputManager_0 (copy)
    v3.act(function() --[[ Line: 256 ]]
        -- upvalues: v5 (ref), l_VirtualInputManager_0 (ref)
        v5.VirtualInput.Mouse.SendMouseWheelEvent(350, 150, false);
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v27.ToggleControl = function() --[[ Line: 262 ]] --[[ Name: ToggleControl ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), v5 (copy), l_VirtualInputManager_0 (copy)
    v3.act(function() --[[ Line: 263 ]]
        -- upvalues: l_UserInputService_0 (ref), v5 (ref), l_VirtualInputManager_0 (ref)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) then
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.LeftControl);
        else
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.LeftControl);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v27.ToggleShift = function() --[[ Line: 273 ]] --[[ Name: ToggleShift ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), v5 (copy), l_VirtualInputManager_0 (copy)
    v3.act(function() --[[ Line: 274 ]]
        -- upvalues: l_UserInputService_0 (ref), v5 (ref), l_VirtualInputManager_0 (ref)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) then
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.LeftShift);
        else
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.LeftShift);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v27.ToggleAlt = function() --[[ Line: 284 ]] --[[ Name: ToggleAlt ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), v5 (copy), l_VirtualInputManager_0 (copy)
    v3.act(function() --[[ Line: 285 ]]
        -- upvalues: l_UserInputService_0 (ref), v5 (ref), l_VirtualInputManager_0 (ref)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) then
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.LeftAlt);
        else
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.LeftAlt);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v27.ToggleB = function() --[[ Line: 295 ]] --[[ Name: ToggleB ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), v5 (copy), l_VirtualInputManager_0 (copy)
    v3.act(function() --[[ Line: 296 ]]
        -- upvalues: l_UserInputService_0 (ref), v5 (ref), l_VirtualInputManager_0 (ref)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) then
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.B);
        else
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.B);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v27.HitKey = function(v89) --[[ Line: 306 ]] --[[ Name: HitKey ]]
    -- upvalues: v3 (copy), v5 (copy)
    v3.act(function() --[[ Line: 307 ]]
        -- upvalues: v5 (ref), v89 (copy)
        v5.VirtualInput.Keyboard.hitKey(v89);
    end);
end;
return v27;