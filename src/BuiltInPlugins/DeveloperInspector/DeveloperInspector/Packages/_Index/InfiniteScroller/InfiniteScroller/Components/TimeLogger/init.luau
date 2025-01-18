local l_Parent_0 = script:FindFirstAncestor("InfiniteScroller").Parent;
local v1 = require(l_Parent_0.Lumberyak).Logger.new(nil, script:GetFullName());
v1:setContext({
    tick = tick, 
    prefix = "{tick}: "
});
return v1;