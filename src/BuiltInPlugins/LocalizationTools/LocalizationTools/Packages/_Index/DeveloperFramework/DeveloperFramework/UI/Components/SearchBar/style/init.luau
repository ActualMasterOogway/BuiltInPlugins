local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.Image);
local v2 = require(l_Parent_0.Util);
local v3 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v2.deepCopy;
local v5 = require(l_Parent_0.Util.StyleModifier);
local v6 = require(l_Parent_0.Style.StyleKey);
local v7 = require(l_Parent_0.UI.Components.UIFolderData);
local v8 = require(v7.RoundBox.style);
local function v13(v9, v10) --[[ Line: 14 ]] --[[ Name: buttonStyle ]]
    -- upvalues: v6 (copy), v1 (copy), v5 (copy), v3 (copy)
    local l_DialogMainButton_0 = v6.DialogMainButton;
    local v12 = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Color = Color3.fromRGB(184, 184, 184), 
        Image = v9, 
        Size = UDim2.new(0.6, 0, 0.6, 0), 
        ScaleType = Enum.ScaleType.Fit
    };
    return {
        Foreground = v1, 
        ForegroundStyle = v12, 
        [v5.Hover] = {
            ForegroundStyle = v3.Dictionary.join(v12, {
                Image = v10, 
                Color = l_DialogMainButton_0
            })
        }
    };
end;
local v14 = l_deepCopy_0(v8);
return {
    BackgroundColor = v6.InputFieldBackground, 
    BackgroundStyle = v14, 
    Padding = {
        Top = 3, 
        Left = 10, 
        Bottom = 3, 
        Right = 10
    }, 
    SearchIcon = "rbxasset://textures/StudioSharedUI/search.png", 
    IconColor = Color3.fromRGB(184, 184, 184), 
    IconWidth = 12, 
    IconOffset = 5, 
    [v5.Hover] = {
        BackgroundStyle = v3.Dictionary.join(v14, {
            BorderColor = v6.DialogMainButton
        })
    }, 
    Hover = {
        BorderColor = v6.DialogMainButton
    }, 
    Buttons = {
        Clear = v13("rbxasset://textures/StudioSharedUI/clear.png", "rbxasset://textures/StudioSharedUI/clear-hover.png"), 
        Search = v13("rbxasset://textures/StudioSharedUI/search.png")
    }, 
    ["&Compact"] = {
        Padding = {
            Top = -1, 
            Left = 5, 
            Bottom = -1, 
            Right = 5
        }, 
        TextSize = 14
    }
};