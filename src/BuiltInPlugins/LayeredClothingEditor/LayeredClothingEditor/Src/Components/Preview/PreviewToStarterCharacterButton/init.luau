local l_Workspace_0 = game.Workspace;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_PreviewModelAsCharacter_0 = l_AccessoryAndBodyToolShared_0.PreviewModelAsCharacter;
local l_Button_0 = v6.UI.Button;
local v11 = require(l_Parent_0.Src.Util.StringUtil);
local v12 = v2.PureComponent:extend("PreviewToStarterCharacterButton");
v12.init = function(v13) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: l_Workspace_0 (copy), l_PreviewModelAsCharacter_0 (copy)
    v13.onPreviewButtonClick = function() --[[ Line: 28 ]]
        -- upvalues: l_Workspace_0 (ref), l_PreviewModelAsCharacter_0 (ref), v13 (copy)
        local l_LayeredClothingEditorPreview_0 = l_Workspace_0:FindFirstChild("LayeredClothingEditorPreview");
        if not l_LayeredClothingEditorPreview_0 then
            return;
        else
            local l_Mannequin_0 = l_LayeredClothingEditorPreview_0:FindFirstChild("Mannequin");
            if not l_Mannequin_0 then
                return;
            else
                l_PreviewModelAsCharacter_0:SetPreviewAsCharacter(l_Mannequin_0, v13.props.EditingItemContext:getItem());
                return;
            end;
        end;
    end;
end;
v12.render = function(v16) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v2 (copy), l_Button_0 (copy)
    local l_props_0 = v16.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v20 = v11.getTextWidth("Preview", l_Stylizer_0.TextSize, l_Stylizer_0.Font);
    return v2.createElement(l_Button_0, {
        Size = UDim2.new(0, v20 + l_Stylizer_0.MainPadding, 0, l_Stylizer_0.ButtonHeight), 
        Text = "Preview", 
        TextSize = l_Stylizer_0.TextSize, 
        ButtonHeight = l_Stylizer_0.ButtonHeight, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        Style = "Round", 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = v16.onPreviewButtonClick
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    EditingItemContext = l_EditingItemContext_0
})(v12));