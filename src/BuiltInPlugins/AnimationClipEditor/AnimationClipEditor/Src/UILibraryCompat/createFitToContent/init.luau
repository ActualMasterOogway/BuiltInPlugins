local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
return function(v3, v4, v5) --[[ Line: 6 ]] --[[ Name: createFitToContent ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = ("FitComponent(%s, %s)"):format(v3, v4);
    local v7 = v1.Component:extend(v6);
    local v8 = v5.BorderSize or 0;
    v5 = v2.Dictionary.join(v5, {
        BorderSize = v2.None
    });
    v7.init = function(v9) --[[ Line: 15 ]] --[[ Name: init ]]
        -- upvalues: v1 (ref), v2 (ref), v5 (ref)
        v9.layoutRef = v1.createRef();
        v9.containerRef = v1.createRef();
        v9.layoutProps = v2.Dictionary.join(v5, {
            [v1.Ref] = v9.layoutRef, 
            [v1.Change.AbsoluteContentSize] = function() --[[ Line: 21 ]]
                -- upvalues: v9 (copy)
                if v9.layoutRef.current ~= nil and v9.containerRef.current ~= nil then
                    v9:resizeContainer();
                end;
            end
        });
    end;
    v7.render = function(v10) --[[ Line: 29 ]] --[[ Name: render ]]
        -- upvalues: v2 (ref), v1 (ref), v4 (copy), v8 (copy), v3 (copy)
        assert(v10.props.Size == nil, "Size must not be specified!");
        local l_join_0 = v2.Dictionary.join;
        local v12 = {
            Layout = v1.createElement(v4, v10.layoutProps)
        };
        local v13 = false;
        if v8 > 0 then
            v13 = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v8), 
                PaddingBottom = UDim.new(0, v8), 
                PaddingLeft = UDim.new(0, v8), 
                PaddingRight = UDim.new(0, v8)
            });
        end;
        v12.Padding = v13;
        l_join_0 = l_join_0(v12, v10.props[v1.Children]);
        v12 = v2.Dictionary.join(v10.props, {
            [v1.Children] = l_join_0, 
            [v1.Ref] = v10.containerRef
        });
        return v1.createElement(v3, v12);
    end;
    v7.didMount = function(v14) --[[ Line: 50 ]] --[[ Name: didMount ]]
        v14:resizeContainer();
    end;
    v7.resizeContainer = function(v15) --[[ Line: 54 ]] --[[ Name: resizeContainer ]]
        -- upvalues: v8 (copy)
        local l_AbsoluteContentSize_0 = v15.layoutRef.current.AbsoluteContentSize;
        v15.containerRef.current.Size = UDim2.new(1, 0, 0, l_AbsoluteContentSize_0.Y + v8 * 2);
    end;
    return v7;
end;