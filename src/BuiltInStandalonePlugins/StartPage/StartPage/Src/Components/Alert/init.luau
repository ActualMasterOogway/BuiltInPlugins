local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local l_Image_0 = v2.UI.Image;
return function(v5) --[[ Line: 28 ]] --[[ Name: Alert ]]
    -- upvalues: v3 (copy), v1 (copy), l_Image_0 (copy)
    local v6, v7 = v3("PointingHand");
    return v1.createElement("ImageButton", {
        Position = v5.Position, 
        Size = v5.Size, 
        LayoutOrder = v5.LayoutOrder, 
        [v1.Event.Activated] = function() --[[ Line: 35 ]]
            -- upvalues: v5 (copy)
            if v5.OnClick then
                v5.OnClick();
            end;
        end, 
        [v1.Event.MouseEnter] = v6, 
        [v1.Event.MouseLeave] = v7, 
        [v1.Tag] = "StartPage-AlertBackground StartPage-RoundedCorner8"
    }, {
        v1.createElement("Frame", {
            [v1.Tag] = "X-Fill X-RowS X-Pad X-Top X-Left StartPage-AlertBackground StartPage-RoundedCorner8"
        }, {
            v1.createElement(l_Image_0, {
                [v1.Tag] = "StartPage-AlertIcon"
            }), 
            v1.createElement("Frame", {
                [v1.Tag] = "X-ColumnS X-Fit X-Left X-Transparent"
            }, {
                v1.createElement("TextLabel", {
                    Text = v5.Title, 
                    TextSize = 16, 
                    [v1.Tag] = "X-Fit StartPage-WhiteTextColor StartPage-FontBold X-Transparent"
                }), 
                v1.createElement("TextLabel", {
                    Text = v5.Body, 
                    TextSize = 12, 
                    [v1.Tag] = "X-Fit StartPage-WhiteTextColor StartPage-Font X-Transparent"
                })
            })
        }), 
        v1.createElement("Frame", {
            [v1.Tag] = "X-Transparent X-Fill X-Right X-Pad"
        }, {
            v1.createElement("ImageButton", {
                [v1.Event.Activated] = function() --[[ Line: 72 ]]
                    -- upvalues: v5 (copy)
                    if v5.OnClose then
                        v5.OnClose();
                    end;
                end, 
                [v1.Tag] = "X-Transparent StartPage-CancelWhiteIcon"
            })
        })
    });
end;