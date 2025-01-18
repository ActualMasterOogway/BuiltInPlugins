local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v7, v8) --[[ Line: 33 ]] --[[ Name: withGuiObjectProps ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), v2 (copy)
    if type(v8) == "table" then
        v8.AutoLocalize = v7.AutoLocalize;
        v8.AutomaticSize = v7.AutomaticSize;
        v8.BackgroundColor3 = if v7.backgroundStyle then v4(v7.backgroundStyle, "Color3") else nil;
        v8.BackgroundTransparency = if v7.backgroundStyle then v4(v7.backgroundStyle, "Transparency") else nil;
        v8.BorderSizePixel = v7.BorderSizePixel;
        v8.ClipsDescendants = v7.ClipsDescendants;
        v8.Rotation = v7.Rotation;
        if v7.selection then
            v8.Selectable = v7.selection.Selectable;
            v8.SelectionImageObject = v7.selection.SelectionImageObject;
            v8.SelectionOrder = v7.selection.SelectionOrder;
        end;
        if v7.selectionGroup ~= nil then
            if type(v7.selectionGroup) == "boolean" or v3.isBinding(v7.selectionGroup) then
                v8.SelectionGroup = v7.selectionGroup;
            else
                local l_selectionGroup_0 = v7.selectionGroup;
                v8.SelectionGroup = true;
                v8.SelectionBehaviorUp = l_selectionGroup_0.SelectionBehaviorUp;
                v8.SelectionBehaviorDown = l_selectionGroup_0.SelectionBehaviorDown;
                v8.SelectionBehaviorLeft = l_selectionGroup_0.SelectionBehaviorLeft;
                v8.SelectionBehaviorRight = l_selectionGroup_0.SelectionBehaviorRight;
            end;
        end;
        v8.Size = v7.Size;
    end;
    local v10 = v5(v7, v8);
    v10[v2.Change.AbsoluteSize] = v7.onAbsoluteSizeChanged;
    v10.onAbsoluteSizeChanged = nil;
    local v11 = if v10.testId then "data-testid=" .. v10.testId else nil;
    if v10[v2.Tag] and v11 then
        local l_Tag_0 = v2.Tag;
        v10[l_Tag_0] = v10[l_Tag_0] .. " " .. v11;
    else
        v10[v2.Tag] = v10[v2.Tag] or v11;
    end;
    v10.testId = nil;
    return v10;
end;