diceSide = {5792, 5793, 5794, 5795, 5796, 5797}

macro(1000, "use dice", function()
  for u,item in ipairs(diceSide) do
    use(item)
  end
end)