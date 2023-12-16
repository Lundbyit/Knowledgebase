function GenerateIndex($path, $indexFile, $indentLevel = 0) {
    $rootPath = Get-Location
    $currentPath = Join-Path -Path $rootPath -ChildPath $path
    $number = 1

    Get-ChildItem -Path $currentPath -Recurse -Directory |
    Sort-Object -Property FullName |
    ForEach-Object {
        $dir = $_
        $relativePath = $dir.FullName.Substring($rootPath.Path.Length + 1)
        $relativePathWithLink = $relativePath -replace " ", "%20"
        $indent = " " * $indentLevel
        Add-Content -Path $indexFile.FullName -Value ("$indent## " + $number + ". " + $relativePathWithLink)
        $number++
        Get-ChildItem -Path $dir.FullName -File |
        Sort-Object -Property Name |
        ForEach-Object {
            $fileRelativePath = $_.FullName.Substring($rootPath.Path.Length + 1)
            $fileRelativePathWithLink = $fileRelativePath -replace " ", "%20"
            Add-Content -Path $indexFile.FullName -Value ("$indent  - [" + $_.Name + "](" + $fileRelativePathWithLink + ")")
        }
        GenerateIndex -path $relativePath -indexFile $indexFile -indentLevel ($indentLevel + 1)
    }
}

$rootPath = Get-Location
$indexFile = New-Item -Path "$rootPath\Index.md" -ItemType File -Force

Add-Content -Path $indexFile.FullName -Value "# Knowledgebase"
Add-Content -Path $indexFile.FullName -Value ""
Add-Content -Path $indexFile.FullName -Value "Welcome to my knowledgebase!"
Add-Content -Path $indexFile.FullName -Value ""
Add-Content -Path $indexFile.FullName -Value "### How to Use This Index"
Add-Content -Path $indexFile.FullName -Value "- Click on the category links to navigate to specific topics."
Add-Content -Path $indexFile.FullName -Value "- Explore subtopics by clicking on individual Markdown files."
Add-Content -Path $indexFile.FullName -Value ""
Add-Content -Path $indexFile.FullName -Value "Here's an overview of the categories:"

GenerateIndex -path "" -indexFile $indexFile
