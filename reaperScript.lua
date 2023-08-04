
function CreateFolder(index, name)
  reaper.InsertTrackAtIndex(index, false)
  folder = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(folder, 'P_NAME', name, true)
  reaper.SetMediaTrackInfo_Value( folder, 'I_FOLDERDEPTH',1)
  reaper.SetMediaTrackInfo_Value(folder, 'I_FOLDERCOMPACT', 0)
end

function ImportAudio(index, channel, trackName, fileName, lastInFolder)
  local folderDepth = 0
  if lastInFolder then folderDepth = -1 end

  reaper.SetEditCurPos(0, false, false)
  reaper.InsertTrackAtIndex(index, false)
  tr = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(tr, 'P_NAME', trackName, true)
  reaper.SetMediaTrackInfo_Value( tr, 'I_FOLDERDEPTH',folderDepth)
  reaper.SetOnlyTrackSelected(tr, true)
  reaper.InsertMedia(fileName, 0)
  item = reaper.GetTrackMediaItem(tr, 0)
  take = reaper.GetActiveTake(item)
  reaper.SetMediaItemTakeInfo_Value(take, "I_CHANMODE", channel + 64 + 2)
end

audioFile = "/Users/danielstahl/Documents/Music/Pieces/Module Music/Module Music 6/stage/moduleMusic6Score.caf"

CreateFolder(0, "Middle High")
ImportAudio(1, 1, "Middle High reverb", audioFile, false)
ImportAudio(2, 3, "Middle High clean", audioFile, true)

CreateFolder(3, "Middle")
ImportAudio(4, 5, "Middle reverb", audioFile, false)
ImportAudio(5, 7, "Middle clean", audioFile, true)

CreateFolder(6, "Low")
ImportAudio(7, 9, "Low reverb", audioFile, false)
ImportAudio(8, 11, "Low clean", audioFile, true)

CreateFolder(9, "High")
ImportAudio(10, 13, "High reverb", audioFile, false)
ImportAudio(11, 15, "High clean", audioFile, true)

