# Check for word lists
if ((Get-ChildItem .\words\).count -eq 0) {
    Write-Host "Hey, you forgot to add the word lists!" -ForegroundColor Yellow
    exit
}

# Select number of passwords to generate
$HowManyPasswords = Read-Host "How Many Passwords Would You Like?"
Write-Host "$HowManyPasswords fresh passwords coming right up!
" -ForegroundColor Green

# Get Colour
$ColourList = Get-Content .\words\coloursandadjectives.txt

# Get Animal
$AnimalList = Get-Content .\words\animals.txt

# Randomise Colour
$ColourList = $ColourList | Sort-Object {Get-Random}

# Randomise Animal
$AnimalList = $AnimalList | Sort-Object {Get-Random}

$ThisMany = 1..$HowManyPasswords

foreach ($Password in $ThisMany) {
    
    # Get a random colour
    $GrabColour = Get-Random -InputObject $ColourList -Count 1

    # Get a random animal
    $GrabAnimal = Get-Random -InputObject $AnimalList -Count 1
    
    # Get Random 2 Didget Number
    $GetNumber = Get-Random -Minimum 10 -Maximum 99

    # Convert word to titlecase, make it human readable
    $TextInfo = (Get-Culture).TextInfo
    
    # Output Password, Remove Spaces
    $Output = $Output = $TextInfo.ToTitleCase($GrabColour)+$GrabAnimal+$GetNumber -replace '\s',''

    $Output
}


