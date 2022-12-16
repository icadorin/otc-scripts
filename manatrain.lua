macro(10000, "Manatrain",  function()
	if (manapercent() > 70) then
		say(storage.ManatrainText)
	end
end)
addTextEdit("ManatrainText", storage.ManatrainText or "ManatrainText", function(widget, text) 
	storage.ManatrainText = text
end)