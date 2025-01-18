local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.MediaType);
local v4 = require(l_script_FirstAncestor_0.Enums.Radius);
local v5 = require(l_script_FirstAncestor_0.Components.Tile.useTileLayout);
local v6 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v7 = require(l_script_FirstAncestor_0.Components.Image);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = {
    aspectRatio = 1, 
    radius = v4.None, 
    LayoutOrder = 1
};
return function(v12) --[[ Line: 37 ]] --[[ Name: TileMedia ]]
    -- upvalues: v6 (copy), v11 (copy), v5 (copy), v9 (copy), v2 (copy), v4 (copy), v7 (copy), v8 (copy)
    local v13 = v6(v12, v11);
    local v14 = v5();
    local v15 = v9();
    local v16 = nil;
    local v17 = nil;
    if typeof(v13.background) == "string" then
        v17 = v13.background;
    elseif v13.background ~= nil then
        v16 = v13.background;
    end;
    local v18 = v2.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v13 (copy)
        if v13.mediaType == nil or v13.mediaId == nil then
            return nil;
        else
            return (("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v13.mediaType, v13.mediaId));
        end;
    end, {
        v13.mediaType, 
        v13.mediaId
    });
    local v19 = if v13.radius ~= v4.None then UDim.new(0, v15.Radius[v13.radius]) else nil;
    return v2.createElement(if v17 then v7 else v8, {
        Image = v17, 
        Size = if v14.fillDirection == Enum.FillDirection.Vertical then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1), 
        ZIndex = 0, 
        LayoutOrder = v13.LayoutOrder, 
        aspectRatio = {
            AspectRatio = v13.aspectRatio, 
            AspectType = Enum.AspectType.ScaleWithParentSize, 
            DominantAxis = if v14.fillDirection == Enum.FillDirection.Vertical then Enum.DominantAxis.Width else Enum.DominantAxis.Height
        }, 
        cornerRadius = v19
    }, {
        MiddleCorners = if v14.hasBackground and v14.tilePadding == nil and v19 then v2.createElement(v7, {
            Image = v17, 
            ZIndex = 0, 
            tag = "size-full"
        }, {
            TransparencyGradient = v2.createElement("UIGradient", {
                Rotation = v14.fillDirection == Enum.FillDirection.Vertical and 90 or 0, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.5, 0), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            }), 
            Image = v2.createElement(v7, {
                Image = v18, 
                backgroundStyle = v16, 
                tag = "size-full"
            }, {
                TransparencyGradient = v2.createElement("UIGradient", {
                    Rotation = v14.fillDirection == Enum.FillDirection.Vertical and 90 or 0, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.5, 0), 
                        NumberSequenceKeypoint.new(1, 0)
                    })
                })
            })
        }) else nil, 
        Image = v2.createElement(v7, {
            Image = v18, 
            cornerRadius = v19, 
            backgroundStyle = v16, 
            tag = "size-full"
        }, v13.children)
    });
end;