local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
return function(v3, v4, v5) --[[ Line: 11 ]] --[[ Name: createFitToContent ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = ("FitComponent(%s, %s)"):format(v3, v4);
    local v7 = v1.Component:extend(v6);
    v7.init = function(v8) --[[ Line: 15 ]] --[[ Name: init ]]
        -- upvalues: v1 (ref), v2 (ref), v5 (copy)
        v8.layoutRef = v1.createRef();
        v8.containerRef = v1.createRef();
        v8.layoutProps = v2.Dictionary.join(v5, {
            [v1.Ref] = v8.layoutRef, 
            [v1.Change.AbsoluteContentSize] = function() --[[ Line: 21 ]]
                -- upvalues: v8 (copy)
                if v8.layoutRef.current ~= nil and v8.containerRef.current ~= nil then
                    v8:resizeContainer();
                end;
            end
        });
    end;
    v7.render = function(v9) --[[ Line: 29 ]] --[[ Name: render ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (copy), v3 (copy)
        assert(v9.props.Size == nil, "Size must not be specified!");
        local v10 = nil;
        v10 = if #v9.props[v1.Children] == 1 and typeof(v9.props[v1.Children][1] == "table") then v2.Dictionary.join({
            Layout = v1.createElement(v4, v9.layoutProps)
        }, v9.props[v1.Children][1]) else v2.Dictionary.join({
            Layout = v1.createElement(v4, v9.layoutProps)
        }, v9.props[v1.Children]);
        local v11 = v2.Dictionary.join(v9.props, {
            [v1.Children] = v10, 
            [v1.Ref] = v9.containerRef
        });
        return v1.createElement(v3, v11);
    end;
    v7.didMount = function(v12) --[[ Line: 53 ]] --[[ Name: didMount ]]
        v12:resizeContainer();
    end;
    v7.didUpdate = function(v13) --[[ Line: 57 ]] --[[ Name: didUpdate ]]
        v13:resizeContainer();
    end;
    v7.resizeContainer = function(v14) --[[ Line: 61 ]] --[[ Name: resizeContainer ]]
        local l_current_0 = v14.layoutRef.current;
        if l_current_0 then
            local l_AbsoluteContentSize_0 = l_current_0.AbsoluteContentSize;
            v14.containerRef.current.Size = UDim2.new(1, 0, 0, l_AbsoluteContentSize_0.Y);
        end;
    end;
    return v7;
end;