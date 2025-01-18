local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v1.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function(v13) --[[ Line: 33 ]] --[[ Name: AvatarCell ]]
    -- upvalues: v3 (copy), l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), v2 (copy), l_Button_0 (copy), l_Pane_0 (copy), l_AssetRenderModel_0 (copy), l_TextLabel_0 (copy)
    local v14 = v3:use():get();
    local l_Avatar_0 = l_Stylizer_0:use("ImportPage").Avatar;
    local v16 = l_LayoutOrderIterator_0.new();
    local v20 = v2.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v13 (copy)
        local v17 = v13.Cell.Avatar:Clone();
        for _, v19 in v17:GetDescendants() do
            if v19:IsA("LuaSourceContainer") or v19:IsA("Sound") then
                v19:Destroy();
            end;
        end;
        return v17;
    end, {
        v13.Cell.Avatar
    });
    return v2.createElement(l_Button_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = v13.Position, 
        OnClick = function() --[[ Line: 56 ]] --[[ Name: OnClick ]]
            -- upvalues: v14 (copy), v13 (copy)
            v14:Set({
                v13.Cell.Avatar
            });
        end, 
        Size = v13.Size
    }, {
        v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Padding = l_Avatar_0.InnerPadding, 
            Spacing = l_Avatar_0.Padding
        }, {
            Preview = v2.createElement(l_AssetRenderModel_0, {
                FocusDirection = v20.PrimaryPart.CFrame.LookVector, 
                Model = v20, 
                Static = true, 
                Ambient = l_Avatar_0.PreviewAmbient, 
                LayoutOrder = v16:getNextOrder(), 
                LightColor = Color3.new(1, 1, 1), 
                LightDirection = -v20.PrimaryPart.CFrame.LookVector, 
                Size = UDim2.fromOffset(l_Avatar_0.IconSize, l_Avatar_0.IconSize)
            }), 
            Name = v2.createElement(l_TextLabel_0, {
                LayoutOrder = v16:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, l_Avatar_0.NameFontSize * l_Avatar_0.NameLines), 
                Text = v13.Cell.Avatar.Name, 
                TextColor = l_Avatar_0.TitleColor, 
                TextSize = l_Avatar_0.NameFontSize, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true
            })
        })
    });
end;