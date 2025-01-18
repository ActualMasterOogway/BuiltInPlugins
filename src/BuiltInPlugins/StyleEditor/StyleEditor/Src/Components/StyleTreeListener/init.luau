local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.React);
local l_useEffect_0 = v3.useEffect;
local l_useLayoutEffect_0 = v3.useLayoutEffect;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v7 = require(l_Parent_0.Src.Hooks.useDispatch);
local v8 = require(l_Parent_0.Src.Util.TreeListener);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v10 = require(l_Actions_0.Window.SetIsDirty);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v12 = require(l_Thunks_0.StyleTree.UpdateStyleSheetReferences);
local _ = require(l_Parent_0.Src.Types);
local v14 = {
    l_ReplicatedStorage_0
};
return v2.connect(function(v15) --[[ Line: 83 ]]
    return {
        IsDirty = v15.Window.IsDirty
    };
end)(function(v16) --[[ Line: 38 ]] --[[ Name: StyleTreeListener ]]
    -- upvalues: v7 (copy), v12 (copy), v10 (copy), l_useLayoutEffect_0 (copy), l_useEffect_0 (copy), v8 (copy), v14 (copy)
    local v17 = v7();
    local function v21(v18, v19, v20) --[[ Line: 41 ]] --[[ Name: onTreeChanged ]]
        -- upvalues: v17 (copy), v12 (ref), v10 (ref)
        if v19 == "Destroying" or v19 == "DescendantRemoving" then
            if v20.Parent == nil and v20:IsA("StyleSheet") then
                v17(v12(v20));
            end;
        elseif v19 == "PropertyChanged" and v20 == "Name" and v18:IsA("StyleSheet") then
            v17(v12(v18));
        end;
        v17(v10(true));
    end;
    l_useLayoutEffect_0(function() --[[ Line: 57 ]]
        -- upvalues: v16 (copy), v17 (copy), v10 (ref)
        if v16.IsDirty then
            v17(v10(false));
        end;
    end, {
        v16.IsDirty
    });
    l_useEffect_0(function() --[[ Line: 63 ]]
        -- upvalues: v8 (ref), v14 (ref), v21 (copy)
        local v22 = v8.new(v14, v21, {
            "Name", 
            "Parent", 
            "Selector"
        }, {
            "StyleSheet", 
            "Folder", 
            "StyleRule"
        });
        return function() --[[ Line: 71 ]]
            -- upvalues: v22 (ref)
            if v22 then
                v22:destroyListener();
            end;
            v22 = nil;
        end;
    end, {});
    return nil;
end);