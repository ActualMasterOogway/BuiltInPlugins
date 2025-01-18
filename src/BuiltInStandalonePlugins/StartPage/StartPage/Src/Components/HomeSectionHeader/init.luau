local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local l_counter_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.counter;
local v5 = if v2 then nil else require(l_script_FirstAncestor_0.Src.Components.Shimmer);
return function(v6) --[[ Line: 31 ]] --[[ Name: HomeSectionHeader ]]
    -- upvalues: l_counter_0 (copy), v3 (copy), v1 (copy), v2 (copy), v5 (copy)
    local v7 = l_counter_0();
    local v8, v9 = v3("PointingHand");
    return v1.createElement("Frame", {
        Size = if v2 then nil else v6.Size, 
        Position = if v2 then nil else v6.Position, 
        [v1.Tag] = v2 and "X-Transparent X-FitY" or "X-ColumnM X-Transparent"
    }, {
        Child = if not not v2 or v6.HasParentLoaded then v1.createElement("Frame", {
            [v1.Tag] = "X-FitY X-Transparent"
        }, {
            TitleDesc = v1.createElement("Frame", {
                LayoutOrder = v7(), 
                [v1.Tag] = "X-Fit X-ColumnM X-Transparent"
            }, {
                Title = v1.createElement("TextLabel", {
                    Text = v6.Title, 
                    TextSize = 32, 
                    [v1.Tag] = "X-Fit StartPage-FontBold StartPage-TextColor X-Transparent"
                }), 
                Description = if v6.Description then v1.createElement("TextLabel", {
                    Text = v6.Description, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    [v1.Tag] = "X-Fit StartPage-Font StartPage-TextColor X-Transparent StartPage-TextSize"
                }) else nil
            }), 
            Button = if v6.ButtonText then v1.createElement("Frame", {
                LayoutOrder = v7(), 
                [v1.Tag] = "X-Fill X-Right X-Transparent"
            }, {
                Button = v1.createElement("ImageButton", {
                    [v1.Event.Activated] = function() --[[ Line: 71 ]]
                        -- upvalues: v6 (copy)
                        if v6.OnButtonClick then
                            v6.OnButtonClick();
                        end;
                    end, 
                    [v1.Event.MouseEnter] = v8, 
                    [v1.Event.MouseLeave] = v9, 
                    [v1.Tag] = "StartPage-Border StartPage-ButtonPadding StartPage-RoundedCorner8 StartPage-PageBackground X-Fit X-Middle X-Row"
                }, {
                    v1.createElement("TextLabel", {
                        Text = v6.ButtonText, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        [v1.Tag] = "X-Fit StartPage-FontBold StartPage-TextColor X-Transparent StartPage-TextSize"
                    })
                })
            }) else nil
        }) else v1.createElement(v5.Component, {
            Size = UDim2.new(0.4, 0, 1, 0)
        })
    });
end;