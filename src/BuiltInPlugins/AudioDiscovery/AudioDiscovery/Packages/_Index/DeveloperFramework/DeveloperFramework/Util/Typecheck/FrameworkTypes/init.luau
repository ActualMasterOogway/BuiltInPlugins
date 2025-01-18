local l_Parent_0 = script:FindFirstAncestor("Util").Parent;
local v1 = require(l_Parent_0.Util.StyleModifier);
local v2 = require(script.Parent.t);
local v14 = {
    Component = function(v3) --[[ Line: 11 ]] --[[ Name: Component ]]
        -- upvalues: v2 (copy)
        if not v2.table(v3) or not v2.callback(v3.render) then
            return false, ("Component expected, got %s."):format((type(v3)));
        else
            return true;
        end;
    end, 
    ContextItem = function(v4) --[[ Line: 19 ]] --[[ Name: ContextItem ]]
        -- upvalues: v2 (copy)
        if not v2.table(v4) or not v2.callback(v4.getSignal) then
            return false, ("ContextItem expected, got %s."):format((type(v4)));
        else
            return true;
        end;
    end, 
    Theme = function(v5) --[[ Line: 28 ]] --[[ Name: Theme ]]
        -- upvalues: v2 (copy)
        if not v2.table(v5) or not v2.callback(v5.getStyle) then
            return false, ("Theme expected, got %s."):format((type(v5)));
        else
            return true;
        end;
    end, 
    Stylizer = function(v6) --[[ Line: 36 ]] --[[ Name: Stylizer ]]
        -- upvalues: v2 (copy)
        if not v2.table(v6) or not v2.callback(v6.getConsumerItem) then
            return false, ("Stylizer expected, got %s."):format((type(v6)));
        else
            return true;
        end;
    end, 
    Plugin = function(v7) --[[ Line: 44 ]] --[[ Name: Plugin ]]
        -- upvalues: v2 (copy)
        if not v2.table(v7) or not v2.callback(v7.get) then
            return false, ("Plugin expected, got %s."):format((type(v7)));
        else
            return true;
        end;
    end, 
    Mouse = function(v8) --[[ Line: 52 ]] --[[ Name: Mouse ]]
        -- upvalues: v2 (copy)
        if not v2.table(v8) or not v2.callback(v8.get) then
            return false, ("Mouse expected, got %s."):format((type(v8)));
        else
            return true;
        end;
    end, 
    Focus = function(v9) --[[ Line: 60 ]] --[[ Name: Focus ]]
        -- upvalues: v2 (copy)
        if not v2.table(v9) or not v2.callback(v9.get) then
            return false, ("Focus expected, got %s."):format((type(v9)));
        else
            return true;
        end;
    end, 
    RoactRef = function(v10) --[[ Line: 68 ]] --[[ Name: RoactRef ]]
        -- upvalues: v2 (copy)
        return v2.table(v10) and tostring(v10):find("RoactRef");
    end, 
    Symbol = function(v11) --[[ Line: 72 ]] --[[ Name: Symbol ]]
        -- upvalues: v2 (copy)
        return v2.userdata(v11);
    end, 
    Signal = function(v12) --[[ Line: 76 ]] --[[ Name: Signal ]]
        -- upvalues: v2 (copy)
        if not v2.table(v12) or not v2.table(v12._listeners) then
            return false, ("Signal expected, got %s."):format((type(v12)));
        else
            return true;
        end;
    end, 
    StyleModifier = function(v13) --[[ Line: 84 ]] --[[ Name: StyleModifier ]]
        -- upvalues: v1 (copy)
        if v1.isEnumValue(v13) then
            return true;
        else
            return false, ("StyleModifier expected, got %s."):format((type(v13)));
        end;
    end
};
local v15 = v2.union(v2.string, v2.table);
v14.Style = function(v16) --[[ Line: 95 ]] --[[ Name: Style ]]
    -- upvalues: v15 (copy)
    return v15(v16);
end;
local v17 = v2.union(v2.Instance, v2.table);
v14.Instance = function(v18) --[[ Line: 100 ]] --[[ Name: Instance ]]
    -- upvalues: v17 (copy)
    return v17(v18);
end;
v14.Voting = function() --[[ Line: 104 ]] --[[ Name: Voting ]]
    -- upvalues: v2 (copy)
    return v2.strictInterface({
        UpVotes = v2.integer, 
        DownVotes = v2.integer, 
        VoteCount = v2.integer, 
        UpVotePercent = v2.integer, 
        CanVote = v2.optional(v2.boolean), 
        UserVote = v2.optional(v2.boolean)
    });
end;
return v14;