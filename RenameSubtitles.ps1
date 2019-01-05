# This script is pointed to base location that contains folders
# Those folders contain .mkv video files and .srt subtitle files
# For VLC to automatically use subtitles, they need to be the same name as the video file
# This is often not the case, so the script will rename the .srt files to match .mkv files

$BaseLocation = ""
$Folders = (Get-ChildItem $BaseLocation).Name

Foreach ($Folder in $Folders) {
    $FolderPath = Join-Path $BaseLocation $Folder
    $VideoFileBaseName = (Get-ChildItem -LiteralPath $FolderPath -Filter *.mkv).BaseName
    $SubtitleFile = Get-ChildItem -LiteralPath $FolderPath -Filter *.srt
    $SubtitleFilePath = Join-Path $FolderPath $SubtitleFile
    $SubtititleFileNewName = $VideoFileBaseName + ".srt"

    Rename-Item -LiteralPath $SubtitleFilePath -NewName $SubtitileFileNewName
    }
