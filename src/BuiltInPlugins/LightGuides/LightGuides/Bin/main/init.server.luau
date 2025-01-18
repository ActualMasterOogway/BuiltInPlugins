if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Src.MainPlugin);
    local v2 = nil;
    local v3 = nil;
    local function _() --[[ Line: 12 ]] --[[ Name: init ]]
        -- upvalues: l_Parent_0 (copy), v2 (ref), v1 (copy)
        plugin.Name = l_Parent_0.Name;
        v2 = v1.new();
        v2:renderSelection();
    end;
    local function _() --[[ Line: 18 ]] --[[ Name: shutdown ]]
        -- upvalues: v2 (ref)
        if v2 then
            v2:destroy();
            v2 = nil;
        end;
    end;
    local function _() --[[ Line: 25 ]] --[[ Name: checkEnabled ]]
        -- upvalues: l_Parent_0 (copy), v2 (ref), v1 (copy)
        if settings().Studio["Show Light Guides"] then
            plugin.Name = l_Parent_0.Name;
            v2 = v1.new();
            v2:renderSelection();
            return;
        else
            if v2 then
                v2:destroy();
                v2 = nil;
            end;
            return;
        end;
    end;
    plugin.Unloading:Connect(function() --[[ Line: 33 ]]
        -- upvalues: v2 (ref), v3 (ref)
        if v2 and v2 then
            v2:destroy();
            v2 = nil;
        end;
        if v3 then
            v3:Disconnect();
            v3 = nil;
        end;
    end);
    v3 = settings().Studio:GetPropertyChangedSignal("Show Light Guides"):Connect(function() --[[ Line: 44 ]]
        -- upvalues: l_Parent_0 (copy), v2 (ref), v1 (copy)
        if settings().Studio["Show Light Guides"] then
            plugin.Name = l_Parent_0.Name;
            v2 = v1.new();
            v2:renderSelection();
            return;
        else
            if v2 then
                v2:destroy();
                v2 = nil;
            end;
            return;
        end;
    end);
    if settings().Studio["Show Light Guides"] then
        plugin.Name = l_Parent_0.Name;
        v2 = v1.new();
        v2:renderSelection();
    elseif v2 then
        v2:destroy();
        v2 = nil;
    end;
    return;
end;