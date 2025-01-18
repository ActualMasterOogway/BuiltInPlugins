local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Components.PropertyView.NumberPartView);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v4) --[[ Line: 7 ]] --[[ Name: Vector3PropertyView ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_parts_0 = v4.info.parts;
    local v6 = l_parts_0.x.multiple and "-" or l_parts_0.x.value;
    local v7 = l_parts_0.y.multiple and "-" or l_parts_0.y.value;
    local v8 = l_parts_0.z.multiple and "-" or l_parts_0.z.value;
    local v9 = not v4.info.readonly;
    return v2.createElement(v2.Fragment, {}, {
        X = v2.createElement(v1, {
            part = "x", 
            position = UDim2.new(0, 0, 0, 0), 
            size = UDim2.new(0.29, 0, 0, 20), 
            color = Color3.fromHex("#DF281F"), 
            editable = v9, 
            value = v6, 
            beginEditingAsync = v4.beginEditingAsync, 
            setPart = v4.setPart, 
            finishEditing = v4.finishEditing
        }), 
        Y = v2.createElement(v1, {
            part = "y", 
            position = UDim2.new(0.33, 0, 0, 0), 
            size = UDim2.new(0.29, 0, 0, 20), 
            color = Color3.fromHex("#39C582"), 
            editable = v9, 
            value = v7, 
            beginEditingAsync = v4.beginEditingAsync, 
            setPart = v4.setPart, 
            finishEditing = v4.finishEditing
        }), 
        Z = v2.createElement(v1, {
            part = "z", 
            position = UDim2.new(0.66, 0, 0, 0), 
            size = UDim2.new(0.29, 0, 0, 20), 
            color = Color3.fromHex("#2F7AC6"), 
            editable = v9, 
            value = v8, 
            beginEditingAsync = v4.beginEditingAsync, 
            setPart = v4.setPart, 
            finishEditing = v4.finishEditing
        })
    });
end;