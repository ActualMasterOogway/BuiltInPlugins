local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v5 = require(l_Parent_0.Styling.supportsStyleSheets);
local v6 = require(l_Parent_0.Styling.joinTags);
local v7 = require(l_Parent_0.Util);
local l_Immutable_0 = v7.Immutable;
local v9 = require(l_Parent_0.Util.Typecheck);
local l_prioritize_0 = v7.prioritize;
local v11 = require(l_Parent_0.Wrappers.withForwardRef);
local v12 = v1.PureComponent:extend("TextLabel");
v9.wrap(v12, script);
v12.render = function(v13) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v4 (copy), l_Parent_0 (copy), l_prioritize_0 (copy), v1 (copy), v6 (copy), l_Immutable_0 (copy)
    local l_props_0 = v13.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_Text_0 = l_props_0.Text;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local v21 = if v5 then l_props_0[v4.Tag] else nil;
    local v22 = if v5 then l_props_0.Style or {} else l_props_0.Stylizer;
    local v23 = nil;
    if v5 and typeof(v22) == "string" then
        v23 = v22;
        if game:GetFastFlag("DebugDeveloperFrameworkSdk") then
            local l_Folder_0 = l_Parent_0:FindFirstAncestorWhichIsA("Plugin"):FindFirstChildWhichIsA("Folder");
            print((("[DebugDeveloperFrameworkSdk] %* StyleSheets DEPRECATED: Replace TextLabel Style = %* with [React.Tag] = %*"):format(l_Folder_0.Name, v22, v23)));
        end;
        v22 = {};
    end;
    local v25 = if v5 then l_prioritize_0(l_props_0.BackgroundTransparency, v22.BackgroundTransparency) else l_prioritize_0(l_props_0.BackgroundTransparency, v22.BackgroundTransparency, 1);
    local v26 = l_prioritize_0(l_props_0.Font, v22.Font);
    local l_FontFace_0 = l_props_0.FontFace;
    local l_RichText_0 = l_props_0.RichText;
    local v29 = l_prioritize_0(l_props_0.TextColor, v22.TextColor);
    local v30 = l_prioritize_0(l_props_0.TextSize, v22.TextSize);
    local v31 = l_prioritize_0(l_props_0.TextTransparency, v22.TextTransparency);
    local v32 = l_prioritize_0(l_props_0.TextXAlignment, v22.TextXAlignment);
    local v33 = l_prioritize_0(l_props_0.TextYAlignment, v22.TextYAlignment);
    local l_TextTruncate_0 = l_props_0.TextTruncate;
    local l_TextWrapped_0 = l_props_0.TextWrapped;
    local l_AutomaticSize_0 = l_props_0.AutomaticSize;
    local l_ForwardRef_0 = l_props_0.ForwardRef;
    local v38 = l_props_0[v1.Change.AbsoluteSize];
    if v5 then
        if not l_Size_0 and l_AutomaticSize_0 then
            if l_AutomaticSize_0 == Enum.AutomaticSize.XY then
                l_Size_0 = UDim2.fromScale(0, 0);
            elseif l_AutomaticSize_0 == Enum.AutomaticSize.X then
                l_Size_0 = UDim2.fromScale(0, 1);
            elseif l_AutomaticSize_0 == Enum.AutomaticSize.Y then
                l_Size_0 = UDim2.fromScale(1, 0);
            end;
        end;
    elseif not l_Size_0 and not l_AutomaticSize_0 then
        l_Size_0 = UDim2.fromScale(1, 1);
    end;
    local v39 = {
        AnchorPoint = l_AnchorPoint_0, 
        AutomaticSize = l_AutomaticSize_0, 
        Position = l_Position_0, 
        BackgroundTransparency = v25, 
        Font = if l_FontFace_0 ~= nil then nil else v26, 
        FontFace = l_FontFace_0, 
        LayoutOrder = l_LayoutOrder_0, 
        RichText = l_RichText_0, 
        Size = l_Size_0, 
        Text = l_Text_0, 
        TextColor3 = v29, 
        TextSize = v30, 
        TextTruncate = l_TextTruncate_0, 
        TextTransparency = v31, 
        TextWrapped = l_TextWrapped_0, 
        TextXAlignment = v32, 
        TextYAlignment = v33, 
        ZIndex = l_ZIndex_0, 
        [v1.Ref] = l_ForwardRef_0, 
        [v1.Change.AbsoluteSize] = v38
    };
    if v5 then
        v39[v4.Tag] = v6("Component-TextLabel", v21, v23);
    end;
    if l_props_0.TextSelectable then
        return v1.createElement("TextBox", l_Immutable_0.JoinDictionaries(v39, {
            ClearTextOnFocus = false, 
            MultiLine = l_TextWrapped_0, 
            TextEditable = false
        }), l_props_0[v1.Children]);
    else
        return v1.createElement("TextLabel", v39, l_props_0[v1.Children]);
    end;
end;
if not v5 then
    v12 = l_withContext_0({
        Stylizer = v2.Stylizer
    })(v12);
end;
return v11(v12);