local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.BadgeVariant);
local v2 = require(l_script_FirstAncestor_0.Enums.BadgeSize);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = function(_, v7, v8) --[[ Line: 20 ]] --[[ Name: containerPadding ]]
    local v9 = "";
    local v10 = "";
    if v8 then
        v10 = "padding-y-xxsmall";
        v9 = v9 .. " padding-left-xxsmall";
        if not v7 then
            v9 = v9 .. " padding-right-xxsmall";
        end;
    end;
    return v9, v10;
end;
local v12 = {
    [v2.Small] = "text-caption-small", 
    [v2.Medium] = "text-label-small"
};
return function(v13, v14, v15, v16) --[[ Line: 41 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy), v4 (copy), v12 (copy)
    local v17 = v3();
    local v18 = {
        [v1.Primary] = {
            backgroundStyle = v17.Color.System.Contrast, 
            contentStyle = v17.Inverse.Content.Emphasis
        }, 
        [v1.Secondary] = {
            backgroundStyle = v17.Color.Shift.Shift_200, 
            contentStyle = v17.Color.Content.Emphasis
        }, 
        [v1.Alert] = {
            backgroundStyle = v17.Color.System.Alert, 
            contentStyle = v17.DarkMode.Content.Emphasis
        }
    };
    local v19 = {
        [v2.Small] = if v4.FoundationBadgeSimplifySizing then v17.Size.Size_300 - v17.Padding.XXSmall * 2 else v17.Typography.CaptionSmall.FontSize, 
        [v2.Medium] = if v4.FoundationBadgeSimplifySizing then v17.Size.Size_600 - v17.Stroke.Standard * 2 - v17.Padding.XXSmall * 2 else v17.Typography.LabelSmall.FontSize
    };
    local v20 = "";
    local v21 = "";
    if v15 then
        v21 = "padding-y-xxsmall";
        v20 = v20 .. " padding-left-xxsmall";
        if not v16 then
            v20 = v20 .. " padding-right-xxsmall";
        end;
    end;
    local l_v20_0 = v20;
    local l_v21_0 = v21;
    v20 = if v4.FoundationBadgeSimplifySizing then (v15 or v16) and "padding-xxsmall" or "" else ("%* %*"):format(l_v20_0, l_v21_0);
    v21 = v12[v14];
    local v24 = {
        MaxSize = if v15 then Vector2.new(v17.Size.Size_1600 - v17.Semantic.Icon.Size.Small - v17.Padding.XXSmall, 1e999) else nil
    };
    local v25 = if not not v16 or v4.FoundationBadgeSimplifySizing and v15 then v19[v14] else v17.Size.Size_200;
    local v26 = {
        MinSize = Vector2.new(v25, v25), 
        MaxSize = Vector2.new(v17.Size.Size_1600, 1e999)
    };
    local v27 = ("auto-xy radius-circle row align-y-center align-x-center stroke-thick %*"):format(v20);
    local v28 = ("auto-xy text-truncate-end %* %*"):format("padding-x-xsmall", v21);
    return v18[v13], v26, v24, v27, v28;
end;