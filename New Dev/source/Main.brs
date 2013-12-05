sub Main()
	categories = LoadConfig()
	
	if categories.Count() > 1
		ShowPosterScreen(categories, "MRSS", "Template")
	else
		ShowEpisodeScreen(categories[0], categories[0].shortDescriptionLine1, "")
	end if
end sub

function LoadConfig()
	result = []

	app = CreateObject("roAppManager")
	theme = CreateObject("roAssociativeArray")
	theme.OverhangSliceSD = "pkg:/images/overlay.png"
	theme.OverhangSliceHD = "pkg:/images/overlay.png"

	raw = ReadASCIIFile("pkg:/config.opml")
	opml = CreateObject("roXMLElement")
	if opml.Parse(raw)
		theme.backgroundColor = ValidStr(opml.body@backgroundColor)
		
		theme.posterScreenLine1Text = ValidStr(opml.body@posterScreenTitleColor)
		theme.posterScreenLine2Text = ValidStr(opml.body@posterScreenSubtitleColor)
		theme.episodeSynopsisText = ValidStr(opml.body@posterScreenSynopsisColor)
		
		theme.springboardTitleText = ValidStr(opml.body@springboardScreenTitleColor)
		theme.springboardSynopsisColor = ValidStr(opml.body@springboardScreenSynopsisColor)
		theme.springboardRuntimeColor = ValidStr(opml.body@springboardScreenDateColor)
		theme.springboardDirectorColor = ValidStr(opml.body@springboardScreenDirectorColor)
		theme.springboardDirectorLabelColor = ValidStr(opml.body@springboardScreenDirectorColor)
		theme.springboardActorColor = ValidStr(opml.body@springboardScreenActorColor)

		for each category in opml.body.outline
			result.Push(BuildCategory(category))
		next
	end if

	app.SetTheme(theme)
	
	return result
end function

function BuildCategory(category)
	result = {
		shortDescriptionLine1:	ValidStr(category@title)
		shortDescriptionLine2:	ValidStr(category@subtitle)
		sdPosterURL:						ValidStr(category@img)
		hdPosterURL:						ValidStr(category@img)
		url:										ValidStr(category@url)
		categories:							[]
	}
	
	if category.outline.Count() > 0
		for each subCategory in category.outline
			result.categories.Push(BuildCategory(subCategory))
		next
	end if
	
	return result
end function
