local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Util.joinAndMapBindings);
local v6 = require(l_script_FirstAncestor_0.Util.mapValues);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v3.createElement;
return function(v9) --[[ Line: 13 ]] --[[ Name: NodeDecorators ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy), v3 (copy), v6 (copy), v5 (copy)
    return l_createElement_0("Frame", {
        Size = UDim2.new(1, -v1.sessionViewScrollBarWidth, 1, 0), 
        ZIndex = v9.zIndex, 
        [v3.Tag] = "Explorer-View"
    }, v6(v9.visibleNodeObservables, function(v10, v11) --[[ Line: 33 ]]
        -- upvalues: l_createElement_0 (ref), v5 (ref), v9 (copy), v1 (ref)
        return l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            Position = v5(function(v12, v13) --[[ Line: 37 ]]
                return UDim2.fromOffset(0, v13.yPixels - v12);
            end, v9.scrollHeightObservable.getBinding(), v10.getBinding()), 
            Size = UDim2.new(1, 0, 0, v1.explorerRowHeight), 
            Visible = v10.getBinding():map(function(v14) --[[ Line: 46 ]]
                -- upvalues: v1 (ref)
                return v14.datum.id ~= v1.nilId;
            end)
        }, v9.render(v10, v11));
    end), v9.children);
end;