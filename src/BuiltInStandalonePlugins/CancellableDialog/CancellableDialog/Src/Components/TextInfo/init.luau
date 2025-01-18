local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_LayoutOrderIterator_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.LayoutOrderIterator;
local v3 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local v4 = require(script.styles);
local v5 = v4:GetAttribute("IconSize").X.Offset + v4:GetAttribute("IconToContentPadding").Offset;
local l_TweenService_0 = game:GetService("TweenService");
local v7 = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1);
return function(v8) --[[ Line: 30 ]] --[[ Name: TextInfo ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_TweenService_0 (copy), v7 (copy), v3 (copy), v5 (copy)
    local v9 = l_LayoutOrderIterator_0.new();
    local v10 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v10 (copy), l_TweenService_0 (ref), v7 (ref), v8 (copy)
        assert(v10.current ~= nil, "LoadingIcon was not mounted by useEffect");
        local v11 = l_TweenService_0:Create(v10.current, v7, {
            Rotation = 360
        });
        v11:Play();
        local v13 = task.spawn(function() --[[ Line: 42 ]]
            -- upvalues: v10 (ref), v8 (ref)
            local v12 = time();
            while not v10.current.IsLoaded and time() - v12 < 1 do
                task.wait();
            end;
            v8.OnShown();
        end);
        return function() --[[ Line: 52 ]]
            -- upvalues: v13 (copy), v11 (copy)
            task.cancel(v13);
            v11:Cancel();
            v11:Destroy();
        end;
    end, {});
    local v14 = v8.Title == "";
    return v1.createElement("Frame", {
        Size = v8.Size, 
        LayoutOrder = v8.LayoutOrder, 
        [v1.Tag] = "X-FitY X-Column Component-TextInfo"
    }, {
        TitleFrame = v1.createElement("Frame", {
            LayoutOrder = v9:getNextOrder(), 
            [v1.Tag] = "X-FitY X-Column"
        }, {
            Title = if not v14 then v1.createElement("TextLabel", {
                Text = v8.Title, 
                LayoutOrder = v9:getNextOrder(), 
                [v1.Tag] = "X-FitY TitleText"
            }) else nil, 
            TitleShimmer = if v14 then v1.createElement(v3, {
                Size = UDim2.new(0.65, 0, 0, 20), 
                LayoutOrder = v9:getNextOrder()
            }) else nil, 
            Subtitle = v1.createElement("TextLabel", {
                Text = v8.Subtitle, 
                LayoutOrder = v9:getNextOrder(), 
                [v1.Tag] = "X-FitY SubtitleText"
            })
        }), 
        StatusTextFrame = v1.createElement("Frame", {
            LayoutOrder = v9:getNextOrder(), 
            [v1.Tag] = "X-FitY X-Row StatusTextFrame"
        }, {
            IconContainer = v1.createElement("Frame", {
                [v1.Tag] = "LoadingIconContainer"
            }, {
                LoadingIcon = v1.createElement("ImageLabel", {
                    LayoutOrder = v9:getNextOrder(), 
                    ref = v10, 
                    [v1.Tag] = "LoadingIcon"
                })
            }), 
            StatusText = v1.createElement("TextLabel", {
                Text = v8.Status, 
                LayoutOrder = v9:getNextOrder(), 
                Size = UDim2.new(1, -v5, 0, 0), 
                [v1.Tag] = "X-FitY StatusText"
            })
        })
    });
end;