local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
return function(v3) --[[ Line: 16 ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy)
    v1.useEffect(function() --[[ Line: 17 ]]

    end, {});
    return (v1.createElement("Frame", {
        LayoutOrder = v3.LayoutOrder, 
        AnchorPoint = v3.AnchorPoint, 
        Position = v3.Position, 
        [v1.Tag] = l_joinTags_0("Component-ErrorAlert X-RowS X-Middle X-Left", v3.IsPopup and "Popup" or nil)
    }, {
        Icon = v1.createElement("ImageLabel", {
            LayoutOrder = 1, 
            [v1.Tag] = "ErrorIcon"
        }), 
        Text = v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = v3.Message, 
            [v1.Tag] = not v3.IsPopup and "Red" or nil
        }), 
        CloseWrapper = if v3.IsPopup then v1.createElement("Frame", {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(24, 0)
        }, {
            CloseIcon = v1.createElement("ImageButton", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0), 
                [v1.Tag] = "CloseIcon", 
                [v1.Event.Activated] = v3.OnClose
            })
        }) else nil
    }));
end;