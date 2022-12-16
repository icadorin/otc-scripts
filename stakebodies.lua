local useKnife = true
local useStake = true
local knifeBodies = {6305, 5984}
local stakeBodies = {5973, 6007, 5967, 5962, 18137, 5963, 6006}

macro(200,"Stake Bodies", function()
  for i, tile in ipairs(g_map.getTiles(posz())) do
    for u,item in ipairs(tile:getItems()) do
      if useKnife and table.find(knifeBodies, item:getId()) and findItem(5908) then
          useWith(5908, item)
      end
      if useStake and table.find(stakeBodies, item:getId()) and findItem(5942) then
          useWith(5942, item)
      end
    end
  end
end)