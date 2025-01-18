local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local _ = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = require(l_Parent_0.Core.Util.Constants);
local v7 = require(l_Parent_0.Core.Util.Colors);
local v8 = require(l_Parent_0.Core.Util.Images);
local l_withForwardRef_0 = v5.Wrappers.withForwardRef;
return function(v10) --[[ Line: 20 ]] --[[ Name: RoundElement ]]
    -- upvalues: v8 (copy), v7 (copy), v6 (copy), v3 (copy), v4 (copy), l_withForwardRef_0 (copy)
    local v11 = v10 and "ImageButton" or "ImageLabel";
    return (l_withForwardRef_0(function(v12) --[[ Line: 23 ]] --[[ Name: RoundElementComponent ]]
        -- upvalues: v8 (ref), v7 (ref), v6 (ref), v3 (ref), v4 (ref), v11 (copy)
        local v13 = {
            BackgroundTransparency = 1, 
            Image = v8.ROUNDED_BACKGROUND_IMAGE, 
            ImageTransparency = 0, 
            ImageColor3 = v7.WHITE, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v6.ROUNDED_FRAME_SLICE, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v14 = v3.Dictionary.join(v12, {
            ForwardRef = v3.None, 
            [v4.Children] = v3.None, 
            BackgroundColor3 = v3.None, 
            BackgroundTransparency = v3.None, 
            BorderColor3 = v3.None
        });
        v13 = v3.Dictionary.join(v13, v14, {
            [v4.Ref] = v12.ForwardRef
        });
        if v12.BackgroundColor3 then
            v13.ImageColor3 = v12.BackgroundColor3;
        end;
        if v12.BackgroundTransparency then
            v13.ImageTransparency = v12.BackgroundTransparency;
        end;
        local v15 = v12.BorderColor3 or v7.GRAY_3;
        local v16 = nil;
        v16 = v12.BorderSizePixel == 0 and 1 or 0;
        return v4.createElement(v11, v13, {
            Border = v4.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = v8.ROUNDED_BORDER_IMAGE, 
                ImageColor3 = v15, 
                ImageTransparency = v16, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v6.ROUNDED_FRAME_SLICE
            }, v12[v4.Children])
        });
    end));
end;