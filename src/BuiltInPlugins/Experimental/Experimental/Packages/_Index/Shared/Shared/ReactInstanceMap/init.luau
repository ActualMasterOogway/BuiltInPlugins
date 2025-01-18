local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_inspect_0 = v1.util.inspect;
local v4 = require(script.Parent.getComponentName);
local v5 = {};
local function _(v6) --[[ Line: 35 ]] --[[ Name: isValidFiber ]]
    local v7 = false;
    if v6.tag ~= nil then
        v7 = false;
        if v6.subtreeFlags ~= nil then
            v7 = false;
            if v6.lanes ~= nil then
                v7 = v6.childLanes ~= nil;
            end;
        end;
    end;
    return v7;
end;
v5.remove = function(v9) --[[ Line: 42 ]]
    v9._reactInternals = nil;
end;
v5.get = function(v10) --[[ Line: 46 ]]
    -- upvalues: l_Error_0 (copy), v4 (copy), l_inspect_0 (copy)
    local l__reactInternals_0 = v10._reactInternals;
    local v12 = false;
    if l__reactInternals_0.tag ~= nil then
        v12 = false;
        if l__reactInternals_0.subtreeFlags ~= nil then
            v12 = false;
            if l__reactInternals_0.lanes ~= nil then
                v12 = l__reactInternals_0.childLanes ~= nil;
            end;
        end;
    end;
    if not v12 then
        error(l_Error_0.new("invalid fiber in " .. (v4(v10) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. l_inspect_0(l__reactInternals_0)));
        return l__reactInternals_0;
    else
        if l__reactInternals_0.alternate ~= nil then
            local l_alternate_0 = l__reactInternals_0.alternate;
            v12 = false;
            if l_alternate_0.tag ~= nil then
                v12 = false;
                if l_alternate_0.subtreeFlags ~= nil then
                    v12 = false;
                    if l_alternate_0.lanes ~= nil then
                        v12 = l_alternate_0.childLanes ~= nil;
                    end;
                end;
            end;
            if not v12 then
                error(l_Error_0.new("invalid alternate fiber (" .. (v4(v10) or "UNNAMED alternate") .. ") in " .. (v4(v10) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. l_inspect_0(l__reactInternals_0.alternate)));
            end;
        end;
        return l__reactInternals_0;
    end;
end;
v5.has = function(v14) --[[ Line: 65 ]]
    return v14._reactInternals ~= nil;
end;
v5.set = function(v15, v16) --[[ Line: 69 ]]
    -- upvalues: v4 (copy), l_inspect_0 (copy), l_Error_0 (copy)
    local l_v16_0 = v16;
    local v18 = nil;
    while l_v16_0 ~= nil do
        local l_l_v16_0_0 = l_v16_0;
        local v20 = false;
        if l_l_v16_0_0.tag ~= nil then
            v20 = false;
            if l_l_v16_0_0.subtreeFlags ~= nil then
                v20 = false;
                if l_l_v16_0_0.lanes ~= nil then
                    v20 = l_l_v16_0_0.childLanes ~= nil;
                end;
            end;
        end;
        if not v20 then
            v18 = "invalid fiber in " .. (v4(v15) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. l_inspect_0(l_v16_0) .. "\n";
            if v16 ~= l_v16_0 then
                v18 = v18 .. " (from original fiber " .. (v4(v15) or "UNNAMED Component") .. ")";
            end;
            error(l_Error_0.new(v18));
        elseif l_v16_0.alternate ~= nil then
            l_l_v16_0_0 = l_v16_0.alternate;
            v20 = false;
            if l_l_v16_0_0.tag ~= nil then
                v20 = false;
                if l_l_v16_0_0.subtreeFlags ~= nil then
                    v20 = false;
                    if l_l_v16_0_0.lanes ~= nil then
                        v20 = l_l_v16_0_0.childLanes ~= nil;
                    end;
                end;
            end;
            if not v20 then
                v18 = "invalid alternate fiber (" .. (v4(v15) or "UNNAMED alternate") .. ") in " .. (v4(v15) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. l_inspect_0(l_v16_0.alternate) .. "\n";
                if v16 ~= l_v16_0 then
                    v18 = v18 .. " (from original fiber " .. (v4(v15) or "UNNAMED Component") .. ")";
                end;
                error(l_Error_0.new(v18));
            end;
        end;
        l_v16_0 = l_v16_0.return_;
    end;
    v15._reactInternals = v16;
end;
return v5;