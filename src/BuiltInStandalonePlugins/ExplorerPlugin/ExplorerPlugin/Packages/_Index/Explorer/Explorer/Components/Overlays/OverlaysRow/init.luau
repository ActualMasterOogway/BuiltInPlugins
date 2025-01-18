local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v2 = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.Overlays.RenameBoxOverlay);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v6 = require(l_script_FirstAncestor_0.Components.ExplorerNodeRow.useInsertObjectVisible);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v3.createElement;
return (v3.memo(function(v9) --[[ Line: 15 ]] --[[ Name: OverlaysRow ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), l_createElement_0 (copy), v4 (copy), v1 (copy)
    local v10 = v2.use(v9.session.capabilities.openInsertObjectMenuObservable);
    local v11 = v3.useRef(nil);
    local v12 = v3.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: v10 (copy), v11 (copy), v9 (copy)
        if v10 == nil then
            return;
        else
            assert(v11.current ~= nil, "OverlaysRow not mounted when clicking");
            v10(v9.visibleNodeObservable.get().datum.id, v11.current.AbsolutePosition + v11.current.AbsoluteSize - Vector2.new(240, 0));
            return;
        end;
    end, {
        v10, 
        v9.visibleNodeObservable
    });
    local v13 = v6(v9.visibleNodeObservable);
    return l_createElement_0("Frame", {
        [v3.Tag] = "Explorer-View", 
        ref = v11
    }, {
        RenameBox = l_createElement_0(v4, {
            session = v9.session, 
            visibleNodeObservable = v9.visibleNodeObservable, 
            scrollWidthObservable = v9.scrollWidthObservable
        }), 
        Right = l_createElement_0("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Position = UDim2.fromScale(1, 0), 
            [v3.Tag] = "X-RowS X-FitX X-Middle"
        }, {
            InsertObject = v10 and v13 and l_createElement_0("TextButton", {
                BackgroundTransparency = 1, 
                Text = "", 
                Visible = v9.visibleNodeObservable.getBinding():map(function(v14) --[[ Line: 63 ]]
                    return v14.hoverState == "Hovered";
                end), 
                [v3.Event.Activated] = v12, 
                [v3.Tag] = "Explorer-View Explorer-Square Explorer-InsertObjectButton"
            }, {
                Padding = l_createElement_0("UIPadding", {
                    PaddingTop = UDim.new(0, 4), 
                    PaddingBottom = UDim.new(0, 4), 
                    PaddingLeft = UDim.new(0, 4), 
                    PaddingRight = UDim.new(0, 4)
                }), 
                Image = l_createElement_0("ImageLabel", {
                    Image = v1.standard("insertObject"), 
                    [v3.Tag] = "Explorer-View Explorer-Content-Muted"
                })
            })
        })
    });
end));